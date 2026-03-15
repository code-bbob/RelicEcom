using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

public partial class Checkout : Page
{
    private int customerId;
    private decimal subtotal;
    private decimal shipping;
    private decimal total;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!HttpContext.Current.User.Identity.IsAuthenticated)
        {
            Response.Redirect("~/Login.aspx?ReturnUrl=" + Server.UrlEncode(Request.Url.PathAndQuery));
            return;
        }

        customerId = GetCustomerId();
        if (customerId == 0)
        {
            Response.Redirect("~/Login.aspx");
            return;
        }

        if (!IsPostBack)
        {
            rblPaymentMethod.SelectedValue = "COD";
            TogglePaymentPanels();
            LoadCustomerAddress();
            LoadCartSummary();
        }
        else
        {
            LoadCartSummary();
        }
    }

    private int GetCustomerId()
    {
        string email = HttpContext.Current.User.Identity.Name;
        string query = "SELECT CustomerID FROM Customer WHERE Email = @Email";
        SqlParameter[] parameters = { new SqlParameter("@Email", email) };
        object result = RelicEcommerce.DBHelper.ExecuteScalar(query, parameters);
        return result == null ? 0 : Convert.ToInt32(result);
    }

    private void LoadCustomerAddress()
    {
        string query = "SELECT Address, City, State, ZipCode, Country FROM Customer WHERE CustomerID = @CustomerID";
        SqlParameter[] parameters = { new SqlParameter("@CustomerID", customerId) };
        DataTable dt = RelicEcommerce.DBHelper.ExecuteQuery(query, parameters);
        if (dt.Rows.Count == 0) return;

        DataRow row = dt.Rows[0];
        txtAddress.Text = row["Address"] == DBNull.Value ? string.Empty : row["Address"].ToString();
        txtCity.Text = row["City"] == DBNull.Value ? string.Empty : row["City"].ToString();
        txtState.Text = row["State"] == DBNull.Value ? string.Empty : row["State"].ToString();
        txtZip.Text = row["ZipCode"] == DBNull.Value ? string.Empty : row["ZipCode"].ToString();
        txtCountry.Text = row["Country"] == DBNull.Value ? "Nepal" : row["Country"].ToString();
    }

    private DataTable LoadCartSummary()
    {
        string query = @"SELECT c.ProductID, p.ProductName, c.Quantity,
                         (CASE WHEN p.DiscountPrice > 0 THEN p.DiscountPrice ELSE p.Price END) AS UnitPrice,
                         c.Quantity * (CASE WHEN p.DiscountPrice > 0 THEN p.DiscountPrice ELSE p.Price END) AS LineTotal
                         FROM Cart c
                         INNER JOIN Product p ON p.ProductID = c.ProductID
                         WHERE c.CustomerID = @CustomerID";
        SqlParameter[] parameters = { new SqlParameter("@CustomerID", customerId) };
        DataTable dt = RelicEcommerce.DBHelper.ExecuteQuery(query, parameters);

        rptItems.DataSource = dt;
        rptItems.DataBind();

        subtotal = 0;
        foreach (DataRow row in dt.Rows)
        {
            subtotal += Convert.ToDecimal(row["LineTotal"]);
        }

        shipping = subtotal > 5000 ? 0 : 200;
        total = subtotal + shipping;

        lblSubtotal.Text = subtotal.ToString("N2");
        lblShipping.Text = shipping == 0 ? "FREE" : "Rs. " + shipping.ToString("N2");
        lblTotal.Text = total.ToString("N2");

        return dt;
    }

    protected void btnPlaceOrder_Click(object sender, EventArgs e)
    {
        DataTable cartItems = LoadCartSummary();
        if (cartItems.Rows.Count == 0)
        {
            ShowMessage("Your cart is empty.", true);
            return;
        }

        if (string.IsNullOrWhiteSpace(txtAddress.Text) || string.IsNullOrWhiteSpace(txtCity.Text))
        {
            ShowMessage("Address and city are required.", true);
            return;
        }

        string selectedPaymentMethod = rblPaymentMethod.SelectedValue;
        if (selectedPaymentMethod == "ESEWA_TEST" && string.IsNullOrWhiteSpace(txtEsewaPhone.Text))
        {
            ShowMessage("Please enter eSewa phone/ID for test payment.", true);
            return;
        }

        try
        {
            string orderPaymentStatus = selectedPaymentMethod == "ESEWA_TEST" ? "Paid" : "Pending";

            string orderQuery = @"INSERT INTO [Order]
                                (CustomerID, OrderDate, TotalAmount, OrderStatus, PaymentStatus, ShippingAddress, ShippingCity, ShippingState, ShippingZipCode, ShippingCountry)
                                VALUES
                                (@CustomerID, GETDATE(), @TotalAmount, 'Pending', @PaymentStatus, @ShippingAddress, @ShippingCity, @ShippingState, @ShippingZipCode, @ShippingCountry);
                                SELECT CAST(SCOPE_IDENTITY() AS INT);";

            SqlParameter[] orderParams = {
                new SqlParameter("@CustomerID", customerId),
                new SqlParameter("@TotalAmount", total),
                new SqlParameter("@PaymentStatus", orderPaymentStatus),
                new SqlParameter("@ShippingAddress", txtAddress.Text.Trim()),
                new SqlParameter("@ShippingCity", txtCity.Text.Trim()),
                new SqlParameter("@ShippingState", txtState.Text.Trim()),
                new SqlParameter("@ShippingZipCode", txtZip.Text.Trim()),
                new SqlParameter("@ShippingCountry", txtCountry.Text.Trim())
            };

            int orderId = Convert.ToInt32(RelicEcommerce.DBHelper.ExecuteScalar(orderQuery, orderParams));

            foreach (DataRow row in cartItems.Rows)
            {
                int productId = Convert.ToInt32(row["ProductID"]);
                int qty = Convert.ToInt32(row["Quantity"]);
                decimal unitPrice = Convert.ToDecimal(row["UnitPrice"]);
                decimal lineTotal = Convert.ToDecimal(row["LineTotal"]);

                string itemQuery = @"INSERT INTO Order_Item (OrderID, ProductID, Quantity, UnitPrice, TotalPrice)
                                    VALUES (@OrderID, @ProductID, @Quantity, @UnitPrice, @TotalPrice)";
                SqlParameter[] itemParams = {
                    new SqlParameter("@OrderID", orderId),
                    new SqlParameter("@ProductID", productId),
                    new SqlParameter("@Quantity", qty),
                    new SqlParameter("@UnitPrice", unitPrice),
                    new SqlParameter("@TotalPrice", lineTotal)
                };
                RelicEcommerce.DBHelper.ExecuteNonQuery(itemQuery, itemParams);

                string stockQuery = "UPDATE Product SET StockQuantity = StockQuantity - @Quantity WHERE ProductID = @ProductID";
                SqlParameter[] stockParams = {
                    new SqlParameter("@Quantity", qty),
                    new SqlParameter("@ProductID", productId)
                };
                RelicEcommerce.DBHelper.ExecuteNonQuery(stockQuery, stockParams);
            }

            string paymentMethod = selectedPaymentMethod == "ESEWA_TEST" ? "eSewa Test" : "Cash On Delivery";
            string paymentStatus = selectedPaymentMethod == "ESEWA_TEST" ? "Paid" : "Pending";
            string transactionId = selectedPaymentMethod == "ESEWA_TEST"
                ? "ESEWA-TEST-" + DateTime.Now.ToString("yyyyMMddHHmmss")
                : (string.IsNullOrWhiteSpace(txtEsewaTxnRef.Text) ? null : txtEsewaTxnRef.Text.Trim());

            string paymentQuery = @"INSERT INTO Payment (OrderID, PaymentMethod, PaymentAmount, PaymentDate, PaymentStatus, TransactionID)
                                    VALUES (@OrderID, @PaymentMethod, @PaymentAmount, GETDATE(), @PaymentStatus, @TransactionID)";
            SqlParameter[] paymentParams = {
                new SqlParameter("@OrderID", orderId),
                new SqlParameter("@PaymentMethod", paymentMethod),
                new SqlParameter("@PaymentAmount", total),
                new SqlParameter("@PaymentStatus", paymentStatus),
                new SqlParameter("@TransactionID", string.IsNullOrWhiteSpace(transactionId) ? (object)DBNull.Value : transactionId)
            };
            RelicEcommerce.DBHelper.ExecuteNonQuery(paymentQuery, paymentParams);

            string clearCart = "DELETE FROM Cart WHERE CustomerID = @CustomerID";
            SqlParameter[] clearParams = { new SqlParameter("@CustomerID", customerId) };
            RelicEcommerce.DBHelper.ExecuteNonQuery(clearCart, clearParams);

            ShowMessage(selectedPaymentMethod == "ESEWA_TEST"
                ? "Order placed and eSewa test payment marked as paid. You can view it in My Orders."
                : "Order placed successfully. You can view it in My Orders.", false);
            LoadCartSummary();
        }
        catch (Exception ex)
        {
            ShowMessage("Unable to place order: " + ex.Message, true);
        }
    }

    protected void rblPaymentMethod_SelectedIndexChanged(object sender, EventArgs e)
    {
        TogglePaymentPanels();
    }

    private void TogglePaymentPanels()
    {
        pnlEsewaTest.Visible = rblPaymentMethod.SelectedValue == "ESEWA_TEST";
    }

    private void ShowMessage(string message, bool isError)
    {
        pnlMessage.Visible = true;
        lblMessage.Text = message;
        pnlMessage.CssClass = isError
            ? "mb-4 p-3 rounded-lg bg-red-100 text-red-700"
            : "mb-4 p-3 rounded-lg bg-green-100 text-green-700";
    }
}

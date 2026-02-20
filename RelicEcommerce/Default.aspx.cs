using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCategories();
            LoadFeaturedProducts();
        }
    }

    /// <summary>
    /// Load categories for display
    /// </summary>
    private void LoadCategories()
    {
        try
        {
            string query = "SELECT TOP 6 CategoryID, CategoryName, ImageUrl FROM Category WHERE IsActive = 1 ORDER BY CategoryName";
            DataTable dt = RelicEcommerce.DBHelper.ExecuteQuery(query);
            
            rptCategories.DataSource = dt;
            rptCategories.DataBind();
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine("Error loading categories: " + ex.Message);
        }
    }

    /// <summary>
    /// Load featured products
    /// </summary>
    private void LoadFeaturedProducts()
    {
        try
        {
            string query = @"SELECT TOP 8 
                            ProductID, ProductName, Description, Price, DiscountPrice, 
                            ImageUrl, IsFeatured, StockQuantity
                        FROM Product 
                        WHERE IsActive = 1 AND IsFeatured = 1 AND StockQuantity > 0
                        ORDER BY CreatedDate DESC";
            
            DataTable dt = RelicEcommerce.DBHelper.ExecuteQuery(query);
            
            rptFeaturedProducts.DataSource = dt;
            rptFeaturedProducts.DataBind();
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine("Error loading featured products: " + ex.Message);
        }
    }

    /// <summary>
    /// Add product to cart
    /// </summary>
    protected void AddToCart_Command(object sender, CommandEventArgs e)
    {
        if (!User.Identity.IsAuthenticated)
        {
            Response.Redirect("~/Login.aspx?ReturnUrl=" + Server.UrlEncode(Request.Url.PathAndQuery));
            return;
        }

        try
        {
            int productId = Convert.ToInt32(e.CommandArgument);
            string email = User.Identity.Name;

            // Get customer ID
            string customerQuery = "SELECT CustomerID FROM Customer WHERE Email = @Email";
            SqlParameter[] customerParams = { new SqlParameter("@Email", email) };
            object customerIdObj = RelicEcommerce.DBHelper.ExecuteScalar(customerQuery, customerParams);

            if (customerIdObj != null)
            {
                int customerId = Convert.ToInt32(customerIdObj);

                // Check if product already in cart
                string checkQuery = "SELECT CartID, Quantity FROM Cart WHERE CustomerID = @CustomerID AND ProductID = @ProductID";
                SqlParameter[] checkParams = {
                    new SqlParameter("@CustomerID", customerId),
                    new SqlParameter("@ProductID", productId)
                };

                DataTable dt = RelicEcommerce.DBHelper.ExecuteQuery(checkQuery, checkParams);

                if (dt.Rows.Count > 0)
                {
                    // Update quantity
                    int currentQty = Convert.ToInt32(dt.Rows[0]["Quantity"]);
                    string updateQuery = "UPDATE Cart SET Quantity = @Quantity WHERE CustomerID = @CustomerID AND ProductID = @ProductID";
                    SqlParameter[] updateParams = {
                        new SqlParameter("@Quantity", currentQty + 1),
                        new SqlParameter("@CustomerID", customerId),
                        new SqlParameter("@ProductID", productId)
                    };
                    RelicEcommerce.DBHelper.ExecuteNonQuery(updateQuery, updateParams);
                }
                else
                {
                    // Add new item to cart
                    string insertQuery = "INSERT INTO Cart (CustomerID, ProductID, Quantity, AddedDate) VALUES (@CustomerID, @ProductID, 1, GETDATE())";
                    SqlParameter[] insertParams = {
                        new SqlParameter("@CustomerID", customerId),
                        new SqlParameter("@ProductID", productId)
                    };
                    RelicEcommerce.DBHelper.ExecuteNonQuery(insertQuery, insertParams);
                }

                // Show success message and refresh page
                Response.Redirect(Request.RawUrl);
            }
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine("Error adding to cart: " + ex.Message);
        }
    }
}

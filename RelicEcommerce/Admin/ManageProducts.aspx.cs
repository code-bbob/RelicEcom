using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;

public partial class Admin_ManageProducts : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!HttpContext.Current.User.Identity.IsAuthenticated)
        {
            Response.Redirect("~/Login.aspx");
            return;
        }

        if (!IsUserAdmin())
        {
            Response.Redirect("~/Default.aspx");
            return;
        }

        if (!IsPostBack)
        {
            LoadCategories();
            LoadProducts();
        }
    }

    private bool IsUserAdmin()
    {
        try
        {
            string email = HttpContext.Current.User.Identity.Name;
            string query = "SELECT IsAdmin FROM Customer WHERE Email = @Email";
            SqlParameter[] parameters = { new SqlParameter("@Email", email) };
            object result = RelicEcommerce.DBHelper.ExecuteScalar(query, parameters);
            return result != null && Convert.ToBoolean(result);
        }
        catch
        {
            return false;
        }
    }

    private void LoadProducts()
    {
        string query = @"SELECT p.ProductID, p.ProductName, c.CategoryName, p.Price, p.StockQuantity, p.IsActive
                         FROM Product p
                         INNER JOIN Category c ON p.CategoryID = c.CategoryID
                         ORDER BY p.CreatedDate DESC";
        DataTable dt = RelicEcommerce.DBHelper.ExecuteQuery(query);
        gvProducts.DataSource = dt;
        gvProducts.DataBind();
    }

    private void LoadCategories()
    {
        string query = "SELECT CategoryID, CategoryName FROM Category WHERE IsActive = 1 ORDER BY CategoryName";
        DataTable dt = RelicEcommerce.DBHelper.ExecuteQuery(query);
        ddlCategory.DataSource = dt;
        ddlCategory.DataTextField = "CategoryName";
        ddlCategory.DataValueField = "CategoryID";
        ddlCategory.DataBind();
        ddlCategory.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select Category", ""));
    }

    protected void btnAddProduct_Click(object sender, EventArgs e)
    {
        try
        {
            string productName = txtProductName.Text.Trim();
            string description = txtDescription.Text.Trim();
            string imageUrl = "/Images/placeholder.jpg";

            if (string.IsNullOrEmpty(productName) || string.IsNullOrEmpty(ddlCategory.SelectedValue) ||
                string.IsNullOrEmpty(txtPrice.Text.Trim()) || string.IsNullOrEmpty(txtStockQuantity.Text.Trim()))
            {
                ShowMessage("Product name, category, price, and stock are required.", true);
                return;
            }

            decimal price;
            int stockQuantity;
            decimal discountPrice = 0;

            if (!decimal.TryParse(txtPrice.Text.Trim(), out price) || price < 0)
            {
                ShowMessage("Enter a valid price.", true);
                return;
            }

            if (!int.TryParse(txtStockQuantity.Text.Trim(), out stockQuantity) || stockQuantity < 0)
            {
                ShowMessage("Enter a valid stock quantity.", true);
                return;
            }

            if (!string.IsNullOrEmpty(txtDiscountPrice.Text.Trim()))
            {
                if (!decimal.TryParse(txtDiscountPrice.Text.Trim(), out discountPrice) || discountPrice < 0)
                {
                    ShowMessage("Enter a valid discount price.", true);
                    return;
                }
            }

            if (fuProductImage.HasFile)
            {
                string extension = Path.GetExtension(fuProductImage.FileName).ToLowerInvariant();
                if (extension != ".jpg" && extension != ".jpeg" && extension != ".png" && extension != ".webp")
                {
                    ShowMessage("Only JPG, JPEG, PNG, and WEBP images are allowed.", true);
                    return;
                }

                string productsFolder = Server.MapPath("~/Images/products/");
                if (!Directory.Exists(productsFolder))
                {
                    Directory.CreateDirectory(productsFolder);
                }

                string fileName = "product_" + DateTime.Now.ToString("yyyyMMddHHmmssfff") + extension;
                string fullPath = Path.Combine(productsFolder, fileName);
                fuProductImage.SaveAs(fullPath);
                imageUrl = "/Images/products/" + fileName;
            }

            string query = @"INSERT INTO Product
                             (ProductName, Description, Price, DiscountPrice, CategoryID, StockQuantity, ImageUrl, IsActive, IsFeatured, CreatedDate)
                             VALUES
                             (@ProductName, @Description, @Price, @DiscountPrice, @CategoryID, @StockQuantity, @ImageUrl, 1, 0, GETDATE())";

            SqlParameter[] parameters = {
                new SqlParameter("@ProductName", productName),
                new SqlParameter("@Description", description),
                new SqlParameter("@Price", price),
                new SqlParameter("@DiscountPrice", discountPrice > 0 ? (object)discountPrice : DBNull.Value),
                new SqlParameter("@CategoryID", Convert.ToInt32(ddlCategory.SelectedValue)),
                new SqlParameter("@StockQuantity", stockQuantity),
                new SqlParameter("@ImageUrl", imageUrl)
            };

            RelicEcommerce.DBHelper.ExecuteNonQuery(query, parameters);
            ClearForm();
            LoadProducts();
            ShowMessage("Product added successfully.", false);
        }
        catch (Exception ex)
        {
            ShowMessage("Unable to add product: " + ex.Message, true);
        }
    }

    private void ClearForm()
    {
        txtProductName.Text = string.Empty;
        txtDescription.Text = string.Empty;
        txtPrice.Text = string.Empty;
        txtDiscountPrice.Text = string.Empty;
        txtStockQuantity.Text = string.Empty;
        ddlCategory.SelectedIndex = 0;
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

using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI;

public partial class SiteMaster : MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (User.Identity.IsAuthenticated)
            {
                UpdateCartCount();
            }
        }
    }

    /// <summary>
    /// Update cart item count in header
    /// </summary>
    private void UpdateCartCount()
    {
        try
        {
            string email = User.Identity.Name;
            
            // Get customer ID from email
            string customerQuery = "SELECT CustomerID FROM Customer WHERE Email = @Email";
            SqlParameter[] customerParams = { new SqlParameter("@Email", email) };
            
            object customerIdObj = RelicEcommerce.DBHelper.ExecuteScalar(customerQuery, customerParams);
            
            if (customerIdObj != null)
            {
                int customerId = Convert.ToInt32(customerIdObj);
                
                // Get cart count
                string cartQuery = "SELECT ISNULL(SUM(Quantity), 0) FROM Cart WHERE CustomerID = @CustomerID";
                SqlParameter[] cartParams = { new SqlParameter("@CustomerID", customerId) };
                
                int cartCount = Convert.ToInt32(RelicEcommerce.DBHelper.ExecuteScalar(cartQuery, cartParams));
                lblCartCount.Text = cartCount.ToString();
            }
        }
        catch (Exception ex)
        {
            // Log error
            System.Diagnostics.Debug.WriteLine("Error updating cart count: " + ex.Message);
        }
    }

    /// <summary>
    /// Check if current user is admin
    /// </summary>
    protected bool IsUserAdmin()
    {
        if (!User.Identity.IsAuthenticated)
            return false;

        try
        {
            string email = User.Identity.Name;
            string query = "SELECT IsAdmin FROM Customer WHERE Email = @Email";
            SqlParameter[] parameters = { new SqlParameter("@Email", email) };
            
            object result = RelicEcommerce.DBHelper.ExecuteScalar(query, parameters);
            
            if (result != null)
            {
                return Convert.ToBoolean(result);
            }
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine("Error checking admin status: " + ex.Message);
        }
        
        return false;
    }

    /// <summary>
    /// Logout handler
    /// </summary>
    protected void Logout_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Session.Clear();
        Session.Abandon();
        Response.Redirect("~/Default.aspx");
    }
}

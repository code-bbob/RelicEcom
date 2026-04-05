using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI;
using System.Web;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            System.Diagnostics.Debug.WriteLine("[SiteMaster] Page_Load started");

            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                UpdateCartCount();
            }
            else if (lblCartCount != null)
            {
                lblCartCount.Text = "0";
            }

            System.Diagnostics.Debug.WriteLine("[SiteMaster] Page_Load completed");
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine("[SiteMaster] ERROR in Page_Load: " + ex.Message);
        }
    }

    /// <summary>
    /// Update cart item count in header
    /// </summary>
    private void UpdateCartCount()
    {
        try
        {
            string email = HttpContext.Current.User.Identity.Name;

            if (string.IsNullOrWhiteSpace(email))
            {
                lblCartCount.Text = "0";
                return;
            }
            
            // Get customer ID from email
            string customerQuery = "SELECT CustomerID FROM Customer WHERE Email = @Email";
            SqlParameter[] customerParams = { new SqlParameter("@Email", email) };
            
            object customerIdObj = KalaSmriti.DBHelper.ExecuteScalar(customerQuery, customerParams);
            
            if (customerIdObj != null)
            {
                int customerId = Convert.ToInt32(customerIdObj);
                
                // Get cart count
                string cartQuery = "SELECT ISNULL(SUM(Quantity), 0) FROM Cart WHERE CustomerID = @CustomerID";
                SqlParameter[] cartParams = { new SqlParameter("@CustomerID", customerId) };
                
                int cartCount = Convert.ToInt32(KalaSmriti.DBHelper.ExecuteScalar(cartQuery, cartParams));
                lblCartCount.Text = cartCount.ToString();
            }
            else
            {
                lblCartCount.Text = "0";
            }
        }
        catch (Exception ex)
        {
            // Log error
            System.Diagnostics.Debug.WriteLine("Error updating cart count: " + ex.Message);
            lblCartCount.Text = "0";
        }
    }

    /// <summary>
    /// Check if current user is admin
    /// </summary>
    protected bool IsUserAdmin()
    {
        if (!HttpContext.Current.User.Identity.IsAuthenticated)
            return false;

        try
        {
            string email = HttpContext.Current.User.Identity.Name;
            string query = "SELECT IsAdmin FROM Customer WHERE Email = @Email";
            SqlParameter[] parameters = { new SqlParameter("@Email", email) };
            
            object result = KalaSmriti.DBHelper.ExecuteScalar(query, parameters);
            
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


using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI;

public partial class Login : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // If user is already logged in, redirect to home
            if (User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Default.aspx");
            }
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
            return;

        try
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Query to check user credentials
            string query = @"SELECT CustomerID, FirstName, LastName, IsAdmin, Password 
                           FROM Customer 
                           WHERE Email = @Email";

            SqlParameter[] parameters = {
                new SqlParameter("@Email", email)
            };

            DataTable dt = RelicEcommerce.DBHelper.ExecuteQuery(query, parameters);

            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];
                string storedPassword = row["Password"].ToString();

                // In production, use hashed passwords (bcrypt, PBKDF2, etc.)
                // For demo purposes, plain text comparison
                if (password == storedPassword)
                {
                    // Update last login
                    string updateQuery = "UPDATE Customer SET LastLogin = GETDATE() WHERE Email = @Email";
                    RelicEcommerce.DBHelper.ExecuteNonQuery(updateQuery, parameters);

                    // Create authentication ticket
                    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
                        1,
                        email,
                        DateTime.Now,
                        DateTime.Now.AddMinutes(chkRememberMe.Checked ? 43200 : 30), // 30 days or 30 minutes
                        chkRememberMe.Checked,
                        row["IsAdmin"].ToString(),
                        FormsAuthentication.FormsCookiePath
                    );

                    string encryptedTicket = FormsAuthentication.Encrypt(ticket);
                    System.Web.HttpCookie authCookie = new System.Web.HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);
                    
                    if (chkRememberMe.Checked)
                    {
                        authCookie.Expires = ticket.Expiration;
                    }
                    
                    Response.Cookies.Add(authCookie);

                    // Store user info in session
                    Session["CustomerID"] = row["CustomerID"];
                    Session["FirstName"] = row["FirstName"];
                    Session["LastName"] = row["LastName"];
                    Session["IsAdmin"] = Convert.ToBoolean(row["IsAdmin"]);

                    // Redirect based on user role
                    string returnUrl = Request.QueryString["ReturnUrl"];
                    
                    if (!string.IsNullOrEmpty(returnUrl))
                    {
                        Response.Redirect(returnUrl);
                    }
                    else if (Convert.ToBoolean(row["IsAdmin"]))
                    {
                        Response.Redirect("~/Admin/Dashboard.aspx");
                    }
                    else
                    {
                        Response.Redirect("~/Default.aspx");
                    }
                }
                else
                {
                    ShowError("Invalid email or password. Please try again.");
                }
            }
            else
            {
                ShowError("Invalid email or password. Please try again.");
            }
        }
        catch (Exception ex)
        {
            ShowError("An error occurred during login. Please try again later.");
            System.Diagnostics.Debug.WriteLine("Login error: " + ex.Message);
        }
    }

    private void ShowError(string message)
    {
        lblError.Text = message;
        pnlError.Visible = true;
    }
}

using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web;

public partial class Register : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // If user is already logged in, redirect to home
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Default.aspx");
            }
        }
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid || !chkTerms.Checked)
        {
            if (!chkTerms.Checked)
            {
                ShowError("You must agree to the terms and conditions.");
            }
            return;
        }

        try
        {
            string email = txtEmail.Text.Trim();
            
            // Check if email already exists
            if (RelicEcommerce.DBHelper.RecordExists("Customer", "Email", email))
            {
                ShowError("This email is already registered. Please use a different email or login.");
                return;
            }

            // Validate password length
            if (txtPassword.Text.Length < 6)
            {
                ShowError("Password must be at least 6 characters long.");
                return;
            }

            // Insert new customer
            string query = @"INSERT INTO Customer 
                (FirstName, LastName, Email, Password, Phone, Address, City, State, ZipCode, Country, IsAdmin, CreatedDate) 
                VALUES 
                (@FirstName, @LastName, @Email, @Password, @Phone, @Address, @City, @State, @ZipCode, @Country, 0, GETDATE())";

            SqlParameter[] parameters = {
                new SqlParameter("@FirstName", txtFirstName.Text.Trim()),
                new SqlParameter("@LastName", txtLastName.Text.Trim()),
                new SqlParameter("@Email", email),
                new SqlParameter("@Password", txtPassword.Text.Trim()), // In production, hash the password!
                new SqlParameter("@Phone", string.IsNullOrEmpty(txtPhone.Text) ? (object)DBNull.Value : txtPhone.Text.Trim()),
                new SqlParameter("@Address", string.IsNullOrEmpty(txtAddress.Text) ? (object)DBNull.Value : txtAddress.Text.Trim()),
                new SqlParameter("@City", string.IsNullOrEmpty(txtCity.Text) ? (object)DBNull.Value : txtCity.Text.Trim()),
                new SqlParameter("@State", string.IsNullOrEmpty(txtState.Text) ? (object)DBNull.Value : txtState.Text.Trim()),
                new SqlParameter("@ZipCode", string.IsNullOrEmpty(txtZipCode.Text) ? (object)DBNull.Value : txtZipCode.Text.Trim()),
                new SqlParameter("@Country", string.IsNullOrEmpty(txtCountry.Text) ? "Nepal" : txtCountry.Text.Trim())
            };

            int result = RelicEcommerce.DBHelper.ExecuteNonQuery(query, parameters);

            if (result > 0)
            {
                ShowSuccess("Registration successful! Redirecting to login page...");
                
                // Clear form
                ClearForm();
                
                // Redirect to login page after 2 seconds
                Response.AddHeader("REFRESH", "2;URL=Login.aspx");
            }
            else
            {
                ShowError("Registration failed. Please try again.");
            }
        }
        catch (Exception ex)
        {
            ShowError("An error occurred during registration. Please try again later.");
            System.Diagnostics.Debug.WriteLine("Registration error: " + ex.Message);
        }
    }

    private void ShowError(string message)
    {
        lblError.Text = message;
        pnlError.Visible = true;
        pnlSuccess.Visible = false;
    }

    private void ShowSuccess(string message)
    {
        lblSuccess.Text = message;
        pnlSuccess.Visible = true;
        pnlError.Visible = false;
    }

    private void ClearForm()
    {
        txtFirstName.Text = "";
        txtLastName.Text = "";
        txtEmail.Text = "";
        txtPhone.Text = "";
        txtPassword.Text = "";
        txtConfirmPassword.Text = "";
        txtAddress.Text = "";
        txtCity.Text = "";
        txtState.Text = "";
        txtZipCode.Text = "";
        txtCountry.Text = "Nepal";
        chkTerms.Checked = false;
    }
}

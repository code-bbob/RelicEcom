using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManageUsers : Page
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
            LoadUsers();
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

    private void LoadUsers()
    {
        string query = @"SELECT CustomerID, FirstName + ' ' + LastName AS FullName, Email, IsAdmin, CreatedDate
                         FROM Customer
                         ORDER BY CreatedDate DESC";
        DataTable dt = RelicEcommerce.DBHelper.ExecuteQuery(query);
        gvUsers.DataSource = dt;
        gvUsers.DataBind();
    }

    protected void gvUsers_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.DataRow)
            return;

        DropDownList ddlIsAdmin = e.Row.FindControl("ddlIsAdmin") as DropDownList;
        HiddenField hfIsAdmin = e.Row.FindControl("hfIsAdmin") as HiddenField;

        if (ddlIsAdmin != null && hfIsAdmin != null)
        {
            ListItem item = ddlIsAdmin.Items.FindByValue(hfIsAdmin.Value);
            if (item != null)
            {
                ddlIsAdmin.ClearSelection();
                item.Selected = true;
            }
        }
    }

    protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName != "UpdateUserRole")
            return;

        int rowIndex = Convert.ToInt32(e.CommandArgument);
        int customerId = Convert.ToInt32(gvUsers.DataKeys[rowIndex].Value);
        GridViewRow row = gvUsers.Rows[rowIndex];
        DropDownList ddlIsAdmin = row.FindControl("ddlIsAdmin") as DropDownList;

        if (ddlIsAdmin == null)
            return;

        try
        {
            bool isAdmin = ddlIsAdmin.SelectedValue == "1";
            string query = "UPDATE Customer SET IsAdmin = @IsAdmin WHERE CustomerID = @CustomerID";
            SqlParameter[] parameters = {
                new SqlParameter("@IsAdmin", isAdmin),
                new SqlParameter("@CustomerID", customerId)
            };

            RelicEcommerce.DBHelper.ExecuteNonQuery(query, parameters);
            ShowMessage("User role updated.", false);
            LoadUsers();
        }
        catch (Exception ex)
        {
            ShowMessage("Unable to update user role: " + ex.Message, true);
        }
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

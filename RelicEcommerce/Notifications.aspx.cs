using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

public partial class Notifications : Page
{
    private int customerId;

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
            LoadNotifications();
        }
    }

    protected void btnMarkRead_Click(object sender, EventArgs e)
    {
        try
        {
            RelicEcommerce.NotificationService.MarkAllAsRead(customerId);
            ShowMessage("All notifications marked as read.", false);
            LoadNotifications();
        }
        catch (Exception ex)
        {
            ShowMessage("Unable to update notifications: " + ex.Message, true);
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

    private void LoadNotifications()
    {
        DataTable dt = RelicEcommerce.NotificationService.GetUserNotifications(customerId);
        rptNotifications.DataSource = dt;
        rptNotifications.DataBind();
        pnlEmpty.Visible = dt.Rows.Count == 0;
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

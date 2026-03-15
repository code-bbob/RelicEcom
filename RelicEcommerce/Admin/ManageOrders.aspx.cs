using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManageOrders : Page
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
            LoadOrders();
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

    private void LoadOrders()
    {
        string query = @"SELECT o.OrderID, c.FirstName + ' ' + c.LastName AS CustomerName, o.OrderDate, o.TotalAmount, o.OrderStatus, o.PaymentStatus
                         FROM [Order] o
                         INNER JOIN Customer c ON o.CustomerID = c.CustomerID
                         ORDER BY o.OrderDate DESC";
        DataTable dt = RelicEcommerce.DBHelper.ExecuteQuery(query);
        gvOrders.DataSource = dt;
        gvOrders.DataBind();
    }

    protected void gvOrders_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.DataRow)
            return;

        DropDownList ddlOrderStatus = e.Row.FindControl("ddlOrderStatus") as DropDownList;
        DropDownList ddlPaymentStatus = e.Row.FindControl("ddlPaymentStatus") as DropDownList;
        HiddenField hfOrderStatus = e.Row.FindControl("hfOrderStatus") as HiddenField;
        HiddenField hfPaymentStatus = e.Row.FindControl("hfPaymentStatus") as HiddenField;

        if (ddlOrderStatus != null && hfOrderStatus != null)
        {
            ListItem orderStatusItem = ddlOrderStatus.Items.FindByValue(hfOrderStatus.Value);
            if (orderStatusItem != null)
            {
                ddlOrderStatus.ClearSelection();
                orderStatusItem.Selected = true;
            }
        }

        if (ddlPaymentStatus != null && hfPaymentStatus != null)
        {
            ListItem paymentStatusItem = ddlPaymentStatus.Items.FindByValue(hfPaymentStatus.Value);
            if (paymentStatusItem != null)
            {
                ddlPaymentStatus.ClearSelection();
                paymentStatusItem.Selected = true;
            }
        }
    }

    protected void gvOrders_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName != "UpdateOrder")
            return;

        int rowIndex = Convert.ToInt32(e.CommandArgument);
        int orderId = Convert.ToInt32(gvOrders.DataKeys[rowIndex].Value);
        GridViewRow row = gvOrders.Rows[rowIndex];
        DropDownList ddlOrderStatus = row.FindControl("ddlOrderStatus") as DropDownList;
        DropDownList ddlPaymentStatus = row.FindControl("ddlPaymentStatus") as DropDownList;

        if (ddlOrderStatus == null || ddlPaymentStatus == null)
            return;

        try
        {
            string query = "UPDATE [Order] SET OrderStatus = @OrderStatus, PaymentStatus = @PaymentStatus WHERE OrderID = @OrderID";
            SqlParameter[] parameters = {
                new SqlParameter("@OrderStatus", ddlOrderStatus.SelectedValue),
                new SqlParameter("@PaymentStatus", ddlPaymentStatus.SelectedValue),
                new SqlParameter("@OrderID", orderId)
            };

            RelicEcommerce.DBHelper.ExecuteNonQuery(query, parameters);
            ShowMessage("Order updated successfully.", false);
            LoadOrders();
        }
        catch (Exception ex)
        {
            ShowMessage("Unable to update order: " + ex.Message, true);
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

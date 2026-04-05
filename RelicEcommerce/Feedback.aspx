<%@ Page Title="Order Feedback" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="bg-gray-50 min-h-screen py-8">
        <div class="container mx-auto px-4 max-w-4xl">
            <h1 class="text-3xl font-bold text-gray-800 mb-6">Rate Your Order</h1>

            <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="mb-4 p-3 rounded-lg">
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </asp:Panel>

            <asp:Panel ID="pnlFeedbackForm" runat="server" Visible="true" CssClass="bg-white rounded-lg shadow-md p-6">
                <h2 class="text-xl font-semibold text-gray-800 mb-4">Product Feedback</h2>

                <asp:Repeater ID="rptProducts" runat="server">
                    <ItemTemplate>
                        <div class="border border-gray-200 rounded-lg p-4 mb-4">
                            <asp:HiddenField ID="hfProductId" runat="server" Value='<%# Eval("ProductID") %>' />
                            <asp:HiddenField ID="hfExistingRating" runat="server" Value='<%# Eval("ExistingRating") == DBNull.Value ? "" : Eval("ExistingRating").ToString() %>' />
                            <asp:HiddenField ID="hfExistingReview" runat="server" Value='<%# Eval("ExistingReview") == DBNull.Value ? "" : Eval("ExistingReview").ToString() %>' />
                            <h3 class="text-lg font-semibold text-gray-800"><%# Eval("ProductName") %></h3>
                            <p class="text-sm text-gray-500 mb-3">Quantity: <%# Eval("Quantity") %></p>

                            <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                                <asp:DropDownList ID="ddlRating" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg">
                                    <asp:ListItem Value="">Select Rating</asp:ListItem>
                                    <asp:ListItem Value="5">5 - Excellent</asp:ListItem>
                                    <asp:ListItem Value="4">4 - Very Good</asp:ListItem>
                                    <asp:ListItem Value="3">3 - Good</asp:ListItem>
                                    <asp:ListItem Value="2">2 - Fair</asp:ListItem>
                                    <asp:ListItem Value="1">1 - Poor</asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="txtReview" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg" placeholder="Write product feedback"></asp:TextBox>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <h2 class="text-xl font-semibold text-gray-800 mt-8 mb-4">Transaction Feedback</h2>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                    <asp:DropDownList ID="ddlTransactionRating" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg">
                        <asp:ListItem Value="">Rate overall transaction</asp:ListItem>
                        <asp:ListItem Value="5">5 - Excellent</asp:ListItem>
                        <asp:ListItem Value="4">4 - Very Good</asp:ListItem>
                        <asp:ListItem Value="3">3 - Good</asp:ListItem>
                        <asp:ListItem Value="2">2 - Fair</asp:ListItem>
                        <asp:ListItem Value="1">1 - Poor</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="txtTransactionComment" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg" placeholder="Share experience for payment and delivery"></asp:TextBox>
                </div>

                <div class="mt-6 flex gap-3">
                    <asp:Button ID="btnSubmitFeedback" runat="server" Text="Submit Feedback" OnClick="btnSubmitFeedback_Click"
                        CssClass="bg-amber-600 text-white px-6 py-2 rounded-lg hover:bg-amber-700 transition font-semibold" />
                    <a href="Orders.aspx" class="bg-gray-200 text-gray-700 px-6 py-2 rounded-lg hover:bg-gray-300 transition font-semibold">Back to Orders</a>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

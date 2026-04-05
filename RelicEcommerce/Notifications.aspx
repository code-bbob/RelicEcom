<%@ Page Title="Notifications" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Notifications.aspx.cs" Inherits="Notifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="bg-gray-50 min-h-screen py-8">
        <div class="container mx-auto px-4 max-w-4xl">
            <div class="flex items-center justify-between mb-6">
                <h1 class="text-3xl font-bold text-gray-800">My Notifications</h1>
                <asp:Button ID="btnMarkRead" runat="server" Text="Mark All as Read" OnClick="btnMarkRead_Click"
                    CssClass="bg-amber-600 text-white px-4 py-2 rounded-lg hover:bg-amber-700 transition font-semibold" />
            </div>

            <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="mb-4 p-3 rounded-lg">
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </asp:Panel>

            <asp:Repeater ID="rptNotifications" runat="server">
                <ItemTemplate>
                    <div class='bg-white rounded-lg shadow-md p-5 mb-4 border-l-4 <%# Convert.ToBoolean(Eval("IsRead")) ? "border-gray-300" : "border-amber-500" %>'>
                        <div class="flex items-start justify-between gap-3">
                            <div>
                                <h3 class="text-lg font-semibold text-gray-800"><%# Eval("Title") %></h3>
                                <p class="text-gray-600 mt-1"><%# Eval("Message") %></p>
                            </div>
                            <span class="text-xs text-gray-500 whitespace-nowrap"><%# string.Format("{0:yyyy-MM-dd HH:mm}", Eval("CreatedDate")) %></span>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <asp:Panel ID="pnlEmpty" runat="server" Visible="false" CssClass="bg-white rounded-lg shadow-md p-8 text-center text-gray-600">
                You do not have any notifications yet.
            </asp:Panel>
        </div>
    </div>
</asp:Content>

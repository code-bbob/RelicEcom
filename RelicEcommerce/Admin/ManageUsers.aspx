<%@ Page Title="Manage Users" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs" Inherits="Admin_ManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="bg-gray-50 min-h-screen py-8">
        <div class="container mx-auto px-4">
            <div class="flex items-center justify-between mb-6">
                <h1 class="text-3xl font-bold text-gray-800">Manage Users</h1>
                <a href="Dashboard.aspx" class="bg-gray-200 text-gray-700 px-4 py-2 rounded-lg hover:bg-gray-300 transition">Back to Dashboard</a>
            </div>

            <div class="bg-white rounded-lg shadow-md p-6">
                <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="mb-4 p-3 rounded-lg">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </asp:Panel>

                <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="false" CssClass="w-full" GridLines="None" DataKeyNames="CustomerID" OnRowCommand="gvUsers_RowCommand" OnRowDataBound="gvUsers_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="CustomerID" HeaderText="ID" />
                        <asp:BoundField DataField="FullName" HeaderText="Name" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:TemplateField HeaderText="Admin Role">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlIsAdmin" runat="server" CssClass="px-2 py-1 border border-gray-300 rounded">
                                    <asp:ListItem Value="0" Text="User"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="Admin"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:HiddenField ID="hfIsAdmin" runat="server" Value='<%# Convert.ToBoolean(Eval("IsAdmin")) ? "1" : "0" %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CreatedDate" HeaderText="Created" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnUpdateUser" runat="server" CommandName="UpdateUserRole" CommandArgument='<%# Container.DataItemIndex %>' CssClass="text-blue-600 hover:text-blue-800">Update Role</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="bg-gray-100 text-gray-700 font-semibold py-3 px-4 text-left" />
                    <RowStyle CssClass="border-b border-gray-200 py-3 px-4" />
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

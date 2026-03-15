<%@ Page Title="My Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="bg-gray-50 min-h-screen py-8">
        <div class="container mx-auto px-4 max-w-3xl">
            <h1 class="text-3xl font-bold text-gray-800 mb-6">My Profile</h1>

            <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="mb-4 p-3 rounded-lg">
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </asp:Panel>

            <div class="bg-white rounded-lg shadow-md p-6">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg" placeholder="First name"></asp:TextBox>
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg" placeholder="Last name"></asp:TextBox>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg md:col-span-2" placeholder="Email" ReadOnly="true"></asp:TextBox>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg" placeholder="Phone"></asp:TextBox>
                    <asp:TextBox ID="txtCity" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg" placeholder="City"></asp:TextBox>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg md:col-span-2" placeholder="Address"></asp:TextBox>
                    <asp:TextBox ID="txtState" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg" placeholder="State"></asp:TextBox>
                    <asp:TextBox ID="txtZip" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg" placeholder="Zip Code"></asp:TextBox>
                    <asp:TextBox ID="txtCountry" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg md:col-span-2" placeholder="Country"></asp:TextBox>
                </div>

                <div class="mt-4">
                    <asp:Button ID="btnSave" runat="server" Text="Save Changes" OnClick="btnSave_Click"
                        CssClass="bg-amber-600 text-white px-6 py-2 rounded-lg hover:bg-amber-700 transition font-semibold" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

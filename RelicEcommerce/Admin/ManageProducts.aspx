<%@ Page Title="Manage Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ManageProducts.aspx.cs" Inherits="Admin_ManageProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="bg-gray-50 min-h-screen py-8">
        <div class="container mx-auto px-4">
            <div class="flex items-center justify-between mb-6">
                <h1 class="text-3xl font-bold text-gray-800">Manage Products</h1>
                <a href="Dashboard.aspx" class="bg-gray-200 text-gray-700 px-4 py-2 rounded-lg hover:bg-gray-300 transition">Back to Dashboard</a>
            </div>

            <div class="bg-white rounded-lg shadow-md p-6 mb-6">
                <h2 class="text-xl font-bold text-gray-800 mb-4">Add Product</h2>
                <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="mb-4 p-3 rounded-lg">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </asp:Panel>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Product Name</label>
                        <asp:TextBox ID="txtProductName" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg" />
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Category</label>
                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg"></asp:DropDownList>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Price</label>
                        <asp:TextBox ID="txtPrice" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg" TextMode="Number" />
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Discount Price (optional)</label>
                        <asp:TextBox ID="txtDiscountPrice" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg" TextMode="Number" />
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Stock Quantity</label>
                        <asp:TextBox ID="txtStockQuantity" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg" TextMode="Number" />
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Upload Image</label>
                        <asp:FileUpload ID="fuProductImage" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg" />
                    </div>
                    <div class="md:col-span-2">
                        <label class="block text-sm font-medium text-gray-700 mb-1">Description</label>
                        <asp:TextBox ID="txtDescription" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg" TextMode="MultiLine" Rows="4" />
                    </div>
                </div>

                <div class="mt-4">
                    <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" OnClick="btnAddProduct_Click"
                        CssClass="bg-amber-600 text-white px-6 py-2 rounded-lg hover:bg-amber-700 transition font-semibold" />
                </div>
            </div>

            <div class="bg-white rounded-lg shadow-md p-6">
                <h2 class="text-xl font-bold text-gray-800 mb-4">Existing Products</h2>
                <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="false" CssClass="w-full" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="ProductID" HeaderText="ID" />
                        <asp:BoundField DataField="ProductName" HeaderText="Product" />
                        <asp:BoundField DataField="CategoryName" HeaderText="Category" />
                        <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="Rs. {0:N2}" />
                        <asp:BoundField DataField="StockQuantity" HeaderText="Stock" />
                        <asp:BoundField DataField="IsActive" HeaderText="Active" />
                    </Columns>
                    <HeaderStyle CssClass="bg-gray-100 text-gray-700 font-semibold py-3 px-4 text-left" />
                    <RowStyle CssClass="border-b border-gray-200 py-3 px-4" />
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

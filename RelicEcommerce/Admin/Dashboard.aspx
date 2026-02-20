<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Admin_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="bg-gray-50 min-h-screen py-8">
        <div class="container mx-auto px-4">
            <!-- Header -->
            <div class="mb-8">
                <h1 class="text-4xl font-bold text-gray-800 mb-2">Admin Dashboard</h1>
                <p class="text-gray-600">Welcome back, manage your e-commerce store</p>
            </div>

            <!-- Statistics Cards -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
                <!-- Total Products -->
                <div class="bg-white rounded-lg shadow-md p-6">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-gray-500 text-sm mb-1">Total Products</p>
                            <p class="text-3xl font-bold text-gray-800"><asp:Label ID="lblTotalProducts" runat="server"></asp:Label></p>
                        </div>
                        <div class="bg-blue-100 p-4 rounded-full">
                            <i class="fas fa-box text-3xl text-blue-600"></i>
                        </div>
                    </div>
                </div>

                <!-- Total Orders -->
                <div class="bg-white rounded-lg shadow-md p-6">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-gray-500 text-sm mb-1">Total Orders</p>
                            <p class="text-3xl font-bold text-gray-800"><asp:Label ID="lblTotalOrders" runat="server"></asp:Label></p>
                        </div>
                        <div class="bg-green-100 p-4 rounded-full">
                            <i class="fas fa-shopping-bag text-3xl text-green-600"></i>
                        </div>
                    </div>
                </div>

                <!-- Total Users -->
                <div class="bg-white rounded-lg shadow-md p-6">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-gray-500 text-sm mb-1">Total Users</p>
                            <p class="text-3xl font-bold text-gray-800"><asp:Label ID="lblTotalUsers" runat="server"></asp:Label></p>
                        </div>
                        <div class="bg-purple-100 p-4 rounded-full">
                            <i class="fas fa-users text-3xl text-purple-600"></i>
                        </div>
                    </div>
                </div>

                <!-- Total Revenue -->
                <div class="bg-white rounded-lg shadow-md p-6">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-gray-500 text-sm mb-1">Total Revenue</p>
                            <p class="text-3xl font-bold text-gray-800">Rs. <asp:Label ID="lblTotalRevenue" runat="server"></asp:Label></p>
                        </div>
                        <div class="bg-amber-100 p-4 rounded-full">
                            <i class="fas fa-dollar-sign text-3xl text-amber-600"></i>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Quick Actions -->
            <div class="bg-white rounded-lg shadow-md p-6 mb-8">
                <h2 class="text-2xl font-bold text-gray-800 mb-6">Quick Actions</h2>
                <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                    <a href="ManageProducts.aspx" class="bg-gradient-to-br from-blue-500 to-blue-600 text-white p-6 rounded-lg text-center hover:shadow-lg transition">
                        <i class="fas fa-plus-circle text-4xl mb-3"></i>
                        <p class="font-semibold">Add Product</p>
                    </a>
                    <a href="ManageOrders.aspx" class="bg-gradient-to-br from-green-500 to-green-600 text-white p-6 rounded-lg text-center hover:shadow-lg transition">
                        <i class="fas fa-tasks text-4xl mb-3"></i>
                        <p class="font-semibold">Manage Orders</p>
                    </a>
                    <a href="ManageCategories.aspx" class="bg-gradient-to-br from-purple-500 to-purple-600 text-white p-6 rounded-lg text-center hover:shadow-lg transition">
                        <i class="fas fa-tags text-4xl mb-3"></i>
                        <p class="font-semibold">Categories</p>
                    </a>
                    <a href="ManageUsers.aspx" class="bg-gradient-to-br from-orange-500 to-orange-600 text-white p-6 rounded-lg text-center hover:shadow-lg transition">
                        <i class="fas fa-users-cog text-4xl mb-3"></i>
                        <p class="font-semibold">Manage Users</p>
                    </a>
                </div>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
                <!-- Recent Orders -->
                <div class="bg-white rounded-lg shadow-md p-6">
                    <h2 class="text-2xl font-bold text-gray-800 mb-4">Recent Orders</h2>
                    <asp:GridView ID="gvRecentOrders" runat="server" 
                        AutoGenerateColumns="false"
                        CssClass="w-full"
                        GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="OrderID" HeaderText="Order #" />
                            <asp:BoundField DataField="CustomerName" HeaderText="Customer" />
                            <asp:BoundField DataField="TotalAmount" HeaderText="Amount" DataFormatString="Rs. {0:N2}" />
                            <asp:BoundField DataField="OrderStatus" HeaderText="Status" />
                            <asp:BoundField DataField="OrderDate" HeaderText="Date" DataFormatString="{0:MMM dd, yyyy}" />
                        </Columns>
                        <HeaderStyle CssClass="bg-gray-100 text-gray-700 font-semibold py-3 px-4 text-left" />
                        <RowStyle CssClass="border-b border-gray-200 py-3 px-4" />
                    </asp:GridView>
                </div>

                <!-- Low Stock Products -->
                <div class="bg-white rounded-lg shadow-md p-6">
                    <h2 class="text-2xl font-bold text-gray-800 mb-4">Low Stock Alert</h2>
                    <asp:GridView ID="gvLowStock" runat="server" 
                        AutoGenerateColumns="false"
                        CssClass="w-full"
                        GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="ProductName" HeaderText="Product" />
                            <asp:BoundField DataField="StockQuantity" HeaderText="Stock" />
                            <asp:BoundField DataField="CategoryName" HeaderText="Category" />
                        </Columns>
                        <HeaderStyle CssClass="bg-gray-100 text-gray-700 font-semibold py-3 px-4 text-left" />
                        <RowStyle CssClass="border-b border-gray-200 py-3 px-4" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

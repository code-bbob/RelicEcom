<%@ Page Title="Shop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Shop.aspx.cs" Inherits="Shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="bg-gray-50 min-h-screen">
        <!-- Page Header -->
        <div class="bg-gradient-to-r from-amber-600 to-orange-700 text-white py-12">
            <div class="container mx-auto px-4">
                <h1 class="text-4xl font-bold mb-2">Shop Heritage Art</h1>
                <p class="text-amber-100">Browse our authentic collection of handicrafts</p>
            </div>
        </div>

        <div class="container mx-auto px-4 py-8">
            <div class="grid grid-cols-1 lg:grid-cols-4 gap-8">
                <!-- Sidebar Filters -->
                <div class="lg:col-span-1">
                    <div class="bg-white rounded-lg shadow-md p-6 sticky top-24">
                        <h3 class="text-xl font-bold mb-4 text-gray-800">Filters</h3>
                        
                        <!-- Search -->
                        <div class="mb-6">
                            <label class="block text-sm font-medium text-gray-700 mb-2">Search</label>
                            <asp:TextBox ID="txtSearch" runat="server" 
                                CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500"
                                placeholder="Search products..."
                                AutoPostBack="true"
                                OnTextChanged="ApplyFilters">
                            </asp:TextBox>
                        </div>

                        <!-- Categories -->
                        <div class="mb-6">
                            <label class="block text-sm font-medium text-gray-700 mb-2">Categories</label>
                            <asp:DropDownList ID="ddlCategory" runat="server" 
                                CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500"
                                AutoPostBack="true"
                                OnSelectedIndexChanged="ApplyFilters">
                            </asp:DropDownList>
                        </div>

                        <!-- Price Range -->
                        <div class="mb-6">
                            <label class="block text-sm font-medium text-gray-700 mb-2">Price Range</label>
                            <asp:DropDownList ID="ddlPriceRange" runat="server" 
                                CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500"
                                AutoPostBack="true"
                                OnSelectedIndexChanged="ApplyFilters">
                                <asp:ListItem Value="" Text="All Prices" Selected="True"></asp:ListItem>
                                <asp:ListItem Value="0-5000" Text="Rs. 0 - 5,000"></asp:ListItem>
                                <asp:ListItem Value="5000-10000" Text="Rs. 5,000 - 10,000"></asp:ListItem>
                                <asp:ListItem Value="10000-20000" Text="Rs. 10,000 - 20,000"></asp:ListItem>
                                <asp:ListItem Value="20000-50000" Text="Rs. 20,000 - 50,000"></asp:ListItem>
                                <asp:ListItem Value="50000-999999" Text="Rs. 50,000+"></asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <!-- Sort By -->
                        <div class="mb-6">
                            <label class="block text-sm font-medium text-gray-700 mb-2">Sort By</label>
                            <asp:DropDownList ID="ddlSortBy" runat="server" 
                                CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500"
                                AutoPostBack="true"
                                OnSelectedIndexChanged="ApplyFilters">
                                <asp:ListItem Value="newest" Text="Newest First" Selected="True"></asp:ListItem>
                                <asp:ListItem Value="price_asc" Text="Price: Low to High"></asp:ListItem>
                                <asp:ListItem Value="price_desc" Text="Price: High to Low"></asp:ListItem>
                                <asp:ListItem Value="name_asc" Text="Name: A to Z"></asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <!-- Reset Filters -->
                        <asp:Button ID="btnResetFilters" runat="server" 
                            Text="Reset Filters"
                            OnClick="ResetFilters_Click"
                            CssClass="w-full bg-gray-200 text-gray-700 py-2 rounded-lg hover:bg-gray-300 transition font-semibold" />
                    </div>
                </div>

                <!-- Products Grid -->
                <div class="lg:col-span-3">
                    <!-- Results Count -->
                    <div class="flex justify-between items-center mb-6">
                        <asp:Label ID="lblResultsCount" runat="server" CssClass="text-gray-600"></asp:Label>
                    </div>

                    <!-- Products -->
                    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
                        <asp:Repeater ID="rptProducts" runat="server">
                            <ItemTemplate>
                                <div class="product-card bg-white rounded-lg shadow-md overflow-hidden">
                                    <a href='ProductDetails.aspx?id=<%# Eval("ProductID") %>'>
                                        <div class="image-zoom relative h-64 bg-gray-200">
                                            <img src='<%# ResolveUrl(Eval("ImageUrl").ToString()) %>' 
                                                 alt='<%# Eval("ProductName") %>' 
                                                 class="w-full h-full object-cover"
                                                 onerror="this.src='/Images/placeholder.jpg'" />
                                            
                                            <%# Convert.ToDecimal(Eval("DiscountPrice")) > 0 ? 
                                                "<span class='absolute top-3 right-3 bg-red-500 text-white px-3 py-1 rounded-full text-sm font-semibold'>SALE</span>" : "" %>
                                            
                                            <%# Convert.ToBoolean(Eval("IsFeatured")) ? 
                                                "<span class='absolute top-3 left-3 bg-amber-500 text-white px-3 py-1 rounded-full text-sm font-semibold'>Featured</span>" : "" %>
                                            
                                            <%# Convert.ToInt32(Eval("StockQuantity")) == 0 ? 
                                                "<span class='absolute inset-0 bg-black bg-opacity-50 flex items-center justify-center text-white font-bold text-lg'>OUT OF STOCK</span>" : "" %>
                                        </div>
                                    </a>
                                    
                                    <div class="p-4">
                                        <p class="text-sm text-gray-500 mb-1"><%# Eval("CategoryName") %></p>
                                        <h3 class="font-semibold text-lg mb-2 text-gray-800 hover:text-amber-600 transition">
                                            <a href='ProductDetails.aspx?id=<%# Eval("ProductID") %>'>
                                                <%# Eval("ProductName") %>
                                            </a>
                                        </h3>
                                        
                                        <div class="flex items-center justify-between mb-3">
                                            <div>
                                                <%# Convert.ToDecimal(Eval("DiscountPrice")) > 0 ? 
                                                    "<span class='text-gray-400 line-through text-sm'>Rs. " + String.Format("{0:N2}", Eval("Price")) + "</span><br/>" +
                                                    "<span class='text-red-600 font-bold text-lg'>Rs. " + String.Format("{0:N2}", Eval("DiscountPrice")) + "</span>" :
                                                    "<span class='text-amber-600 font-bold text-lg'>Rs. " + String.Format("{0:N2}", Eval("Price")) + "</span>" %>
                                            </div>
                                        </div>
                                        
                                        <%# Convert.ToInt32(Eval("StockQuantity")) > 0 ? 
                                            "<asp:LinkButton ID='btnAddToCart' runat='server' CommandName='AddToCart' CommandArgument='" + Eval("ProductID") + "' OnCommand='AddToCart_Command' CssClass='w-full bg-amber-600 text-white py-2 rounded-lg hover:bg-amber-700 transition font-semibold block text-center'><i class='fas fa-shopping-cart mr-2'></i>Add to Cart</asp:LinkButton>" :
                                            "<button disabled class='w-full bg-gray-300 text-gray-500 py-2 rounded-lg cursor-not-allowed font-semibold'>Out of Stock</button>" %>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                    <!-- No Results Message -->
                    <asp:Panel ID="pnlNoResults" runat="server" Visible="false" CssClass="text-center py-16">
                        <div class="empty-state">
                            <i class="fas fa-search"></i>
                            <h3 class="text-2xl font-semibold text-gray-700 mb-2">No Products Found</h3>
                            <p class="text-gray-500 mb-6">Try adjusting your filters or search terms</p>
                            <asp:Button ID="btnClearFilters" runat="server" 
                                Text="Clear All Filters"
                                OnClick="ResetFilters_Click"
                                CssClass="bg-amber-600 text-white px-6 py-2 rounded-lg hover:bg-amber-700 transition font-semibold" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

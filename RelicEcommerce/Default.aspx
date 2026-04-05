<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Hero Section -->
    <section class="relative bg-gradient-to-r from-amber-700 via-orange-600 to-amber-800 text-white">
        <div class="container mx-auto px-4 py-20">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-12 items-center">
                <div class="fade-in">
                    <h1 class="text-5xl md:text-6xl font-bold mb-6 leading-tight">
                        Discover Heritage <br />
                        <span class="text-amber-200">Art & Crafts</span>
                    </h1>
                    <p class="text-xl mb-8 text-amber-50">
                        Authentic handmade products celebrating rich cultural heritage and traditional craftsmanship
                    </p>
                    <div class="flex flex-wrap gap-4">
                        <a href="Shop.aspx" class="bg-white text-amber-700 px-8 py-3 rounded-lg font-semibold hover:bg-amber-50 transition shadow-lg hover:shadow-xl">
                            Shop Now
                        </a>
                        <a href="About.aspx" class="border-2 border-white text-white px-8 py-3 rounded-lg font-semibold hover:bg-white hover:text-amber-700 transition">
                            Learn More
                        </a>
                    </div>
                </div>
                <div class="hidden md:block">
                    <div class="relative">
                        <i class="fas fa-landmark text-[300px] text-amber-900 opacity-30"></i>
                    </div>
                </div>
            </div>
        </div>
        <div class="absolute bottom-0 left-0 right-0">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 120">
                <path fill="#f9fafb" d="M0,64L1440,32L1440,120L0,120Z"></path>
            </svg>
        </div>
    </section>

    <!-- Features Section -->
    <section class="py-16 bg-gray-50">
        <div class="container mx-auto px-4">
            <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
                <div class="text-center fade-in">
                    <div class="bg-amber-100 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">
                        <i class="fas fa-shipping-fast text-2xl text-amber-700"></i>
                    </div>
                    <h3 class="font-semibold text-lg mb-2">Free Shipping</h3>
                    <p class="text-gray-600 text-sm">On orders over Rs. 5000</p>
                </div>
                <div class="text-center fade-in">
                    <div class="bg-amber-100 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">
                        <i class="fas fa-hand-holding-heart text-2xl text-amber-700"></i>
                    </div>
                    <h3 class="font-semibold text-lg mb-2">Authentic Products</h3>
                    <p class="text-gray-600 text-sm">100% genuine handicrafts</p>
                </div>
                <div class="text-center fade-in">
                    <div class="bg-amber-100 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">
                        <i class="fas fa-shield-alt text-2xl text-amber-700"></i>
                    </div>
                    <h3 class="font-semibold text-lg mb-2">Secure Payment</h3>
                    <p class="text-gray-600 text-sm">Safe and secure checkout</p>
                </div>
                <div class="text-center fade-in">
                    <div class="bg-amber-100 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">
                        <i class="fas fa-headset text-2xl text-amber-700"></i>
                    </div>
                    <h3 class="font-semibold text-lg mb-2">24/7 Support</h3>
                    <p class="text-gray-600 text-sm">Dedicated customer service</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Categories Section -->
    <section class="py-16 bg-white">
        <div class="container mx-auto px-4">
            <div class="text-center mb-12">
                <h2 class="text-4xl font-bold text-gray-800 mb-4">Browse Categories</h2>
                <p class="text-gray-600">Explore our diverse collection of heritage art</p>
            </div>

            <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-6">
                <asp:Repeater ID="rptCategories" runat="server">
                    <ItemTemplate>
                        <a href='Shop.aspx?category=<%# Eval("CategoryID") %>' class="group">
                            <div class="bg-gradient-to-br from-amber-500 to-orange-600 rounded-xl p-6 text-white text-center hover:shadow-xl transition-all duration-300 transform hover:-translate-y-2">
                                <i class="fas fa-palette text-4xl mb-3"></i>
                                <h3 class="font-semibold"><%# Eval("CategoryName") %></h3>
                            </div>
                        </a>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>

    <!-- Featured Products Section -->
    <section class="py-16 bg-gray-50">
        <div class="container mx-auto px-4">
            <div class="text-center mb-12">
                <h2 class="text-4xl font-bold text-gray-800 mb-4">Featured Products</h2>
                <p class="text-gray-600">Handpicked collection of our best items</p>
            </div>

            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
                <asp:Repeater ID="rptFeaturedProducts" runat="server">
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
                                </div>
                            </a>
                            <div class="p-4">
                                <h3 class="font-semibold text-lg mb-2 text-gray-800 hover:text-amber-600 transition">
                                    <a href='ProductDetails.aspx?id=<%# Eval("ProductID") %>'>
                                        <%# Eval("ProductName") %>
                                    </a>
                                </h3>
                                <div class="flex items-center justify-between mb-3">
                                    <div>
                                        <%# Convert.ToDecimal(Eval("DiscountPrice")) > 0 ? 
                                            "<span class='text-gray-400 line-through text-sm'>Rs. " + String.Format("{0:N2}", Eval("Price")) + "</span> " +
                                            "<span class='text-red-600 font-bold text-lg'>Rs. " + String.Format("{0:N2}", Eval("DiscountPrice")) + "</span>" :
                                            "<span class='text-amber-600 font-bold text-lg'>Rs. " + String.Format("{0:N2}", Eval("Price")) + "</span>" %>
                                    </div>
                                </div>
                                <asp:LinkButton ID="btnAddToCart" runat="server" 
                                    CommandName="AddToCart" 
                                    CommandArgument='<%# Eval("ProductID") %>'
                                    OnCommand="AddToCart_Command"
                                    CssClass="w-full bg-amber-600 text-white py-2 rounded-lg hover:bg-amber-700 transition font-semibold block text-center">
                                    <i class="fas fa-shopping-cart mr-2"></i>Add to Cart
                                </asp:LinkButton>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div class="text-center mt-12">
                <a href="Shop.aspx" class="inline-block bg-amber-600 text-white px-8 py-3 rounded-lg font-semibold hover:bg-amber-700 transition shadow-lg hover:shadow-xl">
                    View All Products
                </a>
            </div>
        </div>
    </section>

    <!-- Why Choose Us Section -->
    <section class="py-16 bg-white">
        <div class="container mx-auto px-4">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-12 items-center">
                <div>
                    <h2 class="text-4xl font-bold text-gray-800 mb-6">Why Choose KalaSmriti?</h2>
                    <div class="space-y-6">
                        <div class="flex items-start">
                            <div class="bg-amber-100 p-3 rounded-lg mr-4">
                                <i class="fas fa-certificate text-2xl text-amber-600"></i>
                            </div>
                            <div>
                                <h3 class="font-semibold text-lg mb-2">Authentic Heritage</h3>
                                <p class="text-gray-600">Every piece tells a story of rich cultural heritage and traditional craftsmanship passed down through generations.</p>
                            </div>
                        </div>
                        <div class="flex items-start">
                            <div class="bg-amber-100 p-3 rounded-lg mr-4">
                                <i class="fas fa-users text-2xl text-amber-600"></i>
                            </div>
                            <div>
                                <h3 class="font-semibold text-lg mb-2">Support Local Artisans</h3>
                                <p class="text-gray-600">Your purchase directly supports local artisans and helps preserve traditional crafts for future generations.</p>
                            </div>
                        </div>
                        <div class="flex items-start">
                            <div class="bg-amber-100 p-3 rounded-lg mr-4">
                                <i class="fas fa-star text-2xl text-amber-600"></i>
                            </div>
                            <div>
                                <h3 class="font-semibold text-lg mb-2">Quality Guaranteed</h3>
                                <p class="text-gray-600">We ensure every product meets our high standards of quality and authenticity.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hidden md:block">
                    <div class="bg-gradient-to-br from-amber-500 to-orange-600 rounded-2xl p-12 text-white text-center">
                        <i class="fas fa-award text-8xl mb-6 opacity-80"></i>
                        <h3 class="text-3xl font-bold mb-4">Celebrating Heritage</h3>
                        <p class="text-lg">Since 2020, bringing authentic handicrafts to your doorstep</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="py-20 bg-gradient-to-r from-amber-600 to-orange-700 text-white">
        <div class="container mx-auto px-4 text-center">
            <h2 class="text-4xl font-bold mb-6">Ready to Explore?</h2>
            <p class="text-xl mb-8 text-amber-50">Join thousands of satisfied customers who trust KalaSmriti for authentic heritage products</p>
            <div class="flex flex-wrap justify-center gap-4">
                <% if (!User.Identity.IsAuthenticated) { %>
                    <a href="Register.aspx" class="bg-white text-amber-700 px-8 py-3 rounded-lg font-semibold hover:bg-amber-50 transition shadow-lg hover:shadow-xl">
                        Create Account
                    </a>
                <% } %>
                <a href="Shop.aspx" class="border-2 border-white text-white px-8 py-3 rounded-lg font-semibold hover:bg-white hover:text-amber-700 transition">
                    Start Shopping
                </a>
            </div>
        </div>
    </section>
</asp:Content>


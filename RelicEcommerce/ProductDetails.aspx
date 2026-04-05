<%@ Page Title="Product Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="bg-gray-50 min-h-screen py-8">
        <div class="container mx-auto px-4">
            <asp:Panel ID="pnlNotFound" runat="server" Visible="false" CssClass="bg-white rounded-lg shadow-md p-8 text-center">
                <h2 class="text-2xl font-bold text-gray-800 mb-2">Product not found</h2>
                <p class="text-gray-600 mb-6">The product you requested does not exist or is unavailable.</p>
                <a href="Shop.aspx" class="bg-amber-600 text-white px-6 py-2 rounded-lg hover:bg-amber-700 transition font-semibold">Back to Shop</a>
            </asp:Panel>

            <asp:Panel ID="pnlProduct" runat="server" Visible="false">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-8 bg-white rounded-lg shadow-md p-6">
                    <div class="bg-gray-100 rounded-lg overflow-hidden h-96">
                        <asp:Image ID="imgProduct" runat="server" CssClass="w-full h-full object-cover" />
                    </div>

                    <div>
                        <p class="text-sm text-gray-500 mb-2">
                            <asp:Label ID="lblCategory" runat="server"></asp:Label>
                        </p>
                        <h1 class="text-3xl font-bold text-gray-900 mb-4">
                            <asp:Label ID="lblProductName" runat="server"></asp:Label>
                        </h1>

                        <div class="mb-4">
                            <asp:Label ID="lblPrice" runat="server" CssClass="text-2xl font-bold text-amber-600"></asp:Label>
                            <asp:Label ID="lblOriginalPrice" runat="server" CssClass="ml-2 text-gray-400 line-through"></asp:Label>
                        </div>

                        <p class="text-gray-700 leading-relaxed mb-6">
                            <asp:Label ID="lblDescription" runat="server"></asp:Label>
                        </p>

                        <p class="mb-6">
                            <span class="font-semibold text-gray-700">Availability:</span>
                            <asp:Label ID="lblStock" runat="server" CssClass="ml-2"></asp:Label>
                        </p>

                        <div class="mb-6 p-4 bg-gray-50 rounded-lg border border-gray-200">
                            <div class="flex items-center justify-between mb-2">
                                <span class="font-semibold text-gray-700">Customer Ratings</span>
                                <asp:Label ID="lblRatingSummary" runat="server" CssClass="text-sm text-gray-600"></asp:Label>
                            </div>
                            <asp:Label ID="lblAverageRating" runat="server" CssClass="text-amber-600 font-semibold"></asp:Label>
                        </div>

                        <div class="flex gap-3">
                            <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" OnClick="btnAddToCart_Click"
                                CssClass="bg-amber-600 text-white px-6 py-3 rounded-lg hover:bg-amber-700 transition font-semibold" />
                            <a href="Shop.aspx" class="bg-gray-200 text-gray-700 px-6 py-3 rounded-lg hover:bg-gray-300 transition font-semibold">Back to Shop</a>
                        </div>

                        <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="mt-4 p-3 rounded-lg">
                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                        </asp:Panel>
                    </div>
                </div>

                <div class="mt-8 bg-white rounded-lg shadow-md p-6">
                    <h2 class="text-2xl font-bold text-gray-800 mb-4">Customer Reviews</h2>
                    <asp:Repeater ID="rptReviews" runat="server">
                        <ItemTemplate>
                            <div class="border-b border-gray-200 py-4 last:border-b-0">
                                <div class="flex items-center justify-between mb-1">
                                    <div class="text-amber-500 text-sm">
                                        <%# GetStars(Convert.ToInt32(Eval("Rating"))) %>
                                    </div>
                                    <span class="text-xs text-gray-500"><%# string.Format("{0:yyyy-MM-dd}", Eval("ReviewDate")) %></span>
                                </div>
                                <p class="text-sm font-semibold text-gray-700 mb-1"><%# Eval("FirstName") %></p>
                                <p class="text-gray-700"><%# Eval("ReviewText") %></p>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:Panel ID="pnlNoReviews" runat="server" Visible="false" CssClass="text-gray-500 text-sm">
                        No reviews yet for this product.
                    </asp:Panel>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="bg-gray-50 min-h-screen py-12">
        <div class="container mx-auto px-4">
            <h1 class="text-4xl font-bold text-gray-800 mb-8">Shopping Cart</h1>

            <asp:Panel ID="pnlCartItems" runat="server">
                <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
                    <!-- Cart Items -->
                    <div class="lg:col-span-2">
                        <div class="bg-white rounded-lg shadow-md p-6">
                            <asp:Repeater ID="rptCartItems" runat="server">
                                <ItemTemplate>
                                    <div class="flex items-center border-b border-gray-200 py-4 last:border-b-0">
                                        <!-- Product Image -->
                                        <div class="w-24 h-24 flex-shrink-0">
                                            <img src='<%# ResolveUrl(Eval("ImageUrl").ToString()) %>' 
                                                 alt='<%# Eval("ProductName") %>' 
                                                 class="w-full h-full object-cover rounded"
                                                 onerror="this.src='/Images/placeholder.jpg'" />
                                        </div>
                                        
                                        <!-- Product Details -->
                                        <div class="flex-grow ml-4">
                                            <h3 class="font-semibold text-lg text-gray-800">
                                                <a href='ProductDetails.aspx?id=<%# Eval("ProductID") %>' class="hover:text-amber-600">
                                                    <%# Eval("ProductName") %>
                                                </a>
                                            </h3>
                                            <p class="text-amber-600 font-bold">
                                                Rs. <%# String.Format("{0:N2}", Eval("UnitPrice")) %>
                                            </p>
                                        </div>
                                        
                                        <!-- Quantity Controls -->
                                        <div class="flex items-center space-x-3 mx-4">
                                            <asp:LinkButton ID="btnDecrease" runat="server"
                                                CommandName="UpdateQuantity"
                                                CommandArgument='<%# Eval("CartID") + ",-1" %>'
                                                OnCommand="UpdateQuantity_Command"
                                                CssClass="w-8 h-8 bg-gray-200 rounded flex items-center justify-center hover:bg-gray-300 transition">
                                                <i class="fas fa-minus text-sm"></i>
                                            </asp:LinkButton>
                                            
                                            <span class="w-12 text-center font-semibold"><%# Eval("Quantity") %></span>
                                            
                                            <asp:LinkButton ID="btnIncrease" runat="server"
                                                CommandName="UpdateQuantity"
                                                CommandArgument='<%# Eval("CartID") + ",1" %>'
                                                OnCommand="UpdateQuantity_Command"
                                                CssClass="w-8 h-8 bg-gray-200 rounded flex items-center justify-center hover:bg-gray-300 transition">
                                                <i class="fas fa-plus text-sm"></i>
                                            </asp:LinkButton>
                                        </div>
                                        
                                        <!-- Subtotal -->
                                        <div class="text-right w-24">
                                            <p class="font-bold text-gray-800">
                                                Rs. <%# String.Format("{0:N2}", Convert.ToDecimal(Eval("UnitPrice")) * Convert.ToInt32(Eval("Quantity"))) %>
                                            </p>
                                        </div>
                                        
                                        <!-- Remove Button -->
                                        <div class="ml-4">
                                            <asp:LinkButton ID="btnRemove" runat="server"
                                                CommandName="Remove"
                                                CommandArgument='<%# Eval("CartID") %>'
                                                OnCommand="RemoveItem_Command"
                                                OnClientClick="return confirm('Remove this item from cart?');"
                                                CssClass="text-red-500 hover:text-red-700 transition">
                                                <i class="fas fa-trash"></i>
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                    <!-- Cart Summary -->
                    <div class="lg:col-span-1">
                        <div class="bg-white rounded-lg shadow-md p-6 sticky top-24">
                            <h2 class="text-2xl font-bold text-gray-800 mb-6">Order Summary</h2>
                            
                            <div class="space-y-3 mb-6">
                                <div class="flex justify-between text-gray-600">
                                    <span>Subtotal:</span>
                                    <span class="font-semibold">Rs. <asp:Label ID="lblSubtotal" runat="server"></asp:Label></span>
                                </div>
                                <div class="flex justify-between text-gray-600">
                                    <span>Shipping:</span>
                                    <span class="font-semibold">Rs. <asp:Label ID="lblShipping" runat="server"></asp:Label></span>
                                </div>
                                <div class="border-t border-gray-300 pt-3 flex justify-between text-lg font-bold text-gray-800">
                                    <span>Total:</span>
                                    <span class="text-amber-600">Rs. <asp:Label ID="lblTotal" runat="server"></asp:Label></span>
                                </div>
                            </div>
                            
                            <asp:Button ID="btnCheckout" runat="server" 
                                Text="Proceed to Checkout"
                                OnClick="Checkout_Click"
                                CssClass="w-full bg-amber-600 text-white py-3 rounded-lg hover:bg-amber-700 transition font-semibold shadow-lg hover:shadow-xl" />
                            
                            <a href="Shop.aspx" class="block text-center mt-4 text-amber-600 hover:text-amber-700 font-medium">
                                <i class="fas fa-arrow-left mr-2"></i>Continue Shopping
                            </a>
                        </div>
                    </div>
                </div>
            </asp:Panel>

            <!-- Empty Cart -->
            <asp:Panel ID="pnlEmptyCart" runat="server" Visible="false">
                <div class="text-center py-16 bg-white rounded-lg shadow-md">
                    <div class="empty-state">
                        <i class="fas fa-shopping-cart"></i>
                        <h3 class="text-2xl font-semibold text-gray-700 mb-2">Your cart is empty</h3>
                        <p class="text-gray-500 mb-6">Start adding some amazing heritage products!</p>
                        <a href="Shop.aspx" class="inline-block bg-amber-600 text-white px-8 py-3 rounded-lg hover:bg-amber-700 transition font-semibold shadow-lg hover:shadow-xl">
                            Browse Products
                        </a>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="bg-gray-50 min-h-screen py-8">
        <div class="container mx-auto px-4 max-w-4xl">
            <h1 class="text-3xl font-bold text-gray-800 mb-6">Checkout</h1>

            <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="mb-4 p-3 rounded-lg">
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </asp:Panel>

            <div class="bg-white rounded-lg shadow-md p-6 mb-6">
                <h2 class="text-xl font-semibold text-gray-800 mb-4">Order Summary</h2>
                <asp:Repeater ID="rptItems" runat="server">
                    <ItemTemplate>
                        <div class="flex justify-between border-b border-gray-200 py-2">
                            <span><%# Eval("ProductName") %> x <%# Eval("Quantity") %></span>
                            <span>Rs. <%# String.Format("{0:N2}", Eval("LineTotal")) %></span>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <div class="mt-4 text-right">
                    <div class="text-gray-600">Subtotal: Rs. <asp:Label ID="lblSubtotal" runat="server" /></div>
                    <div class="text-gray-600">Shipping: <asp:Label ID="lblShipping" runat="server" /></div>
                    <div class="text-2xl font-bold text-amber-700 mt-1">Total: Rs. <asp:Label ID="lblTotal" runat="server" /></div>
                </div>
            </div>

            <div class="bg-white rounded-lg shadow-md p-6">
                <h2 class="text-xl font-semibold text-gray-800 mb-4">Shipping Details</h2>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg md:col-span-2" placeholder="Shipping address"></asp:TextBox>
                    <asp:TextBox ID="txtCity" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg" placeholder="City"></asp:TextBox>
                    <asp:TextBox ID="txtState" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg" placeholder="State"></asp:TextBox>
                    <asp:TextBox ID="txtZip" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg" placeholder="Zip Code"></asp:TextBox>
                    <asp:TextBox ID="txtCountry" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg" placeholder="Country" Text="Nepal"></asp:TextBox>
                </div>

                <h2 class="text-xl font-semibold text-gray-800 mt-8 mb-4">Payment Information</h2>
                <asp:RadioButtonList ID="rblPaymentMethod" runat="server" RepeatDirection="Vertical" AutoPostBack="true" OnSelectedIndexChanged="rblPaymentMethod_SelectedIndexChanged" CssClass="space-y-2 text-gray-700">
                    <asp:ListItem Value="COD" Text="Cash on Delivery" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="ESEWA_TEST" Text="eSewa Test Payment"></asp:ListItem>
                </asp:RadioButtonList>

                <asp:Panel ID="pnlEsewaTest" runat="server" Visible="false" CssClass="mt-4 p-4 bg-green-50 border border-green-200 rounded-lg">
                    <h3 class="text-lg font-semibold text-green-800 mb-2">eSewa Test Details</h3>
                    <p class="text-sm text-green-700 mb-3">This is a simulated eSewa payment for testing only. No real transaction is processed.</p>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <asp:TextBox ID="txtEsewaPhone" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg" placeholder="eSewa Phone / ID"></asp:TextBox>
                        <asp:TextBox ID="txtEsewaTxnRef" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg" placeholder="Optional reference"></asp:TextBox>
                    </div>
                </asp:Panel>

                <div class="mt-4 flex gap-3">
                    <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" OnClick="btnPlaceOrder_Click"
                        CssClass="bg-amber-600 text-white px-6 py-2 rounded-lg hover:bg-amber-700 transition font-semibold" />
                    <a href="Cart.aspx" class="bg-gray-200 text-gray-700 px-6 py-2 rounded-lg hover:bg-gray-300 transition font-semibold">Back to Cart</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

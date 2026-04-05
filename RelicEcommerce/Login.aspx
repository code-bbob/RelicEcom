<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="min-h-screen flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8 bg-gradient-to-br from-amber-50 to-orange-100">
        <div class="max-w-md w-full space-y-8 bg-white p-8 rounded-xl shadow-2xl">
            <!-- Header -->
            <div class="text-center">
                <i class="fas fa-landmark text-5xl text-amber-600 mb-4"></i>
                <h2 class="text-3xl font-extrabold text-gray-900">
                    Welcome Back
                </h2>
                <p class="mt-2 text-sm text-gray-600">
                    Sign in to your KalaSmriti account
                </p>
            </div>

            <!-- Login Form -->
            <div class="mt-8 space-y-6">
                <asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="alert alert-error">
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                </asp:Panel>

                <div class="rounded-md shadow-sm space-y-4">
                    <!-- Email -->
                    <div>
                        <label for="txtEmail" class="block text-sm font-medium text-gray-700 mb-1">
                            Email Address
                        </label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fas fa-envelope text-gray-400"></i>
                            </div>
                            <asp:TextBox ID="txtEmail" runat="server" 
                                TextMode="Email"
                                CssClass="appearance-none rounded-lg relative block w-full pl-10 px-3 py-3 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-2 focus:ring-amber-500 focus:border-amber-500"
                                placeholder="Enter your email"
                                required="required">
                            </asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                            ControlToValidate="txtEmail"
                            ErrorMessage="Email is required"
                            CssClass="text-red-500 text-sm mt-1"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEmail" runat="server"
                            ControlToValidate="txtEmail"
                            ErrorMessage="Please enter a valid email address"
                            ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                            CssClass="text-red-500 text-sm mt-1"
                            Display="Dynamic">
                        </asp:RegularExpressionValidator>
                    </div>

                    <!-- Password -->
                    <div>
                        <label for="txtPassword" class="block text-sm font-medium text-gray-700 mb-1">
                            Password
                        </label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fas fa-lock text-gray-400"></i>
                            </div>
                            <asp:TextBox ID="txtPassword" runat="server" 
                                TextMode="Password"
                                CssClass="appearance-none rounded-lg relative block w-full pl-10 px-3 py-3 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-2 focus:ring-amber-500 focus:border-amber-500"
                                placeholder="Enter your password"
                                required="required">
                            </asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                            ControlToValidate="txtPassword"
                            ErrorMessage="Password is required"
                            CssClass="text-red-500 text-sm mt-1"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>

                <!-- Remember Me & Forgot Password -->
                <div class="flex items-center justify-between">
                    <div class="flex items-center">
                        <asp:CheckBox ID="chkRememberMe" runat="server" CssClass="h-4 w-4 text-amber-600 focus:ring-amber-500 border-gray-300 rounded" />
                        <label for="chkRememberMe" class="ml-2 block text-sm text-gray-900">
                            Remember me
                        </label>
                    </div>

                    <div class="text-sm">
                        <a href="#" class="font-medium text-amber-600 hover:text-amber-500">
                            Forgot password?
                        </a>
                    </div>
                </div>

                <!-- Login Button -->
                <div>
                    <asp:Button ID="btnLogin" runat="server" 
                        Text="Sign In"
                        OnClick="btnLogin_Click"
                        CssClass="group relative w-full flex justify-center py-3 px-4 border border-transparent text-sm font-medium rounded-lg text-white bg-amber-600 hover:bg-amber-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-amber-500 transition-all duration-200 shadow-lg hover:shadow-xl" />
                </div>

                <!-- Register Link -->
                <div class="text-center">
                    <p class="text-sm text-gray-600">
                        Don't have an account? 
                        <a href="Register.aspx" class="font-medium text-amber-600 hover:text-amber-500">
                            Register now
                        </a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


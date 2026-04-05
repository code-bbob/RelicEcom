<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="min-h-screen flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8 bg-gradient-to-br from-amber-50 to-orange-100">
        <div class="max-w-2xl w-full bg-white p-8 rounded-xl shadow-2xl">
            <!-- Header -->
            <div class="text-center mb-8">
                <i class="fas fa-user-plus text-5xl text-amber-600 mb-4"></i>
                <h2 class="text-3xl font-extrabold text-gray-900">
                    Create Account
                </h2>
                <p class="mt-2 text-sm text-gray-600">
                    Join KalaSmriti and explore heritage art
                </p>
            </div>

            <!-- Registration Form -->
            <asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="alert alert-error mb-4">
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </asp:Panel>

            <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="alert alert-success mb-4">
                <asp:Label ID="lblSuccess" runat="server"></asp:Label>
            </asp:Panel>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <!-- First Name -->
                <div>
                    <label for="txtFirstName" class="block text-sm font-medium text-gray-700 mb-1">
                        First Name <span class="text-red-500">*</span>
                    </label>
                    <asp:TextBox ID="txtFirstName" runat="server" 
                        CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500"
                        placeholder="Enter first name"
                        MaxLength="50">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                        ControlToValidate="txtFirstName"
                        ErrorMessage="First name is required"
                        CssClass="text-red-500 text-sm"
                        Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </div>

                <!-- Last Name -->
                <div>
                    <label for="txtLastName" class="block text-sm font-medium text-gray-700 mb-1">
                        Last Name <span class="text-red-500">*</span>
                    </label>
                    <asp:TextBox ID="txtLastName" runat="server" 
                        CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500"
                        placeholder="Enter last name"
                        MaxLength="50">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                        ControlToValidate="txtLastName"
                        ErrorMessage="Last name is required"
                        CssClass="text-red-500 text-sm"
                        Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </div>

                <!-- Email -->
                <div class="md:col-span-2">
                    <label for="txtEmail" class="block text-sm font-medium text-gray-700 mb-1">
                        Email Address <span class="text-red-500">*</span>
                    </label>
                    <asp:TextBox ID="txtEmail" runat="server" 
                        TextMode="Email"
                        CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500"
                        placeholder="Enter email address"
                        MaxLength="100">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                        ControlToValidate="txtEmail"
                        ErrorMessage="Email is required"
                        CssClass="text-red-500 text-sm"
                        Display="Dynamic">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="Please enter a valid email address"
                        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                        CssClass="text-red-500 text-sm"
                        Display="Dynamic">
                    </asp:RegularExpressionValidator>
                </div>

                <!-- Phone -->
                <div class="md:col-span-2">
                    <label for="txtPhone" class="block text-sm font-medium text-gray-700 mb-1">
                        Phone Number
                    </label>
                    <asp:TextBox ID="txtPhone" runat="server" 
                        CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500"
                        placeholder="Enter phone number"
                        MaxLength="20">
                    </asp:TextBox>
                </div>

                <!-- Password -->
                <div>
                    <label for="txtPassword" class="block text-sm font-medium text-gray-700 mb-1">
                        Password <span class="text-red-500">*</span>
                    </label>
                    <asp:TextBox ID="txtPassword" runat="server" 
                        TextMode="Password"
                        CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500"
                        placeholder="Enter password">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                        ControlToValidate="txtPassword"
                        ErrorMessage="Password is required"
                        CssClass="text-red-500 text-sm"
                        Display="Dynamic">
                    </asp:RequiredFieldValidator>
                    <small class="text-gray-500">Min 6 characters</small>
                </div>

                <!-- Confirm Password -->
                <div>
                    <label for="txtConfirmPassword" class="block text-sm font-medium text-gray-700 mb-1">
                        Confirm Password <span class="text-red-500">*</span>
                    </label>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" 
                        TextMode="Password"
                        CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500"
                        placeholder="Confirm password">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" 
                        ControlToValidate="txtConfirmPassword"
                        ErrorMessage="Please confirm password"
                        CssClass="text-red-500 text-sm"
                        Display="Dynamic">
                    </asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvPassword" runat="server"
                        ControlToValidate="txtConfirmPassword"
                        ControlToCompare="txtPassword"
                        ErrorMessage="Passwords do not match"
                        CssClass="text-red-500 text-sm"
                        Display="Dynamic">
                    </asp:CompareValidator>
                </div>

                <!-- Address -->
                <div class="md:col-span-2">
                    <label for="txtAddress" class="block text-sm font-medium text-gray-700 mb-1">
                        Address
                    </label>
                    <asp:TextBox ID="txtAddress" runat="server" 
                        CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500"
                        placeholder="Enter street address"
                        MaxLength="255">
                    </asp:TextBox>
                </div>

                <!-- City -->
                <div>
                    <label for="txtCity" class="block text-sm font-medium text-gray-700 mb-1">
                        City
                    </label>
                    <asp:TextBox ID="txtCity" runat="server" 
                        CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500"
                        placeholder="Enter city"
                        MaxLength="50">
                    </asp:TextBox>
                </div>

                <!-- State -->
                <div>
                    <label for="txtState" class="block text-sm font-medium text-gray-700 mb-1">
                        State/Province
                    </label>
                    <asp:TextBox ID="txtState" runat="server" 
                        CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500"
                        placeholder="Enter state"
                        MaxLength="50">
                    </asp:TextBox>
                </div>

                <!-- Zip Code -->
                <div>
                    <label for="txtZipCode" class="block text-sm font-medium text-gray-700 mb-1">
                        Zip/Postal Code
                    </label>
                    <asp:TextBox ID="txtZipCode" runat="server" 
                        CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500"
                        placeholder="Enter zip code"
                        MaxLength="10">
                    </asp:TextBox>
                </div>

                <!-- Country -->
                <div>
                    <label for="txtCountry" class="block text-sm font-medium text-gray-700 mb-1">
                        Country
                    </label>
                    <asp:TextBox ID="txtCountry" runat="server" 
                        Text="Nepal"
                        CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500"
                        placeholder="Enter country"
                        MaxLength="50">
                    </asp:TextBox>
                </div>
            </div>

            <!-- Terms and Conditions -->
            <div class="mt-6">
                <div class="flex items-start">
                    <asp:CheckBox ID="chkTerms" runat="server" CssClass="mt-1 h-4 w-4 text-amber-600 border-gray-300 rounded" />
                    <label for="chkTerms" class="ml-2 text-sm text-gray-700">
                        I agree to the <a href="#" class="text-amber-600 hover:text-amber-500">Terms and Conditions</a> 
                        and <a href="#" class="text-amber-600 hover:text-amber-500">Privacy Policy</a>
                    </label>
                </div>
                <asp:CustomValidator ID="cvTerms" runat="server"
                    ErrorMessage="You must agree to the terms and conditions"
                    ClientValidationFunction="validateTerms"
                    CssClass="text-red-500 text-sm"
                    Display="Dynamic">
                </asp:CustomValidator>
            </div>

            <!-- Register Button -->
            <div class="mt-6">
                <asp:Button ID="btnRegister" runat="server" 
                    Text="Create Account"
                    OnClick="btnRegister_Click"
                    CssClass="w-full py-3 px-4 border border-transparent text-sm font-medium rounded-lg text-white bg-amber-600 hover:bg-amber-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-amber-500 transition-all duration-200 shadow-lg hover:shadow-xl" />
            </div>

            <!-- Login Link -->
            <div class="text-center mt-6">
                <p class="text-sm text-gray-600">
                    Already have an account? 
                    <a href="Login.aspx" class="font-medium text-amber-600 hover:text-amber-500">
                        Sign in
                    </a>
                </p>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function validateTerms(sender, args) {
            var checkbox = document.getElementById('<%= chkTerms.ClientID %>');
            args.IsValid = checkbox.checked;
        }
    </script>
</asp:Content>


<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Hero Section -->
    <div class="bg-gradient-to-r from-amber-600 to-orange-700 text-white py-20">
        <div class="container mx-auto px-4 text-center">
            <h1 class="text-5xl font-bold mb-4">Contact Us</h1>
            <p class="text-xl text-amber-100">We'd love to hear from you</p>
        </div>
    </div>

    <!-- Contact Section -->
    <section class="py-16 bg-gray-50">
        <div class="container mx-auto px-4">
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-12">
                <!-- Contact Form -->
                <div class="bg-white rounded-lg shadow-md p-8">
                    <h2 class="text-3xl font-bold text-gray-800 mb-6">Send us a Message</h2>
                    
                    <div class="space-y-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Your Name</label>
                            <input type="text" 
                                   class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500" 
                                   placeholder="Enter your name" />
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Email Address</label>
                            <input type="email" 
                                   class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500" 
                                   placeholder="your.email@example.com" />
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Phone Number</label>
                            <input type="tel" 
                                   class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500" 
                                   placeholder="+977-9841234567" />
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Subject</label>
                            <input type="text" 
                                   class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500" 
                                   placeholder="What is this regarding?" />
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Message</label>
                            <textarea rows="5" 
                                      class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500" 
                                      placeholder="Tell us more..."></textarea>
                        </div>

                        <button type="button" 
                                class="w-full bg-amber-600 text-white py-3 rounded-lg hover:bg-amber-700 transition font-semibold shadow-lg hover:shadow-xl">
                            <i class="fas fa-paper-plane mr-2"></i>Send Message
                        </button>
                    </div>
                </div>

                <!-- Contact Information -->
                <div>
                    <div class="bg-white rounded-lg shadow-md p-8 mb-8">
                        <h2 class="text-3xl font-bold text-gray-800 mb-6">Get in Touch</h2>
                        
                        <div class="space-y-6">
                            <!-- Address -->
                            <div class="flex items-start">
                                <div class="bg-amber-100 p-3 rounded-lg mr-4">
                                    <i class="fas fa-map-marker-alt text-2xl text-amber-600"></i>
                                </div>
                                <div>
                                    <h3 class="font-semibold text-lg text-gray-800 mb-1">Our Location</h3>
                                    <p class="text-gray-600">Thamel, Kathmandu<br/>Bagmati Province, Nepal<br/>Postal Code: 44600</p>
                                </div>
                            </div>

                            <!-- Phone -->
                            <div class="flex items-start">
                                <div class="bg-amber-100 p-3 rounded-lg mr-4">
                                    <i class="fas fa-phone-alt text-2xl text-amber-600"></i>
                                </div>
                                <div>
                                    <h3 class="font-semibold text-lg text-gray-800 mb-1">Phone</h3>
                                    <p class="text-gray-600">+977-9841234567<br/>+977-01-4567890</p>
                                </div>
                            </div>

                            <!-- Email -->
                            <div class="flex items-start">
                                <div class="bg-amber-100 p-3 rounded-lg mr-4">
                                    <i class="fas fa-envelope text-2xl text-amber-600"></i>
                                </div>
                                <div>
                                    <h3 class="font-semibold text-lg text-gray-800 mb-1">Email</h3>
                                    <p class="text-gray-600">info@kalasmriti.com<br/>support@kalasmriti.com</p>
                                </div>
                            </div>

                            <!-- Hours -->
                            <div class="flex items-start">
                                <div class="bg-amber-100 p-3 rounded-lg mr-4">
                                    <i class="fas fa-clock text-2xl text-amber-600"></i>
                                </div>
                                <div>
                                    <h3 class="font-semibold text-lg text-gray-800 mb-1">Business Hours</h3>
                                    <p class="text-gray-600">
                                        Monday - Friday: 9:00 AM - 6:00 PM<br/>
                                        Saturday: 10:00 AM - 4:00 PM<br/>
                                        Sunday: Closed
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Social Media -->
                    <div class="bg-white rounded-lg shadow-md p-8">
                        <h3 class="text-2xl font-bold text-gray-800 mb-4">Follow Us</h3>
                        <p class="text-gray-600 mb-6">Stay connected on social media</p>
                        <div class="flex space-x-4">
                            <a href="#" class="bg-blue-600 text-white w-12 h-12 rounded-full flex items-center justify-center hover:bg-blue-700 transition">
                                <i class="fab fa-facebook-f text-xl"></i>
                            </a>
                            <a href="#" class="bg-pink-600 text-white w-12 h-12 rounded-full flex items-center justify-center hover:bg-pink-700 transition">
                                <i class="fab fa-instagram text-xl"></i>
                            </a>
                            <a href="#" class="bg-blue-400 text-white w-12 h-12 rounded-full flex items-center justify-center hover:bg-blue-500 transition">
                                <i class="fab fa-twitter text-xl"></i>
                            </a>
                            <a href="#" class="bg-red-600 text-white w-12 h-12 rounded-full flex items-center justify-center hover:bg-red-700 transition">
                                <i class="fab fa-youtube text-xl"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- FAQ Section -->
    <section class="py-16 bg-white">
        <div class="container mx-auto px-4">
            <h2 class="text-4xl font-bold text-center text-gray-800 mb-12">Frequently Asked Questions</h2>
            <div class="max-w-3xl mx-auto space-y-4">
                <div class="bg-gray-50 rounded-lg p-6">
                    <h3 class="font-bold text-lg text-gray-800 mb-2">How can I track my order?</h3>
                    <p class="text-gray-600">Once your order is shipped, you'll receive a tracking number via email. You can also check your order status in the "My Orders" section of your account.</p>
                </div>
                <div class="bg-gray-50 rounded-lg p-6">
                    <h3 class="font-bold text-lg text-gray-800 mb-2">What is your return policy?</h3>
                    <p class="text-gray-600">We accept returns within 14 days of delivery for most items. Products must be in original condition with tags attached. Custom or personalized items are non-returnable.</p>
                </div>
                <div class="bg-gray-50 rounded-lg p-6">
                    <h3 class="font-bold text-lg text-gray-800 mb-2">Do you ship internationally?</h3>
                    <p class="text-gray-600">Yes! We ship to over 50 countries worldwide. Shipping costs and delivery times vary by location. International orders may be subject to customs fees.</p>
                </div>
                <div class="bg-gray-50 rounded-lg p-6">
                    <h3 class="font-bold text-lg text-gray-800 mb-2">Are your products authentic?</h3>
                    <p class="text-gray-600">Absolutely! Every product is handcrafted by verified artisans. We personally inspect each item to ensure quality and authenticity before shipping.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Map Section (Placeholder) -->
    <section class="py-16 bg-gray-50">
        <div class="container mx-auto px-4">
            <h2 class="text-4xl font-bold text-center text-gray-800 mb-8">Visit Our Store</h2>
            <div class="bg-gray-300 h-96 rounded-lg flex items-center justify-center">
                <div class="text-center">
                    <i class="fas fa-map-marked-alt text-6xl text-gray-500 mb-4"></i>
                    <p class="text-gray-600">Map Integration Here</p>
                    <p class="text-sm text-gray-500">Thamel, Kathmandu, Nepal</p>
                </div>
            </div>
        </div>
    </section>
</asp:Content>


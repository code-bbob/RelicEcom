<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Hero Section -->
    <div class="bg-gradient-to-r from-amber-600 to-orange-700 text-white py-20">
        <div class="container mx-auto px-4 text-center">
            <h1 class="text-5xl font-bold mb-4">About Relic</h1>
            <p class="text-xl text-amber-100">Celebrating Heritage, Preserving Culture</p>
        </div>
    </div>

    <!-- Story Section -->
    <section class="py-16 bg-white">
        <div class="container mx-auto px-4">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-12 items-center">
                <div>
                    <h2 class="text-4xl font-bold text-gray-800 mb-6">Our Story</h2>
                    <p class="text-gray-600 mb-4 leading-relaxed">
                        Relic was born from a passion to preserve and celebrate the rich heritage of traditional craftsmanship. 
                        Founded in 2020, we set out on a mission to bridge the gap between skilled artisans and art enthusiasts 
                        who appreciate authentic, handmade products.
                    </p>
                    <p class="text-gray-600 mb-4 leading-relaxed">
                        Every piece in our collection tells a story of cultural significance, traditional techniques passed down 
                        through generations, and the dedication of master craftspeople who pour their hearts into their work.
                    </p>
                    <p class="text-gray-600 leading-relaxed">
                        Today, Relic has become a trusted platform connecting artisans with customers worldwide, ensuring that 
                        traditional art forms continue to thrive in the modern era.
                    </p>
                </div>
                <div class="bg-gradient-to-br from-amber-500 to-orange-600 rounded-2xl p-12 text-white text-center">
                    <i class="fas fa-landmark text-8xl mb-6 opacity-80"></i>
                    <h3 class="text-3xl font-bold mb-4">Est. 2020</h3>
                    <p class="text-lg text-amber-100">Preserving Heritage Through Authentic Craftsmanship</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Mission & Vision -->
    <section class="py-16 bg-gray-50">
        <div class="container mx-auto px-4">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                <div class="bg-white rounded-lg shadow-md p-8">
                    <div class="text-center mb-6">
                        <div class="inline-block bg-amber-100 p-4 rounded-full mb-4">
                            <i class="fas fa-bullseye text-4xl text-amber-600"></i>
                        </div>
                        <h3 class="text-2xl font-bold text-gray-800">Our Mission</h3>
                    </div>
                    <p class="text-gray-600 text-center leading-relaxed">
                        To preserve traditional craftsmanship by providing a sustainable marketplace that connects 
                        skilled artisans with appreciative customers, ensuring cultural heritage thrives for future generations.
                    </p>
                </div>
                <div class="bg-white rounded-lg shadow-md p-8">
                    <div class="text-center mb-6">
                        <div class="inline-block bg-amber-100 p-4 rounded-full mb-4">
                            <i class="fas fa-eye text-4xl text-amber-600"></i>
                        </div>
                        <h3 class="text-2xl font-bold text-gray-800">Our Vision</h3>
                    </div>
                    <p class="text-gray-600 text-center leading-relaxed">
                        To become the leading platform for authentic heritage art and handicrafts, making traditional 
                        craftsmanship accessible globally while empowering artisan communities economically and culturally.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- Values -->
    <section class="py-16 bg-white">
        <div class="container mx-auto px-4">
            <h2 class="text-4xl font-bold text-center text-gray-800 mb-12">Our Values</h2>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <div class="text-center">
                    <div class="bg-amber-100 w-20 h-20 rounded-full flex items-center justify-center mx-auto mb-4">
                        <i class="fas fa-certificate text-3xl text-amber-600"></i>
                    </div>
                    <h3 class="text-xl font-bold text-gray-800 mb-3">Authenticity</h3>
                    <p class="text-gray-600">Every product is genuine, handcrafted, and verified for quality and origin.</p>
                </div>
                <div class="text-center">
                    <div class="bg-amber-100 w-20 h-20 rounded-full flex items-center justify-center mx-auto mb-4">
                        <i class="fas fa-hands-helping text-3xl text-amber-600"></i>
                    </div>
                    <h3 class="text-xl font-bold text-gray-800 mb-3">Sustainability</h3>
                    <p class="text-gray-600">Supporting eco-friendly practices and sustainable livelihoods for artisan communities.</p>
                </div>
                <div class="text-center">
                    <div class="bg-amber-100 w-20 h-20 rounded-full flex items-center justify-center mx-auto mb-4">
                        <i class="fas fa-heart text-3xl text-amber-600"></i>
                    </div>
                    <h3 class="text-xl font-bold text-gray-800 mb-3">Cultural Heritage</h3>
                    <p class="text-gray-600">Preserving traditional techniques and cultural stories through every piece we offer.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Statistics -->
    <section class="py-16 bg-gradient-to-r from-amber-600 to-orange-700 text-white">
        <div class="container mx-auto px-4">
            <div class="grid grid-cols-2 md:grid-cols-4 gap-8 text-center">
                <div>
                    <div class="text-5xl font-bold mb-2">500+</div>
                    <div class="text-amber-100">Artisans</div>
                </div>
                <div>
                    <div class="text-5xl font-bold mb-2">2000+</div>
                    <div class="text-amber-100">Products</div>
                </div>
                <div>
                    <div class="text-5xl font-bold mb-2">10K+</div>
                    <div class="text-amber-100">Happy Customers</div>
                </div>
                <div>
                    <div class="text-5xl font-bold mb-2">50+</div>
                    <div class="text-amber-100">Countries</div>
                </div>
            </div>
        </div>
    </section>

    <!-- Team (Optional) -->
    <section class="py-16 bg-gray-50">
        <div class="container mx-auto px-4">
            <h2 class="text-4xl font-bold text-center text-gray-800 mb-4">Why Choose Relic?</h2>
            <p class="text-center text-gray-600 mb-12 max-w-2xl mx-auto">
                We're more than just an e-commerce platform. We're a community dedicated to preserving heritage.
            </p>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <div class="bg-white rounded-lg shadow-md p-6">
                    <i class="fas fa-shield-alt text-4xl text-amber-600 mb-4"></i>
                    <h3 class="text-xl font-bold text-gray-800 mb-3">Quality Assured</h3>
                    <p class="text-gray-600">Every product undergoes strict quality checks to ensure authenticity and craftsmanship standards.</p>
                </div>
                <div class="bg-white rounded-lg shadow-md p-6">
                    <i class="fas fa-shipping-fast text-4xl text-amber-600 mb-4"></i>
                    <h3 class="text-xl font-bold text-gray-800 mb-3">Secure Shipping</h3>
                    <p class="text-gray-600">Safe and reliable delivery to your doorstep with tracking and insurance on all orders.</p>
                </div>
                <div class="bg-white rounded-lg shadow-md p-6">
                    <i class="fas fa-headset text-4xl text-amber-600 mb-4"></i>
                    <h3 class="text-xl font-bold text-gray-800 mb-3">24/7 Support</h3>
                    <p class="text-gray-600">Dedicated customer service team always ready to assist you with any questions or concerns.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA -->
    <section class="py-16 bg-white">
        <div class="container mx-auto px-4 text-center">
            <h2 class="text-4xl font-bold text-gray-800 mb-4">Join Our Journey</h2>
            <p class="text-xl text-gray-600 mb-8">Be part of preserving cultural heritage while owning unique, handcrafted treasures</p>
            <a href="Shop.aspx" class="inline-block bg-amber-600 text-white px-8 py-3 rounded-lg font-semibold hover:bg-amber-700 transition shadow-lg hover:shadow-xl">
                Explore Collection
            </a>
        </div>
    </section>
</asp:Content>

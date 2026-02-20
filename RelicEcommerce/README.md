# Relic E-Commerce Web Application

## Project Overview
Relic is a mobile-optimized e-commerce web application designed for selling handicrafts and heritage art products. The system enables customers to browse products, manage shopping carts, place orders, and submit feedback, while administrators can manage products, categories, users, and orders through a secure dashboard.

## Technology Stack

### Frontend
- **HTML5**: Semantic web structure
- **Tailwind CSS**: Mobile-first responsive design framework
- **JavaScript**: Client-side interactivity and validation
- **Font Awesome**: Icon library

### Backend
- **ASP.NET Web Forms (C#)**: Server-side processing
- **Forms Authentication**: Secure user authentication
- **ADO.NET**: Database connectivity

### Database
- **Microsoft SQL Server Express**: Data storage with LocalDB
- **Database Location**: App_Data folder

### Development Tools
- **Visual Studio**: IDE for development
- **SQL Server Management Studio**: Database management

## Database Schema

### Tables
1. **Customer** - User accounts (customers and admins)
2. **Category** - Product categories
3. **Product** - Product information
4. **Order** - Customer orders
5. **Order_Item** - Order line items
6. **Cart** - Shopping cart items
7. **Review** - Product reviews and ratings
8. **Payment** - Payment information

## Project Structure

```
RelicEcommerce/
├── Admin/                      # Admin pages (Dashboard, Manage Products, etc.)
├── App_Code/                   # Helper classes
│   └── DBHelper.cs            # Database helper class
├── App_Data/                   # Database files
│   └── CreateDatabase.sql     # Database schema script
├── CSS/                        # Stylesheets
│   └── custom.css             # Custom styles
├── Images/                     # Image assets
│   ├── products/              # Product images
│   └── categories/            # Category images
├── JS/                         # JavaScript files
│   └── site.js                # Site-wide JavaScript
├── Default.aspx               # Home page
├── Login.aspx                 # Login page
├── Register.aspx              # Registration page
├── Shop.aspx                  # Product catalog
├── ProductDetails.aspx        # Product details
├── Cart.aspx                  # Shopping cart
├── Checkout.aspx              # Checkout process
├── Orders.aspx                # Order history
├── Profile.aspx               # User profile
├── About.aspx                 # About page
├── Contact.aspx               # Contact page
├── Site.Master                # Master page layout
├── Site.Master.cs             # Master page code-behind
└── Web.config                 # Configuration file
```

## Key Features

### Customer Features
1. **User Registration & Login**
   - Secure account creation
   - Forms authentication
   - Remember me functionality

2. **Product Browsing**
   - Category-based navigation
   - Search functionality
   - Product details with images
   - Featured products
   - Sale/discount badges

3. **Shopping Cart**
   - Add/remove items
   - Update quantities
   - Real-time cart count
   - Cart summary

4. **Checkout Process**
   - Shipping address management
   - Order review
   - Order placement

5. **Order Management**
   - Order history
   - Order tracking
   - Order status updates

6. **Reviews & Ratings**
   - Submit product reviews
   - 5-star rating system
   - View customer feedback

7. **Profile Management**
   - Update personal information
   - Change password
   - Manage addresses

### Admin Features
1. **Dashboard**
   - Sales overview
   - Recent orders
   - Product statistics
   - User statistics

2. **Product Management**
   - Add/Edit/Delete products
   - Manage product images
   - Set pricing and discounts
   - Inventory management

3. **Category Management**
   - Add/Edit/Delete categories
   - Category activation

4. **Order Management**
   - View all orders
   - Update order status
   - Track deliveries
   - Generate invoices

5. **User Management**
   - View registered users
   - Manage user accounts
   - Admin role assignment

6. **Review Management**
   - Approve/reject reviews
   - Moderate feedback

## Setup Instructions

### Prerequisites
- Windows OS
- Visual Studio 2019 or later
- SQL Server LocalDB or SQL Server Express
- .NET Framework 4.8

### Installation Steps

1. **Clone or Extract Project**
   ```
   Extract the RelicEcommerce folder to your desired location
   ```

2. **Open Project in Visual Studio**
   - Open Visual Studio
   - File → Open → Project/Solution
   - Navigate to RelicEcommerce folder
   - Open the .sln file (if available) or the project folder

3. **Create Database**
   - Locate `App_Data/CreateDatabase.sql`
   - Open SQL Server Management Studio or use Visual Studio's SQL Server Object Explorer
   - Execute the CreateDatabase.sql script to create the database and tables
   - The database will be created as LocalDB in App_Data folder

4. **Configure Connection String**
   - Open `Web.config`
   - Verify the connection string points to the correct database location
   - Default connection string uses LocalDB with AttachDBFilename

5. **Restore NuGet Packages**
   - Right-click on solution/project
   - Select "Restore NuGet Packages"

6. **Build Project**
   - Build → Build Solution (Ctrl+Shift+B)
   - Resolve any errors if they occur

7. **Run Application**
   - Press F5 or click Start button
   - Application will open in default browser

### Default Login Credentials

**Admin Account:**
- Email: admin@relic.com
- Password: Admin@123

**Customer Account:**
- Email: bibhab@gmail.com
- Password: User@123

## Configuration

### Web.config Settings

**Connection String:**
```xml
<connectionStrings>
  <add name="RelicConnectionString" 
       connectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\RelicDB.mdf;Integrated Security=True;Connect Timeout=30" 
       providerName="System.Data.SqlClient" />
</connectionStrings>
```

**Authentication:**
```xml
<authentication mode="Forms">
  <forms name=".RelicAuth" 
         loginUrl="~/Login.aspx" 
         defaultUrl="~/Default.aspx" 
         timeout="30" />
</authentication>
```

**Protected Pages:**
- Admin/* - Requires authentication
- Cart.aspx - Requires authentication
- Checkout.aspx - Requires authentication
- Orders.aspx - Requires authentication
- Profile.aspx - Requires authentication

## Usage Guide

### For Customers

1. **Registration**
   - Navigate to Register.aspx
   - Fill in required information
   - Agree to terms and conditions
   - Click "Create Account"

2. **Browsing Products**
   - Visit Shop.aspx to view all products
   - Use category filters to narrow search
   - Click on product for detailed view

3. **Adding to Cart**
   - Click "Add to Cart" button on product
   - View cart icon in header (shows item count)
   - Navigate to Cart.aspx to review items

4. **Placing Order**
   - Review cart items
   - Click "Proceed to Checkout"
   - Enter shipping information
   - Confirm order

5. **Tracking Orders**
   - Go to Orders.aspx
   - View order status
   - Track delivery

### For Administrators

1. **Login**
   - Use admin credentials
   - Access Admin panel from header

2. **Managing Products**
   - Navigate to Admin/ManageProducts.aspx
   - Add new products with details and images
   - Edit existing products
   - Delete or deactivate products

3. **Managing Orders**
   - Go to Admin/ManageOrders.aspx
   - View all customer orders
   - Update order status (Pending → Processing → Shipped → Delivered)

4. **Managing Categories**
   - Access Admin/ManageCategories.aspx
   - Add/Edit/Delete categories

## Mobile Responsiveness

The application is fully responsive and optimized for:
- Desktop (1920px and above)
- Laptop (1366px - 1920px)
- Tablet (768px - 1366px)
- Mobile (320px - 768px)

Tailwind CSS breakpoints ensure optimal viewing on all devices.

## Security Features

1. **Forms Authentication**
   - Secure login system
   - Encrypted authentication cookies
   - Session management

2. **Authorization**
   - Role-based access control
   - Protected admin pages
   - Member-only features

3. **Input Validation**
   - Server-side validation
   - Client-side validation
   - SQL injection prevention via parameterized queries
   - XSS protection

4. **Password Security**
   - Note: In production, implement password hashing (BCrypt, PBKDF2)
   - Current implementation uses plain text for demo purposes

## Known Limitations

1. **Payment Gateway**
   - Not integrated (out of scope)
   - Payment method selection only

2. **Email Notifications**
   - Not implemented
   - Would require SMTP configuration

3. **Password Hashing**
   - Current: Plain text storage (for demo)
   - Production: Should use BCrypt or similar

4. **Image Upload**
   - Currently uses URL paths
   - File upload can be implemented

## Future Enhancements

1. Payment gateway integration (Stripe, PayPal, etc.)
2. Email notifications for orders
3. Password hashing and salting
4. Wishlist functionality
5. Advanced search and filters
6. Product comparison
7. Coupon/discount codes
8. Multi-language support
9. Product recommendations
10. Sales analytics dashboard

## Troubleshooting

### Database Connection Issues
- Verify SQL Server LocalDB is installed
- Check connection string in Web.config
- Ensure database file exists in App_Data

### Authentication Issues
- Clear browser cookies
- Check Forms Authentication configuration
- Verify user exists in Customer table

### Missing Images
- Check Images folder structure
- Verify image paths in database
- Ensure placeholder image exists

### Build Errors
- Restore NuGet packages
- Clean and rebuild solution
- Check .NET Framework version

## Support

For issues or questions:
- Review documentation
- Check troubleshooting section
- Examine error logs in Visual Studio Output window

## Credits

**Developed by:** Bibhab (as per proposal)
**Project:** Relic E-Commerce Web Application
**Course:** Mobile Web & Multimedia
**Framework:** ASP.NET Web Forms
**Database:** Microsoft SQL Server

## License

This is an academic project developed as per the course requirements.

---

**Note:** This is a demonstration project for educational purposes. For production deployment, implement proper security measures including password hashing, HTTPS, input sanitization, and regular security audits.

# 🚀 Quick Start Guide - Relic E-Commerce

Get your Relic E-Commerce application up and running in minutes!

---

## ⚡ Fast Setup (3 Steps)

### Step 1: Open in Visual Studio (1 minute)
```
1. Launch Visual Studio 2019/2022
2. File → Open → Web Site
3. Select folder: /home/bibhab/aashma/RelicEcommerce
4. Click "Open"
```

### Step 2: Create Database (2 minutes)
```
Option A - Using Visual Studio:
1. View → SQL Server Object Explorer
2. Connect to (LocalDB)\MSSQLLocalDB
3. Right-click Databases → Add New Database → "RelicDB"
4. Right-click RelicDB → New Query
5. Open and execute: App_Data/CreateDatabase.sql

Option B - Using SQL Server Management Studio:
1. Connect to (LocalDB)\MSSQLLocalDB
2. Open App_Data/CreateDatabase.sql
3. Execute the script (F5)
```

### Step 3: Run Application (30 seconds)
```
1. In Visual Studio, press F5
2. Wait for browser to open
3. Application is running!
```

---

## 🔑 Login Credentials

### Admin Account
```
Email: admin@relic.com
Password: Admin@123
```

### Customer Account
```
Email: bibhab@gmail.com
Password: User@123
```

---

## 🎯 Quick Test Checklist

### As a Customer:
- [ ] Visit home page (Default.aspx)
- [ ] Browse products (Shop.aspx)
- [ ] Register new account
- [ ] Login with your account
- [ ] Add product to cart
- [ ] View cart
- [ ] Update quantities

### As Admin:
- [ ] Login with admin credentials
- [ ] Access Admin panel (header link)
- [ ] View dashboard statistics
- [ ] Check recent orders
- [ ] See low stock alerts

---

## 📁 Project Structure at a Glance

```
RelicEcommerce/
├── 🏠 Default.aspx          → Home page
├── 🛍️ Shop.aspx             → Product catalog
├── 🔐 Login.aspx            → User login
├── 📝 Register.aspx         → User registration
├── 🛒 Cart.aspx             → Shopping cart
├── 👤 Profile.aspx          → User profile
│
├── 👑 Admin/
│   ├── Dashboard.aspx       → Admin dashboard
│   ├── ManageProducts.aspx  → Product management
│   ├── ManageOrders.aspx    → Order management
│   └── ManageUsers.aspx     → User management
│
├── 💾 App_Data/
│   └── CreateDatabase.sql   → Database setup script
│
├── 🎨 CSS/custom.css        → Custom styles
├── ⚡ JS/site.js            → JavaScript functions
├── 🖼️ Images/               → Image assets
└── ⚙️ Web.config            → Configuration
```

---

## 🔧 Common Issues & Quick Fixes

### ❌ "Cannot open database"
**Fix:** Execute CreateDatabase.sql first

### ❌ "Login page not found"
**Fix:** Ensure you opened as Web Site (not project)

### ❌ "Build errors"
**Fix:** 
```
1. Right-click solution
2. Clean Web Site
3. Build Web Site
```

### ❌ "LocalDB not found"
**Fix:** Install SQL Server Express with LocalDB from Microsoft

---

## 📖 Key URLs (when running)

```
Home:           http://localhost:xxxxx/Default.aspx
Shop:           http://localhost:xxxxx/Shop.aspx
Login:          http://localhost:xxxxx/Login.aspx
Register:       http://localhost:xxxxx/Register.aspx
Cart:           http://localhost:xxxxx/Cart.aspx
Admin:          http://localhost:xxxxx/Admin/Dashboard.aspx
```
*(xxxxx = your assigned port number)*

---

## 🎨 Sample Data Included

### 6 Categories:
- Traditional Paintings
- Sculptures
- Pottery & Ceramics
- Textiles & Fabrics
- Jewelry
- Wood Crafts

### 8 Products:
- Mandala Thangka Painting (Rs. 15,000)
- Ganesha Wooden Sculpture (Rs. 8,500)
- Traditional Clay Pot Set (Rs. 2,500)
- Pashmina Shawl (Rs. 12,000)
- Silver Filigree Necklace (Rs. 6,500)
- Carved Wooden Window Frame (Rs. 18,000)
- Buddha Statue Bronze (Rs. 5,500)
- Dhaka Fabric (Rs. 3,500)

### 2 User Accounts:
- 1 Admin (admin@relic.com)
- 1 Customer (bibhab@gmail.com)

---

## 🌟 Features to Test

### Customer Journey:
1. 🏠 Browse home page
2. 🔍 Search/filter products
3. 👀 View product details
4. 🛒 Add to cart
5. ✏️ Update cart quantities
6. 💳 Proceed to checkout

### Admin Journey:
1. 📊 View dashboard stats
2. 📦 Check product inventory
3. 📋 Review orders
4. 👥 Manage users
5. ⚠️ Monitor low stock

---

## 📱 Responsive Design

Test on different screen sizes:
- 📱 Mobile: 320px - 767px
- 📱 Tablet: 768px - 1023px
- 💻 Desktop: 1024px+

Use browser DevTools (F12) → Toggle device toolbar

---

## 💡 Pro Tips

1. **Use Chrome DevTools** to test responsive design
2. **Check browser console** (F12) for any errors
3. **Test with different accounts** (customer vs admin)
4. **Clear cookies** if login issues occur
5. **Use Incognito mode** for fresh testing

---

## 📚 More Information

- **Full Documentation:** README.md
- **Setup Details:** SETUP_GUIDE.md
- **Project Summary:** PROJECT_SUMMARY.md

---

## ✅ You're All Set!

Your Relic E-Commerce application is ready to demonstrate:
- ✅ Mobile-responsive design
- ✅ User authentication
- ✅ Shopping cart functionality
- ✅ Admin dashboard
- ✅ Product management
- ✅ Order tracking

**Happy Testing! 🎉**

---

## 🆘 Need Help?

1. Check README.md for detailed documentation
2. Review code comments for implementation details
3. Check browser console for JavaScript errors
4. Check Visual Studio Output window for server errors

---

**Version:** 1.0  
**Last Updated:** February 20, 2026  
**Status:** Production Ready ✅

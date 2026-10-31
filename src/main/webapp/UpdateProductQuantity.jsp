
<%@page import="com.bean.CustomerLoginBean"%>
<%@page import="com.bean.AdminLoginBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order Confirmation | ShopEase</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
      rel="stylesheet">

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, Helvetica, sans-serif;
    background: #f3f6fc;
    color: #263445;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

/* NAVBAR */
.navbar {
    background: #ffffff;
    padding: 16px 7%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.06);
}

.logo {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    font-size: 26px;
    font-weight: bold;
    color: #2563eb;
    text-decoration: none;
}

.logo:hover {
    color: #1d4ed8;
}

.nav-label {
    color: #64748b;
    font-size: 14px;
    font-weight: 600;
}

/* MAIN */
.container {
    width: 90%;
    max-width: 750px;
    margin: 40px auto;
    flex: 1;
}

/* HEADING */
.heading {
    background: linear-gradient(115deg, #2857dc, #4f46e5);
    color: #ffffff;
    padding: 28px 25px;
    border-radius: 14px;
    margin-bottom: 28px;
    box-shadow: 0 8px 20px rgba(37, 99, 235, 0.15);
}

.heading h1 {
    font-size: 28px;
    margin-bottom: 8px;
}

.heading p {
    font-size: 15px;
    line-height: 1.6;
    color: #eaf0ff;
}

/* ORDER CARD */
.order-card {
    background: #ffffff;
    padding: 35px;
    border-radius: 14px;
    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.06);
}

.success-icon {
    width: 68px;
    height: 68px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 22px;
    border-radius: 50%;
    background: #dcfce7;
    color: #16a34a;
    font-size: 36px;
}

.order-card h2 {
    color: #1e293b;
    font-size: 23px;
    margin-bottom: 12px;
}

.order-message {
    color: #64748b;
    font-size: 15px;
    line-height: 1.8;
    margin-bottom: 25px;
}

/* ORDER DETAILS */
.order-details {
    padding: 20px;
    border: 1px solid #e2e8f0;
    border-radius: 10px;
    background: #f8fafc;
    margin-bottom: 28px;
}

.detail-label {
    color: #64748b;
    font-size: 13px;
    margin-bottom: 8px;
}

.amount {
    color: #1e293b;
    font-size: 25px;
    font-weight: 800;
    overflow-wrap: anywhere;
}

/* BUTTONS */
.button-group {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
}

.btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 9px;
    min-height: 46px;
    padding: 12px 20px;
    border: 1px solid transparent;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 700;
    text-align: center;
    text-decoration: none;
    cursor: pointer;
    transition: background 0.2s, color 0.2s,
                border-color 0.2s, transform 0.2s;
}

/* BLUE VIEW PRODUCTS BUTTON */
.primary-btn {
    flex: 1;
    color: #ffffff;
    background: #2563eb;
    border-color: #2563eb;
}

.primary-btn:hover {
    color: #ffffff;
    background: #1d4ed8;
    border-color: #1d4ed8;
    transform: translateY(-1px);
}

/* LOGOUT BUTTON: WHITE WITH RED BORDER */
.logout-btn {
    flex: 1;
    color: #ff3349;
    background: #ffffff;
    border: 1px solid #ff5364;
}

.logout-btn:hover {
    color: #ffffff;
    background: #e63246;
    border-color: #e63246;
    transform: translateY(-1px);
}

.logout-btn:active {
    color: #ffffff;
    background: #c82333;
    border-color: #c82333;
    transform: translateY(0);
}

/* KEYBOARD ACCESSIBILITY */
.btn:focus-visible {
    outline: 3px solid #93c5fd;
    outline-offset: 3px;
}

/* MESSAGE CARD */
.message-card {
    background: #ffffff;
    padding: 30px;
    border-radius: 14px;
    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.06);
}

.message-card h2 {
    color: #1e293b;
    font-size: 22px;
    margin-bottom: 12px;
}

.message-card p {
    color: #64748b;
    font-size: 15px;
    line-height: 1.8;
    margin-bottom: 22px;
}

/* FOOTER */
.footer {
    text-align: center;
    padding: 24px 15px;
    color: #94a3b8;
    font-size: 13px;
    background: #ffffff;
}

/* RESPONSIVE DESIGN */
@media (max-width: 600px) {
    .navbar {
        padding: 15px 5%;
    }

    .logo {
        font-size: 23px;
    }

    .nav-label {
        font-size: 12px;
    }

    .container {
        width: 92%;
        margin: 28px auto;
    }

    .heading {
        padding: 23px 20px;
    }

    .heading h1 {
        font-size: 24px;
    }

    .heading p {
        font-size: 14px;
    }

    .order-card,
    .message-card {
        padding: 24px 20px;
    }

    .order-card h2 {
        font-size: 21px;
    }

    .button-group {
        flex-direction: column;
    }

    .btn {
        width: 100%;
    }
}

@media (prefers-reduced-motion: reduce) {
    *,
    *::before,
    *::after {
        transition: none !important;
    }
}
</style>
</head>

<body>

<%
    String msg = (String) request.getAttribute("msg");

    CustomerLoginBean cb =
        (CustomerLoginBean) session.getAttribute("cbean");

    Object amount = request.getAttribute("amnt");
%>

<!-- NAVBAR -->
<nav class="navbar">
    <a href="viewProduct" class="logo">
        <i class="bi bi-shop"></i>
        ShopEase
    </a>

    <span class="nav-label">Order Confirmation</span>
</nav>

<!-- MAIN CONTENT -->
<main class="container">

    <% if (msg != null) { %>

        <!-- GENERAL MESSAGE -->
        <section class="heading">
            <h1>Order Update</h1>
            <p>Your ShopEase order information.</p>
        </section>

        <section class="message-card">
            <h2>
                <i class="bi bi-info-circle" style="color: #2563eb;"></i>
                Message
            </h2>

            <p><%= msg %></p>

            <div class="button-group">
                <a href="viewProduct" class="btn primary-btn">
                    <i class="bi bi-box-seam"></i>
                    View Products
                    <i class="bi bi-arrow-right"></i>
                </a>

                <a href="logout" class="btn logout-btn">
                    <i class="bi bi-box-arrow-right"></i>
                    Logout
                </a>
            </div>
        </section>

    <% } else if (cb != null) { %>

        <!-- SUCCESS BANNER -->
        <section class="heading">
            <h1>Order Confirmation</h1>
            <p>Thank you for shopping with ShopEase.</p>
        </section>

        <!-- SUCCESS CARD -->
        <section class="order-card">

            <div class="success-icon">
                <i class="bi bi-check-lg"></i>
            </div>

            <h2>Order placed successfully!</h2>

            <p class="order-message">
                Thank you, <strong><%= cb.getCfname() %></strong>.
                Your order has been placed successfully.
            </p>

            <div class="order-details">
                <div class="detail-label">Total Amount Charged</div>

                <div class="amount">
                    <%= amount != null ? amount : "Not available" %>
                </div>
            </div>

            <div class="button-group">
                <a href="viewProduct" class="btn primary-btn">
                    <i class="bi bi-bag"></i>
                    Continue Shopping
                    <i class="bi bi-arrow-right"></i>
                </a>

                <a href="logout" class="btn logout-btn">
                    <i class="bi bi-box-arrow-right"></i>
                    Logout
                </a>
            </div>

        </section>

    <% } else { %>

        <!-- SESSION NOT AVAILABLE -->
        <section class="heading">
            <h1>Order Information</h1>
            <p>We could not find your customer session.</p>
        </section>

        <section class="message-card">
            <h2>Customer session unavailable</h2>

            <p>
                Please log in again to continue shopping.
            </p>

            <a href="CustomerLogin.html" class="btn primary-btn">
                <i class="bi bi-box-arrow-in-right"></i>
                Customer Login
            </a>
        </section>

    <% } %>

</main>

<!-- FOOTER -->
<footer class="footer">
    &copy; 2026 ShopEase. All rights reserved.
</footer>

</body>
</html>

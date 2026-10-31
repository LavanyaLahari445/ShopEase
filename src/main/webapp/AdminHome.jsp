<%@ page import="com.bean.AdminLoginBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ShopEase | Admin Dashboard</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            font-family: Arial, sans-serif;
            background: #f4f7fc;
            color: #24334a;
        }

        /* Navigation */

        .navbar {
            padding: 16px 0;
            background: #ffffff;
            border-bottom: 1px solid #e6ebf2;
        }

        .brand {
            display: inline-flex;
            align-items: center;
            gap: 9px;
            color: #2768ff;
            font-size: 27px;
            font-weight: 800;
            letter-spacing: -1px;
            text-decoration: none;
        }

        .brand:hover {
            color: #1954dc;
        }

        .brand-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 39px;
            height: 39px;
            border-radius: 11px;
            background: #2768ff;
            color: #ffffff;
            font-size: 21px;
        }

        .portal-label {
            color: #64748b;
            font-size: 14px;
            font-weight: 600;
        }

        /* Main content */

        .main-content {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 45px 18px;
        }

        .dashboard-card {
            width: 100%;
            max-width: 650px;
            overflow: hidden;
            background: #ffffff;
            border: 1px solid #e8edf5;
            border-radius: 18px;
            box-shadow: 0 12px 35px rgba(31, 55, 90, 0.08);
        }

        /* Dashboard header */

        .dashboard-header {
            padding: 36px 25px;
            text-align: center;
            color: #ffffff;
            background: linear-gradient(135deg, #17345f, #2864ad);
        }

        .admin-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 76px;
            height: 76px;
            margin: 0 auto 18px;
            border: 1px solid rgba(255, 255, 255, 0.25);
            border-radius: 22px;
            background: rgba(255, 255, 255, 0.13);
            font-size: 36px;
        }

        .dashboard-header h1 {
            margin-bottom: 10px;
            font-size: 28px;
            font-weight: 700;
            overflow-wrap: anywhere;
        }

        .dashboard-header p {
            margin: 0;
            color: #dce8fa;
            font-size: 14px;
        }

        /* Dashboard body */

        .dashboard-body {
            padding: 32px;
        }

        .section-title {
            margin-bottom: 10px;
            color: #17345f;
            font-size: 21px;
            font-weight: 700;
        }

        .section-description {
            margin-bottom: 26px;
            color: #718096;
            font-size: 14px;
            line-height: 1.8;
        }

        /* Buttons */

        .action-button {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 9px;
            width: 100%;
            min-height: 49px;
            padding: 13px 18px;
            border: 1px solid transparent;
            border-radius: 9px;
            font-size: 14px;
            font-weight: 700;
            text-align: center;
            text-decoration: none;
            transition: background 0.2s ease,
                        color 0.2s ease,
                        border-color 0.2s ease;
        }

        .btn-add,
        .btn-login {
            background: #2768ff;
            border-color: #2768ff;
            color: #ffffff;
        }

        .btn-add:hover,
        .btn-login:hover {
            background: #1954dc;
            border-color: #1954dc;
            color: #ffffff;
        }

        .btn-view {
            background: #ffffff;
            border-color: #2768ff;
            color: #2768ff;
        }

        .btn-view:hover {
            background: #edf4ff;
            color: #1954dc;
        }

        .btn-logout {
            background: #ffffff;
            border: 1px solid #dc3545;
            color: #dc3545;
        }

        .btn-logout:hover {
            background: #dc3545;
            color: #ffffff;
        }

        /* Error and session status */

        .status-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 72px;
            height: 72px;
            margin: 0 auto 20px;
            border-radius: 20px;
            font-size: 34px;
        }

        .error-icon {
            background: #fff0f1;
            color: #dc3545;
        }

        .expired-icon {
            background: #edf4ff;
            color: #2768ff;
        }

        .status-title {
            margin-bottom: 10px;
            color: #17345f;
            font-size: 25px;
            font-weight: 700;
        }

        .status-description {
            margin-bottom: 22px;
            color: #718096;
            font-size: 14px;
            line-height: 1.7;
        }

        .error-message {
            padding: 12px 15px;
            border: 1px solid #f5c2c7;
            border-radius: 9px;
            background: #fff1f2;
            color: #b02a37;
            font-size: 14px;
            overflow-wrap: anywhere;
        }

        /* Footer */

        .footer {
            padding: 20px 12px;
            border-top: 1px solid #e6ebf2;
            background: #ffffff;
            color: #8491a5;
            font-size: 12px;
            text-align: center;
        }

        /* Mobile responsive */

        @media (max-width: 576px) {
            .navbar {
                padding: 13px 0;
            }

            .brand {
                font-size: 23px;
            }

            .brand-icon {
                width: 34px;
                height: 34px;
                font-size: 18px;
            }

            .portal-label {
                font-size: 12px;
            }

            .main-content {
                padding: 28px 15px;
            }

            .dashboard-header {
                padding: 30px 18px;
            }

            .dashboard-header h1 {
                font-size: 23px;
            }

            .dashboard-body {
                padding: 25px 20px;
            }

            .admin-icon {
                width: 65px;
                height: 65px;
                font-size: 30px;
            }
        }
    </style>
</head>

<body>

<%
    String msg = (String) request.getAttribute("msg");

    AdminLoginBean ab =
        (AdminLoginBean) session.getAttribute("abean");
%>

<!-- Navigation -->
<nav class="navbar">
    <div class="container d-flex justify-content-between align-items-center">

        <a href="<%= request.getContextPath() %>/index.html"
           class="brand">

            <span class="brand-icon">
                <i class="bi bi-bag-check-fill"></i>
            </span>

            ShopEase
        </a>

        <span class="portal-label">
            <i class="bi bi-shield-lock me-1"></i>
            Admin Portal
        </span>

    </div>
</nav>

<!-- Main content -->
<main class="main-content">

    <% if (msg != null) { %>

        <!-- Login failed -->
        <section class="dashboard-card">

            <div class="dashboard-body text-center">

                <div class="status-icon error-icon">
                    <i class="bi bi-shield-x"></i>
                </div>

                <h2 class="status-title">Login Failed</h2>

                <p class="status-description">
                    We couldn't verify your admin credentials.
                    Please check your username and password and try again.
                </p>

                <div class="error-message mb-4" role="alert">
                    <i class="bi bi-exclamation-circle-fill me-2"></i>
                    <%= msg %>
                </div>

                <a href="<%= request.getContextPath() %>/AdminLogin.html"
                   class="action-button btn-login">

                    <i class="bi bi-arrow-repeat"></i>
                    Try Again

                </a>

            </div>

        </section>

    <% } else if (ab != null) { %>

        <!-- Successful admin login -->
        <section class="dashboard-card">

            <div class="dashboard-header">

                <div class="admin-icon">
                    <i class="bi bi-person-workspace"></i>
                </div>

                <h1>Welcome, <%= ab.getFname() %>!</h1>

                <p>Manage your ShopEase store from one place.</p>

            </div>

            <div class="dashboard-body">

                <h5 class="section-title">Admin Dashboard</h5>

                <p class="section-description">
                    Manage your store inventory, add new products,
                    and view the products currently available in ShopEase.
                </p>

                <div class="d-grid gap-3">

                    <a href="<%= request.getContextPath() %>/AddProduct.html"
                       class="action-button btn-add">

                        <i class="bi bi-plus-circle"></i>
                        Add Product

                    </a>

                    <a href="<%= request.getContextPath() %>/viewl"
                       class="action-button btn-view">

                        <i class="bi bi-box-seam"></i>
                        View Products
                        <i class="bi bi-arrow-right"></i>

                    </a>

                    <a href="<%= request.getContextPath() %>/logout"
                       class="action-button btn-logout">

                        <i class="bi bi-box-arrow-right"></i>
                        Logout

                    </a>

                </div>

            </div>

        </section>

    <% } else { %>

        <!-- Session expired -->
        <section class="dashboard-card">

            <div class="dashboard-body text-center">

                <div class="status-icon expired-icon">
                    <i class="bi bi-shield-exclamation"></i>
                </div>

                <h2 class="status-title">Session Expired</h2>

                <p class="status-description">
                    Your admin session is no longer available.
                    Please log in again to continue.
                </p>

                <a href="<%= request.getContextPath() %>/AdminLogin.html"
                   class="action-button btn-login">

                    <i class="bi bi-box-arrow-in-right"></i>
                    Go to Admin Login

                </a>

            </div>

        </section>

    <% } %>

</main>

<!-- Footer -->
<footer class="footer">
    &copy; 2026 ShopEase. All rights reserved.
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
<%@ page import="com.bean.CustomerLoginBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ShopEase | Customer Dashboard</title>

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
            background: #ffffff;
            border-bottom: 1px solid #e6ebf2;
            padding: 16px 0;
        }

        .brand {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            color: #2768ff;
            font-size: 27px;
            font-weight: 800;
            text-decoration: none;
            letter-spacing: -1px;
        }

        .brand:hover {
            color: #1954dc;
        }

        .brand-icon {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            border-radius: 11px;
            background: #2768ff;
            color: white;
            font-size: 21px;
        }

        .nav-label {
            color: #64748b;
            font-size: 14px;
            font-weight: 600;
        }

        /* Main section */
        .main-content {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 18px;
        }

        /* Dashboard card */
        .dashboard-card {
            width: 100%;
            max-width: 620px;
            background: #ffffff;
            border: 1px solid #e9eef5;
            border-radius: 18px;
            overflow: hidden;
            box-shadow: 0 12px 35px rgba(31, 55, 90, 0.08);
        }

        /* Header */
        .card-header-custom {
            padding: 38px 25px 32px;
            text-align: center;
            color: #ffffff;
            background: linear-gradient(135deg, #17345f, #2864ad);
        }

        .user-icon {
            width: 76px;
            height: 76px;
            margin: 0 auto 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 1px solid rgba(255, 255, 255, 0.25);
            border-radius: 22px;
            background: rgba(255, 255, 255, 0.13);
            font-size: 36px;
        }

        .card-header-custom h2 {
            margin-bottom: 10px;
            font-size: 28px;
            font-weight: 700;
            overflow-wrap: anywhere;
        }

        .card-header-custom p {
            margin: 0;
            color: #dce8fa;
            font-size: 14px;
        }

        /* Card content */
        .card-content {
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
            transition: 0.2s ease;
        }

        .btn-products,
        .btn-login {
            background: #2768ff;
            border-color: #2768ff;
            color: #ffffff;
        }

        .btn-products:hover,
        .btn-login:hover {
            background: #1954dc;
            border-color: #1954dc;
            color: #ffffff;
        }

        .btn-logout {
            background: #ffffff;
            border-color: #dc3545;
            color: #dc3545;
        }

        .btn-logout:hover {
            background: #dc3545;
            color: #ffffff;
        }

        /* Status screens */
        .status-icon {
            width: 72px;
            height: 72px;
            margin: 0 auto 20px;
            display: flex;
            align-items: center;
            justify-content: center;
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

        @media (max-width: 576px) {
            .brand {
                font-size: 23px;
            }

            .nav-label {
                font-size: 12px;
            }

            .main-content {
                padding: 25px 15px;
            }

            .card-header-custom {
                padding: 30px 18px;
            }

            .card-header-custom h2 {
                font-size: 23px;
            }

            .card-content {
                padding: 25px 20px;
            }

            .user-icon {
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

    CustomerLoginBean ab =
        (CustomerLoginBean) session.getAttribute("cbean");
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

        <span class="nav-label">
            <i class="bi bi-person-circle me-1"></i>
            Customer Portal
        </span>

    </div>
</nav>

<!-- Main content -->
<main class="main-content">

    <% if (msg != null) { %>

        <!-- Login failed -->
        <section class="dashboard-card">
            <div class="card-content text-center">

                <div class="status-icon error-icon">
                    <i class="bi bi-shield-x"></i>
                </div>

                <h2 class="status-title">Login Failed</h2>

                <p class="status-description">
                    We couldn't verify your login details.
                    Please check your username and password.
                </p>

                <div class="error-message mb-4" role="alert">
                    <i class="bi bi-exclamation-circle-fill me-2"></i>
                    <%= msg %>
                </div>

                <a href="<%= request.getContextPath() %>/CustomerLogin.html"
                   class="action-button btn-login">

                    <i class="bi bi-arrow-repeat"></i>
                    Try Again

                </a>

            </div>
        </section>

    <% } else if (ab != null) { %>

        <!-- Successful login -->
        <section class="dashboard-card">

            <div class="card-header-custom">

                <div class="user-icon">
                    <i class="bi bi-person-heart"></i>
                </div>

                <h2>Welcome, <%= ab.getCfname() %>!</h2>

                <p>Your shopping journey starts here.</p>

            </div>

            <div class="card-content">

                <h5 class="section-title">Customer Dashboard</h5>

                <p class="section-description">
                    Explore available products, compare prices, and
                    find what you need. Enjoy a simple and convenient
                    shopping experience with ShopEase.
                </p>

                <div class="d-grid gap-3">

                    <a href="<%= request.getContextPath() %>/viewProduct"
                       class="action-button btn-products">

                        <i class="bi bi-grid"></i>
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

            <div class="card-content text-center">

                <div class="status-icon expired-icon">
                    <i class="bi bi-shield-exclamation"></i>
                </div>

                <h2 class="status-title">Session Expired</h2>

                <p class="status-description">
                    Your customer session is no longer available.
                    Please log in again to continue shopping.
                </p>

                <a href="<%= request.getContextPath() %>/CustomerLogin.html"
                   class="action-button btn-login">

                    <i class="bi bi-box-arrow-in-right"></i>
                    Go to Login

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
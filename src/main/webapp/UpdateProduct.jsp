<%@ page import="com.bean.ProductBean" %>
<%@ page import="com.bean.AdminLoginBean" %>
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Admin Dashboard | ShopEase</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
          rel="stylesheet">

    <style>
        :root {
            --primary: #2563eb;
            --primary-dark: #1d4ed8;
            --heading: #1e293b;
            --text: #64748b;
            --background: #f3f6fc;
            --border: #e8edf5;
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: Arial, sans-serif;
            color: var(--text);
            background: var(--background);
        }

        /* NAVBAR */

        .navbar {
            min-height: 76px;
            padding: 13px 0;
            background: #ffffff;
            box-shadow: 0 2px 8px rgba(15, 23, 42, 0.05);
        }

        .navbar .container {
            max-width: 1360px;
        }

        .brand {
            display: inline-flex;
            align-items: center;
            gap: 9px;
            color: var(--primary);
            font-size: 25px;
            font-weight: 800;
            text-decoration: none;
            letter-spacing: -0.5px;
        }

        .brand i {
            font-size: 25px;
        }

        .brand:hover {
            color: var(--primary-dark);
        }

        /* LOGOUT BUTTON */

        .logout-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 9px;
            min-width: 115px;
            min-height: 44px;
            padding: 10px 17px;
            border: 1px solid #ff5364;
            border-radius: 9px;
            color: #ff3349;
            background: #ffffff;
            font-size: 15px;
            font-weight: 600;
            text-decoration: none;
            transition: background 0.2s ease,
                        color 0.2s ease,
                        box-shadow 0.2s ease;
        }

        .logout-btn i {
            font-size: 16px;
        }

        .logout-btn:hover {
            color: #dc263d;
            background: #fff1f2;
            border-color: #dc263d;
            box-shadow: 0 4px 12px rgba(220, 38, 61, 0.10);
        }

        .logout-btn:focus-visible {
            outline: 3px solid #fecdd3;
            outline-offset: 3px;
        }

        /* MAIN DASHBOARD */

        .dashboard {
            max-width: 1360px;
            margin: 0 auto;
            padding: 44px 20px;
        }

        /* WELCOME BANNER */

        .welcome-panel {
            position: relative;
            overflow: hidden;
            padding: 48px 38px;
            border-radius: 18px;
            background: linear-gradient(115deg, #2857dc, #527cf5);
            box-shadow: 0 12px 28px rgba(37, 99, 235, 0.13);
        }

        .welcome-panel::after {
            position: absolute;
            top: -100px;
            right: -55px;
            width: 260px;
            height: 260px;
            border: 35px solid rgba(255, 255, 255, 0.07);
            border-radius: 50%;
            content: "";
        }

        .welcome-content {
            position: relative;
            z-index: 1;
        }

        .welcome-panel h1 {
            margin: 0 0 10px;
            color: #ffffff;
            font-size: clamp(27px, 3.2vw, 37px);
            font-weight: 800;
            letter-spacing: -0.5px;
        }

        .welcome-panel p {
            margin: 0;
            color: #e5edff;
            font-size: 15px;
            line-height: 1.8;
        }

        .welcome-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 76px;
            height: 76px;
            color: #ffffff;
            font-size: 57px;
        }

        /* DASHBOARD HEADING */

        .section-heading {
            margin: 48px 0 24px;
        }

        .section-heading h2 {
            margin: 0;
            color: var(--heading);
            font-size: 25px;
            font-weight: 800;
        }

        /* PRODUCT CARDS */

        .dashboard-card {
            display: flex;
            flex-direction: column;
            height: 100%;
            min-height: 280px;
            padding: 30px;
            border: 1px solid rgba(226, 232, 240, 0.65);
            border-radius: 17px;
            background: #ffffff;
            box-shadow: 0 7px 24px rgba(15, 23, 42, 0.035);
            transition: transform 0.2s ease,
                        box-shadow 0.2s ease;
        }

        .dashboard-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 28px rgba(15, 23, 42, 0.07);
        }

        .card-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 60px;
            height: 60px;
            margin-bottom: 23px;
            border-radius: 15px;
            color: var(--primary);
            background: #e8f0ff;
            font-size: 29px;
        }

        .view-icon {
            color: #059669;
            background: #e0f7ed;
        }

        .dashboard-card h3 {
            margin: 0 0 12px;
            color: var(--heading);
            font-size: 20px;
            font-weight: 750;
        }

        .dashboard-card p {
            flex-grow: 1;
            margin: 0 0 23px;
            color: #718096;
            font-size: 14px;
            line-height: 1.9;
        }

        /* CARD LINKS */

        .card-link {
            display: inline-flex;
            align-items: center;
            align-self: flex-start;
            gap: 9px;
            padding: 3px 0;
            color: var(--primary);
            font-size: 15px;
            font-weight: 700;
            text-decoration: none;
            transition: color 0.2s ease;
        }

        .card-link i {
            transition: transform 0.2s ease;
        }

        .card-link:hover {
            color: var(--primary-dark);
        }

        .card-link:hover i {
            transform: translateX(4px);
        }

        .card-link:focus-visible {
            outline: 3px solid #93c5fd;
            outline-offset: 4px;
        }

        /* STATUS MESSAGE */

        .status-message {
            margin-top: 22px;
            padding: 14px 18px;
            border: 1px solid #bfdbfe;
            border-radius: 10px;
            color: #1d4ed8;
            background: #eff6ff;
            font-size: 14px;
            overflow-wrap: anywhere;
        }

        /* FOOTER */

        .footer {
            padding: 23px 15px;
            color: #64748b;
            background: #ffffff;
            font-size: 13px;
            text-align: center;
        }

        /* RESPONSIVE DESIGN */

        @media (max-width: 767.98px) {
            .dashboard {
                padding: 30px 18px;
            }

            .welcome-panel {
                padding: 32px 25px;
            }

            .welcome-icon {
                width: 58px;
                height: 58px;
                font-size: 43px;
            }

            .section-heading {
                margin-top: 35px;
            }

            .dashboard-card {
                min-height: 250px;
                padding: 26px;
            }
        }

        @media (max-width: 575.98px) {
            .navbar {
                min-height: 68px;
            }

            .brand {
                gap: 6px;
                font-size: 22px;
            }

            .brand i {
                font-size: 22px;
            }

            .logout-btn {
                min-width: 95px;
                min-height: 40px;
                padding: 8px 12px;
                font-size: 13px;
            }

            .dashboard {
                padding: 25px 15px;
            }

            .welcome-panel {
                padding: 27px 22px;
                border-radius: 15px;
            }

            .welcome-panel h1 {
                font-size: 26px;
            }

            .welcome-panel p {
                font-size: 14px;
            }

            .welcome-icon {
                width: 42px;
                height: 42px;
                font-size: 34px;
            }

            .section-heading {
                margin: 32px 0 20px;
            }

            .section-heading h2 {
                font-size: 22px;
            }

            .dashboard-card {
                min-height: 0;
                padding: 25px;
            }

            .dashboard-card h3 {
                font-size: 19px;
            }

            .footer {
                font-size: 12px;
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
    AdminLoginBean ab =
        (AdminLoginBean) session.getAttribute("abean");

    if (ab == null) {
        response.sendRedirect("AdminLogin.html");
        return;
    }

    String message = (String) request.getAttribute("msg");
%>

<!-- NAVBAR -->
<nav class="navbar">
    <div class="container d-flex align-items-center justify-content-between">

        <a href="AdminHome.jsp" class="brand">
            <i class="bi bi-shop"></i>
            ShopEase
        </a>

        <a href="Logout" class="logout-btn">
            <i class="bi bi-box-arrow-right"></i>
            Logout
        </a>

    </div>
</nav>

<!-- DASHBOARD -->
<main class="dashboard">

    <!-- WELCOME BANNER -->
    <section class="welcome-panel">
        <div class="welcome-content">
            <div class="row align-items-center g-3">

                <div class="col">
                    <h1>Welcome, <%= ab.getFname() %>!</h1>

                    <p>
                        Manage your products and inventory from one place.
                    </p>
                </div>

                <div class="col-auto">
                    <div class="welcome-icon">
                        <i class="bi bi-person-workspace"></i>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <!-- STATUS MESSAGE -->
    <% if (message != null && !message.trim().isEmpty()) { %>

        <div class="status-message" role="status">
            <i class="bi bi-info-circle-fill me-2"></i>
            <%= message %>
        </div>

    <% } %>

    <!-- DASHBOARD OVERVIEW -->
    <section class="section-heading">
        <h2>Dashboard Overview</h2>
    </section>

    <div class="row g-4">

        <!-- ADD PRODUCT -->
        <div class="col-12 col-md-6">
            <div class="dashboard-card">

                <div class="card-icon">
                    <i class="bi bi-plus-square"></i>
                </div>

                <h3>Add Product</h3>

                <p>
                    Add new products to your store by entering product
                    code, name, company, price, and quantity.
                </p>

                <a href="AddProduct.html" class="card-link">
                    Add Product
                    <i class="bi bi-arrow-right"></i>
                </a>

            </div>
        </div>

        <!-- VIEW PRODUCTS -->
        <div class="col-12 col-md-6">
            <div class="dashboard-card">

                <div class="card-icon view-icon">
                    <i class="bi bi-box-seam"></i>
                </div>

                <h3>View Products</h3>

                <p>
                    View your existing products and check the details
                    of your store's inventory.
                </p>

                <a href="viewl" class="card-link">
                    View Products
                    <i class="bi bi-arrow-right"></i>
                </a>

            </div>
        </div>

    </div>
</main>

<!-- FOOTER -->
<footer class="footer">
    &copy; 2026 ShopEase. All Rights Reserved.
</footer>

</body>
</html>
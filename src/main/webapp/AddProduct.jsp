<%@page import="com.bean.AdminLoginBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    AdminLoginBean ab = (AdminLoginBean) session.getAttribute("abean");
    String msg = (String) request.getAttribute("msg");

    if (ab == null) {
        response.sendRedirect("AdminLogin.html");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Admin Dashboard | ShopEase</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            background: #f4f7fc;
            font-family: "Segoe UI", Arial, sans-serif;
        }

        .navbar {
            background: #ffffff;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.06);
        }

        .brand {
            font-size: 1.5rem;
            font-weight: 750;
            color: #2457d6;
            text-decoration: none;
        }

        .dashboard {
            padding-top: 45px;
            padding-bottom: 45px;
        }

        .welcome-card {
            padding: 35px;
            border-radius: 18px;
            color: white;
            background: linear-gradient(120deg, #2457d6, #527df4);
            box-shadow: 0 10px 25px rgba(36, 87, 214, 0.15);
        }

        .welcome-card h1 {
            font-size: clamp(1.7rem, 4vw, 2.4rem);
            font-weight: 700;
        }

        .welcome-card p {
            margin-bottom: 0;
            color: #eaf0ff;
        }

        .section-title {
            font-weight: 700;
            color: #202b3c;
        }

        .dashboard-card {
            height: 100%;
            padding: 28px;
            background: white;
            border: 1px solid #edf0f5;
            border-radius: 16px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.04);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 28px rgba(0, 0, 0, 0.08);
        }

        .card-icon {
            width: 58px;
            height: 58px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 14px;
            font-size: 1.7rem;
            margin-bottom: 20px;
        }

        .icon-add {
            background: #e7efff;
            color: #2457d6;
        }

        .icon-view {
            background: #e2f8ed;
            color: #198754;
        }

        .dashboard-card h3 {
            font-size: 1.25rem;
            font-weight: 700;
        }

        .dashboard-card p {
            color: #6c757d;
            line-height: 1.6;
        }

        .card-link {
            display: inline-block;
            margin-top: 12px;
            text-decoration: none;
            font-weight: 600;
            color: #2457d6;
        }

        .card-link:hover {
            color: #163d9e;
        }

        .logout-btn {
            border-radius: 8px;
            font-weight: 600;
        }

        footer {
            padding: 20px 0;
            text-align: center;
            color: #7a8494;
            font-size: 0.9rem;
        }

        @media (max-width: 576px) {
            .dashboard {
                padding-top: 25px;
            }

            .welcome-card {
                padding: 25px 20px;
            }

            .dashboard-card {
                padding: 23px;
            }
        }
    </style>
</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand">
        <div class="container">
            <a href="AdminHome.jsp" class="brand">
                <i class="bi bi-shop me-2"></i>ShopEase
            </a>

            <a href="logout" class="btn btn-outline-danger logout-btn">
                <i class="bi bi-box-arrow-right me-1"></i>
                <span class="d-none d-sm-inline">Logout</span>
            </a>
        </div>
    </nav>

    <main class="container dashboard">

        <!-- Welcome Section -->
        <section class="welcome-card mb-5">
            <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3">
                <div>
                    <h1>
                        Welcome, <%= ab.getFname() %>!
                    </h1>

                    <p>
                        <%= msg != null ? msg : "Manage your products and inventory from your dashboard." %>
                    </p>
                </div>

                <div class="d-none d-md-block">
                    <i class="bi bi-person-workspace" style="font-size: 4rem;"></i>
                </div>
            </div>
        </section>

        <!-- Dashboard Cards -->
        <section>
            <h2 class="section-title mb-4">Dashboard Overview</h2>

            <div class="row g-4">

                <!-- Add Product -->
                <div class="col-12 col-md-6">
                    <div class="dashboard-card">
                        <div class="card-icon icon-add">
                            <i class="bi bi-plus-square"></i>
                        </div>

                        <h3>Add Product</h3>

                        <p>
                            Add new products to your store by entering
                            their code, name, company, price, and quantity.
                        </p>

                        <a href="AddProduct.html" class="card-link">
                            Add a Product
                            <i class="bi bi-arrow-right ms-1"></i>
                        </a>
                    </div>
                </div>

                <!-- View Products -->
                <div class="col-12 col-md-6">
                    <div class="dashboard-card">
                        <div class="card-icon icon-view">
                            <i class="bi bi-box-seam"></i>
                        </div>

                        <h3>View Products</h3>

                        <p>
                            View the products currently available in your
                            store and review your inventory details.
                        </p>

                        <a href="viewl" class="card-link">
                            View Products
                            <i class="bi bi-arrow-right ms-1"></i>
                        </a>
                    </div>
                </div>

            </div>
        </section>

    </main>

    <footer>
        <div class="container">
            &copy; <%= java.time.Year.now() %> ShopEase. Admin Dashboard.
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
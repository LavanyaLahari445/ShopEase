<%@page import="java.util.Iterator"%>
<%@page import="com.bean.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bean.CustomerLoginBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>ShopEase | Products</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">

<style>
    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        font-family: Arial, Helvetica, sans-serif;
        background: #f4f7fc;
        color: #263449;
    }

    .navbar {
        background: #ffffff;
        padding: 17px 6%;
        border-bottom: 1px solid #e5eaf2;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.03);
    }

    .brand {
        color: #2457c5;
        font-size: 24px;
        font-weight: 800;
        text-decoration: none;
    }

    .brand i {
        margin-right: 8px;
    }

    .customer-label {
        color: #526176;
        font-size: 14px;
        font-weight: 600;
    }

    .main-container {
        max-width: 1200px;
        margin: 38px auto;
        padding: 0 22px;
    }

    .page-heading {
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 15px;
        flex-wrap: wrap;
        margin-bottom: 28px;
    }

    .page-heading h1 {
        margin: 0 0 8px;
        color: #172b4d;
        font-size: 30px;
        font-weight: 750;
    }

    .page-heading p {
        margin: 0;
        color: #69778c;
        font-size: 15px;
    }

    .customer-name {
        color: #2457c5;
        font-weight: 700;
    }

    .product-count {
        color: #526176;
        background: #eaf0fc;
        padding: 9px 13px;
        border-radius: 20px;
        font-size: 13px;
        font-weight: 700;
    }

    .table-card {
        overflow: hidden;
        background: #ffffff;
        border: 1px solid #e4eaf2;
        border-radius: 12px;
        box-shadow: 0 4px 16px rgba(28, 49, 82, 0.05);
    }

    .table-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 12px;
        padding: 20px 24px;
        border-bottom: 1px solid #e9edf4;
    }

    .table-header h2 {
        margin: 0;
        color: #172b4d;
        font-size: 19px;
        font-weight: 700;
    }

    .table-responsive {
        width: 100%;
    }

    .product-table {
        width: 100%;
        margin: 0;
        border-collapse: collapse;
        white-space: nowrap;
    }

    .product-table thead th {
        padding: 15px 18px;
        background: #f7f9fd;
        color: #526176;
        font-size: 13px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 0.3px;
        border-bottom: 1px solid #e5eaf2;
    }

    .product-table tbody td {
        padding: 17px 18px;
        color: #35445a;
        font-size: 14px;
        border-bottom: 1px solid #edf0f5;
        vertical-align: middle;
    }

    .product-table tbody tr:last-child td {
        border-bottom: none;
    }

    .product-table tbody tr:hover {
        background: #f9fbff;
    }

    .product-code {
        color: #2457c5 !important;
        font-weight: 700;
    }

    .product-name {
        color: #172b4d !important;
        font-weight: 600;
    }

    .price {
        color: #172b4d !important;
        font-weight: 700;
        white-space: nowrap;
    }

    .quantity-badge {
        display: inline-block;
        min-width: 35px;
        padding: 5px 9px;
        text-align: center;
        background: #eaf7ef;
        color: #21834a;
        border-radius: 5px;
        font-size: 13px;
        font-weight: 700;
    }

    .btn-buy {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        gap: 6px;
        padding: 8px 15px;
        background: #2457c5;
        color: #ffffff;
        border: 1px solid #2457c5;
        border-radius: 6px;
        font-size: 13px;
        font-weight: 700;
        text-decoration: none;
        transition: 0.2s;
    }

    .btn-buy:hover {
        background: #1945a5;
        color: #ffffff;
    }

    .empty-state {
        padding: 55px 20px !important;
        text-align: center;
        white-space: normal;
    }

    .empty-state i {
        display: block;
        margin-bottom: 12px;
        color: #9aabc2;
        font-size: 42px;
    }

    .empty-state strong {
        display: block;
        margin-bottom: 6px;
        color: #263449;
        font-size: 17px;
    }

    .empty-state span {
        color: #69778c;
        font-size: 14px;
    }

    .bottom-actions {
        display: flex;
        justify-content: flex-end;
        margin-top: 24px;
        padding-bottom: 15px;
    }

    .btn-logout {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
        padding: 10px 22px;
        background: #ffffff;
        color: #dc3545;
        border: 1.5px solid #dc3545;
        border-radius: 7px;
        font-size: 14px;
        font-weight: 700;
        text-decoration: none;
        transition: 0.2s;
    }

    .btn-logout:hover {
        background: #dc3545;
        color: #ffffff;
    }

    .footer {
        padding: 20px;
        text-align: center;
        color: #7b8798;
        font-size: 13px;
        border-top: 1px solid #e5eaf2;
        background: #ffffff;
    }

    @media (max-width: 768px) {
        .navbar {
            padding: 15px 20px;
        }

        .brand {
            font-size: 22px;
        }

        .main-container {
            margin: 26px auto;
            padding: 0 14px;
        }

        .page-heading h1 {
            font-size: 25px;
        }

        .table-header {
            padding: 17px;
        }

        .product-table thead th,
        .product-table tbody td {
            padding: 13px;
        }

        .bottom-actions {
            justify-content: stretch;
        }

        .btn-logout {
            width: 100%;
        }
    }
</style>
</head>

<body>

<nav class="navbar">
    <div class="container-fluid p-0 d-flex justify-content-between align-items-center">
        <a href="viewProduct" class="brand">
            <i class="bi bi-shop"></i>ShopEase
        </a>

        <span class="customer-label">
            <i class="bi bi-person-circle me-1"></i> Customer
        </span>
    </div>
</nav>

<%
    CustomerLoginBean abean =
        (CustomerLoginBean) session.getAttribute("cbean");

    if (abean == null) {
        response.sendRedirect("CustomerLogin.html");
        return;
    }

    ArrayList<ProductBean> al =
        (ArrayList<ProductBean>) session.getAttribute("productsList");

    if (al == null) {
        al = new ArrayList<ProductBean>();
    }
%>

<main class="main-container">

    <div class="page-heading">
        <div>
            <h1>Explore Products</h1>
            <p>
                Hello,
                <span class="customer-name"><%= abean.getCfname() %></span>!
                Find the products you need.
            </p>
        </div>

        <span class="product-count">
            <i class="bi bi-box-seam me-1"></i>
            <%= al.size() %> Products Available
        </span>
    </div>

    <section class="table-card">

        <div class="table-header">
            <h2><i class="bi bi-grid me-2"></i>Available Products</h2>
        </div>

        <div class="table-responsive">
            <table class="product-table">

                <thead>
                    <tr>
                        <th>Product Code</th>
                        <th>Product Name</th>
                        <th>Company</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                <%
                    if (al.isEmpty()) {
                %>
                    <tr>
                        <td colspan="6" class="empty-state">
                            <i class="bi bi-inbox"></i>
                            <strong>No Products Available</strong>
                            <span>Please check back later for available products.</span>
                        </td>
                    </tr>
                <%
                    } else {
                        Iterator<ProductBean> i = al.iterator();

                        while (i.hasNext()) {
                            ProductBean pb = i.next();
                %>
                    <tr>
                        <td class="product-code"><%= pb.getPcode() %></td>

                        <td class="product-name"><%= pb.getPname() %></td>

                        <td><%= pb.getPcompany() %></td>

                        <td class="price">&#8377; <%= pb.getPprice() %></td>

                        <td>
                            <span class="quantity-badge">
                                <%= pb.getPqty() %>
                            </span>
                        </td>

                        <td>
                            <a href="buy?pcode=<%= pb.getPcode() %>"
                               class="btn-buy"
                               onclick="return confirm('Do you want to buy this product?');">
                                <i class="bi bi-cart-plus"></i> Buy
                            </a>
                        </td>
                    </tr>
                <%
                        }
                    }
                %>
                </tbody>

            </table>
        </div>
    </section>

    <div class="bottom-actions">
        <a href="logout" class="btn-logout"
           onclick="return confirm('Are you sure you want to logout?');">
            <i class="bi bi-box-arrow-right"></i> Logout
        </a>
    </div>

</main>

<footer class="footer">
    &copy; <%= java.time.Year.now().getValue() %> ShopEase. All rights reserved.
</footer>

</body>
</html>
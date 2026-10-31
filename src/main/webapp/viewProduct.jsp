
<%@page import="com.bean.AdminLoginBean" %>
<%@page import="com.bean.ProductBean" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Iterator"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>ShopEase | Manage Products</title>

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

/* Navbar */
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
    font-size: 26px;
    font-weight: 800;
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
    border-radius: 10px;
    background: #2768ff;
    color: white;
}

.portal-label {
    color: #64748b;
    font-size: 14px;
    font-weight: 600;
}

/* Main content */
.main-content {
    flex: 1;
    padding: 45px 15px;
}

.products-card {
    max-width: 1100px;
    margin: auto;
    overflow: hidden;
    background: white;
    border: 1px solid #e8edf5;
    border-radius: 16px;
    box-shadow: 0 10px 30px rgba(31, 55, 90, 0.07);
}

/* Header */
.products-header {
    padding: 28px 30px;
    color: white;
    background: linear-gradient(135deg, #17345f, #2864ad);
}

.products-header h2 {
    margin-bottom: 8px;
    font-size: 25px;
    font-weight: 700;
}

.products-header p {
    margin: 0;
    color: #dce8fa;
    font-size: 14px;
}

/* Product table */
.products-body {
    padding: 30px;
}

.table {
    margin-bottom: 0;
    vertical-align: middle;
}

.table thead th {
    padding: 16px 14px;
    background: #edf4ff;
    color: #17345f;
    font-size: 13px;
    font-weight: 700;
    white-space: nowrap;
    border-bottom: 1px solid #dce6f5;
}

.table tbody td {
    padding: 16px 14px;
    color: #475569;
    font-size: 14px;
    white-space: nowrap;
}

.table tbody tr:hover {
    background: #f5f8ff;
}

/* Action links */
.btn-edit {
    display: inline-flex;
    align-items: center;
    gap: 5px;
    padding: 7px 13px;
    border: 1px solid #2768ff;
    border-radius: 6px;
    background: white;
    color: #2768ff;
    font-size: 13px;
    font-weight: 600;
    text-decoration: none;
    transition: 0.2s;
}

.btn-edit:hover {
    background: #2768ff;
    color: white;
}

.btn-delete {
    display: inline-flex;
    align-items: center;
    gap: 5px;
    padding: 7px 13px;
    border: 1px solid #dc3545;
    border-radius: 6px;
    background: white;
    color: #dc3545;
    font-size: 13px;
    font-weight: 600;
    text-decoration: none;
    transition: 0.2s;
}

.btn-delete:hover {
    background: #dc3545;
    color: white;
}

/* Empty products */
.empty-message {
    padding: 45px 15px;
    text-align: center;
    color: #718096;
}

.empty-message i {
    font-size: 45px;
    color: #94a3b8;
}

.empty-message h5 {
    margin-top: 15px;
    color: #17345f;
    font-weight: 700;
}

/* Navigation buttons */
.action-button {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    padding: 11px 20px;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 700;
    text-decoration: none;
    transition: 0.2s;
}

.btn-back {
    color: #2768ff;
    background: white;
    border: 1px solid #2768ff;
}

.btn-back:hover {
    color: white;
    background: #2768ff;
}

/* Logout */
.btn-logout {
    color: #dc3545;
    background: white;
    border: 1px solid #dc3545;
}

.btn-logout:hover,
.btn-logout:focus,
.btn-logout:active {
    color: white;
    background: #dc3545;
    border-color: #dc3545;
}

/* Footer */
.footer {
    padding: 20px 12px;
    background: white;
    border-top: 1px solid #e6ebf2;
    color: #8491a5;
    font-size: 12px;
    text-align: center;
}

/* Responsive */
@media(max-width: 576px) {

    .products-body {
        padding: 18px 12px;
    }

    .products-header {
        padding: 23px 18px;
    }

    .brand {
        font-size: 22px;
    }

    .main-content {
        padding: 25px 10px;
    }
}

</style>
</head>

<body>

<%
AdminLoginBean abean =
    (AdminLoginBean)session.getAttribute("abean");

ArrayList<ProductBean> al =
    (ArrayList<ProductBean>)session.getAttribute("productList");
%>

<!-- Navbar -->
<nav class="navbar">
    <div class="container d-flex justify-content-between align-items-center">

        <a href="<%=request.getContextPath()%>/index.html"
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

    <div class="products-card">

        <div class="products-header">

            <h2>
                <i class="bi bi-box-seam me-2"></i>
                Manage Products
            </h2>

            <p>Edit or delete products from your ShopEase inventory.</p>

        </div>

        <div class="products-body">

            <% if (abean == null) { %>

                <div class="empty-message">

                    <i class="bi bi-shield-exclamation"></i>

                    <h5>Session Expired</h5>

                    <p>Please log in again to continue.</p>

                    <a href="<%=request.getContextPath()%>/AdminLogin.html"
                       class="action-button btn-back">
                        Admin Login
                    </a>

                </div>

            <% } else if (al == null || al.size() == 0) { %>

                <div class="empty-message">

                    <i class="bi bi-inbox"></i>

                    <h5>No Products Available</h5>

                    <p>There are currently no products in your inventory.</p>

                </div>

            <% } else { %>

                <div class="mb-4">

                    <h5 class="fw-bold" style="color:#17345f;">
                        Hello, <%=abean.getFname()%>!
                    </h5>

                    <p class="text-secondary mb-0">
                        Here are your product details.
                    </p>

                </div>

                <div class="table-responsive">

                    <table class="table table-hover">

                        <thead>
                            <tr>
                                <th>Product Code</th>
                                <th>Product Name</th>
                                <th>Company</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                        </thead>

                        <tbody>

                        <%
                        Iterator<ProductBean> i = al.iterator();

                        while(i.hasNext()) {

                            ProductBean pb = i.next();
                        %>

                            <tr>

                                <td>
                                    <strong><%=pb.getPcode()%></strong>
                                </td>

                                <td><%=pb.getPname()%></td>

                                <td><%=pb.getPcompany()%></td>

                                <td>₹ <%=pb.getPprice()%></td>

                                <td>
                                    <span class="badge text-bg-primary">
                                        <%=pb.getPqty()%>
                                    </span>
                                </td>

                                <td>
                                    <a href="<%=request.getContextPath()%>/edit?pcode=<%=pb.getPcode()%>"
                                       class="btn-edit">

                                        <i class="bi bi-pencil-square"></i>
                                        Edit

                                    </a>
                                </td>

                                <td>
                                    <a href="<%=request.getContextPath()%>/delete?pcode=<%=pb.getPcode()%>"
                                       class="btn-delete">

                                        <i class="bi bi-trash"></i>
                                        Delete

                                    </a>
                                </td>

                            </tr>

                        <%
                        }
                        %>

                        </tbody>

                    </table>

                </div>

            <% } %>

            <!-- Navigation buttons -->
            <div class="d-flex flex-wrap gap-3 mt-4">

                <a href="<%=request.getContextPath()%>/AdminHome.jsp"
                   class="action-button btn-back">

                    <i class="bi bi-arrow-left"></i>
                    Back to Dashboard

                </a>

                <a href="<%=request.getContextPath()%>/logout"
                   class="action-button btn-logout">

                    <i class="bi bi-box-arrow-right"></i>
                    Logout

                </a>

            </div>

        </div>
    </div>

</main>

<!-- Footer -->
<footer class="footer">
    &copy; 2026 ShopEase. All rights reserved.
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

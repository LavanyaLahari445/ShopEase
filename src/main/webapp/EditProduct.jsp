<%@page import="com.bean.AdminLoginBean"%>
<%@page import="com.bean.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Product | ShopEase</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">

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

/* HEADING BANNER */
.heading {
    background: linear-gradient(115deg, #2857dc, #4f46e5);
    color: white;
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

/* FORM CARD */
.form-card {
    background: #ffffff;
    padding: 35px;
    border-radius: 14px;
    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.06);
}

.form-card h2 {
    display: flex;
    align-items: center;
    gap: 10px;
    font-size: 21px;
    margin-bottom: 8px;
    color: #1e293b;
}

.form-card h2 i {
    color: #2563eb;
}

.form-description {
    color: #64748b;
    font-size: 14px;
    margin-bottom: 28px;
    line-height: 1.6;
}

/* FORM FIELDS */
.form-group {
    margin-bottom: 23px;
}

label {
    display: block;
    font-size: 14px;
    font-weight: 600;
    margin-bottom: 9px;
    color: #334155;
}

input[type="text"] {
    width: 100%;
    padding: 13px 15px;
    border: 1px solid #cbd5e1;
    border-radius: 8px;
    font-family: inherit;
    font-size: 15px;
    color: #263445;
    outline: none;
    background: #ffffff;
    transition: border-color 0.2s, box-shadow 0.2s;
}

input[type="text"]:focus {
    border-color: #2563eb;
    box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.12);
}

/* BUTTONS */
.button-group {
    display: flex;
    gap: 12px;
    margin-top: 30px;
}

.btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    padding: 13px 22px;
    border: none;
    border-radius: 8px;
    font-family: inherit;
    font-size: 15px;
    font-weight: 700;
    text-align: center;
    text-decoration: none;
    cursor: pointer;
    transition: background 0.2s, transform 0.2s;
}

.update-btn {
    background: #2563eb;
    color: #ffffff;
    flex: 1;
}

.update-btn:hover {
    background: #1d4ed8;
    transform: translateY(-1px);
}

.back-btn {
    background: #e2e8f0;
    color: #334155;
}

.back-btn:hover {
    background: #cbd5e1;
}

.btn:focus-visible {
    outline: 3px solid #93c5fd;
    outline-offset: 3px;
}

/* FOOTER */
.footer {
    text-align: center;
    padding: 24px 15px;
    color: #94a3b8;
    font-size: 13px;
    background: #ffffff;
}

/* RESPONSIVE */
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
        font-size: 23px;
    }

    .heading p {
        font-size: 14px;
    }

    .form-card {
        padding: 23px 19px;
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
    ProductBean pb = (ProductBean) request.getAttribute("productBean");

    if (pb == null) {
        response.sendRedirect("viewl");
        return;
    }
%>

<!-- NAVBAR -->
<nav class="navbar">
    <a href="viewl" class="logo">
        <i class="bi bi-shop"></i>
        ShopEase
    </a>

    <span class="nav-label">Admin Dashboard</span>
</nav>

<!-- MAIN CONTENT -->
<main class="container">

    <!-- HEADING -->
    <section class="heading">
        <h1>Edit Product</h1>
        <p>Update the product price and quantity using the form below.</p>
    </section>

    <!-- FORM -->
    <section class="form-card">

        <h2>
            <i class="bi bi-pencil-square"></i>
            Edit Product Details
        </h2>

        <p class="form-description">
            Modify the required product details and click Update Product
            to save your changes.
        </p>

        <form action="update" method="post">

            <div class="form-group">
                <label for="ppricee">Product Price</label>

                <input
                    type="text"
                    id="ppricee"
                    name="ppricee"
                    placeholder="Enter product price"
                    value="<%= pb.getPprice() %>"
                    required>
            </div>

            <div class="form-group">
                <label for="pqnty">Product Quantity</label>

                <input
                    type="text"
                    id="pqnty"
                    name="pqnty"
                    placeholder="Enter product quantity"
                    value="<%= pb.getPqty() %>"
                    required>
            </div>

            <input
                type="hidden"
                name="pcode"
                value="<%= pb.getPcode() %>">

            <div class="button-group">

                <a href="viewl" class="btn back-btn">
                    <i class="bi bi-arrow-left"></i>
                    Back to Products
                </a>

                <button type="submit" class="btn update-btn">
                    <i class="bi bi-check-circle"></i>
                    Update Product
                </button>

            </div>

        </form>
    </section>

</main>

<!-- FOOTER -->
<footer class="footer">
    &copy; 2026 ShopEase. All rights reserved.
</footer>

</body>
</html>
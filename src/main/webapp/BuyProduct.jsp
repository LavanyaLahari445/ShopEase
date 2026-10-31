<%@page import="com.bean.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    ProductBean pb = (ProductBean) request.getAttribute("pbean");

    if (pb == null) {
        response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product details not found.");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Product Details | ShopEase</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
      rel="stylesheet">

<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background-color: #f2f5fb;
        color: #263449;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }

    /* Navbar */
    .navbar {
        background-color: #ffffff;
        padding: 18px 0;
        border-bottom: 1px solid #e5eaf2;
        box-shadow: 0 3px 12px rgba(30, 55, 90, 0.04);
    }

    .brand {
        color: #2859df;
        font-size: 27px;
        font-weight: 700;
        text-decoration: none;
    }

    .back-link {
        color: #52647b;
        font-size: 14px;
        font-weight: 600;
        text-decoration: none;
    }

    .back-link:hover {
        color: #2859df;
    }

    /* Main Content */
    .main-section {
        flex: 1;
        width: 100%;
        padding: 40px 15px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    /* Product Card */
    .product-card {
        width: 100%;
        max-width: 760px;
        background-color: #ffffff;
        border-radius: 16px;
        overflow: hidden;
        box-shadow: 0 10px 35px rgba(28, 45, 85, 0.08);
    }

    /* Blue Header */
    .product-header {
        padding: 30px;
        color: #ffffff;
        background: linear-gradient(120deg, #2859df, #527df5);
    }

    .product-header h1 {
        font-size: clamp(24px, 4vw, 32px);
        font-weight: 700;
        margin-bottom: 8px;
    }

    .product-header p {
        margin-bottom: 0;
        color: #e8edff;
        font-size: 14px;
        line-height: 1.7;
    }

    .product-icon {
        width: 58px;
        height: 58px;
        flex-shrink: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        border-radius: 13px;
        background-color: rgba(255, 255, 255, 0.18);
        font-size: 30px;
    }

    /* Form Body */
    .product-body {
        padding: 32px;
    }

    .form-label {
        font-weight: 600;
        color: #263449;
        margin-bottom: 8px;
        font-size: 14px;
    }

    .form-control {
        min-height: 47px;
        border: 1px solid #dce2ec;
        border-radius: 9px;
        padding: 11px 13px;
        font-size: 14px;
    }

    .form-control:focus {
        border-color: #527df4;
        box-shadow: 0 0 0 3px rgba(82, 125, 244, 0.12);
    }

    .form-control[readonly] {
        background-color: #f5f7fb;
        color: #495057;
    }

    .input-group-text {
        background-color: #f5f7fb;
        border-color: #dce2ec;
        color: #495057;
    }

    /* Information Message */
    .info-message {
        background-color: #f5f8ff;
        border: 1px solid #e0e9ff;
        border-radius: 9px;
        padding: 14px;
        color: #52647b;
        font-size: 13px;
        line-height: 1.6;
    }

    /* Buy Button */
    .btn-buy {
        min-height: 49px;
        background-color: #2859df;
        border: 1px solid #2859df;
        border-radius: 9px;
        font-weight: 700;
        transition: 0.2s;
    }

    .btn-buy:hover {
        background-color: #204bc4;
        border-color: #204bc4;
    }

    .btn-buy:active {
        background-color: #193d9e !important;
        border-color: #193d9e !important;
        transform: scale(0.99);
    }

    /* Footer */
    .footer {
        padding: 20px;
        background-color: #ffffff;
        border-top: 1px solid #e5eaf2;
        text-align: center;
        color: #8996a9;
        font-size: 13px;
    }

    /* Mobile Responsive */
    @media (max-width: 576px) {
        .navbar {
            padding: 15px 0;
        }

        .brand {
            font-size: 23px;
        }

        .back-link {
            font-size: 12px;
        }

        .back-text {
            display: none;
        }

        .main-section {
            padding: 25px 12px;
            align-items: flex-start;
        }

        .product-header {
            padding: 23px 18px;
        }

        .product-body {
            padding: 23px 18px;
        }

        .product-icon {
            width: 48px;
            height: 48px;
            font-size: 24px;
        }
    }
</style>
</head>

<body>

<!-- Navigation -->
<nav class="navbar">
    <div class="container d-flex justify-content-between align-items-center">

        <a href="index.html" class="brand">
            <i class="bi bi-shop me-2"></i>ShopEase
        </a>

        <a href="viewProduct" class="back-link">
            <i class="bi bi-arrow-left me-1"></i>
            <span class="back-text">Back to Products</span>
        </a>

    </div>
</nav>

<!-- Product Details -->
<main class="main-section">

    <div class="product-card">

        <!-- Header -->
        <div class="product-header">

            <div class="d-flex align-items-center gap-3">

                <div class="product-icon">
                    <i class="bi bi-box-seam"></i>
                </div>

                <div>
                    <h1>Product Details</h1>
                    <p>Review the product and enter the quantity you need.</p>
                </div>

            </div>

        </div>

        <!-- Form -->
        <div class="product-body">

            <form action="updateProduct" method="post">

                <div class="row g-3">

                    <!-- Product Code -->
                    <div class="col-12 col-md-6">

                        <label for="pcode" class="form-label">
                            Product Code
                        </label>

                        <input type="text"
                               class="form-control"
                               id="pcode"
                               name="pcode"
                               value="<%= pb.getPcode() %>"
                               readonly>

                    </div>

                    <!-- Product Name -->
                    <div class="col-12 col-md-6">

                        <label for="pname" class="form-label">
                            Product Name
                        </label>

                        <input type="text"
                               class="form-control"
                               id="pname"
                               name="pname"
                               value="<%= pb.getPname() %>"
                               readonly>

                    </div>

                    <!-- Product Company -->
                    <div class="col-12 col-md-6">

                        <label for="pcompany" class="form-label">
                            Product Company
                        </label>

                        <input type="text"
                               class="form-control"
                               id="pcompany"
                               name="pcompany"
                               value="<%= pb.getPcompany() %>"
                               readonly>

                    </div>

                    <!-- Product Price -->
                    <div class="col-12 col-md-6">

                        <label for="pprice" class="form-label">
                            Product Price
                        </label>

                        <div class="input-group">

                            <span class="input-group-text">₹</span>

                            <input type="text"
                                   class="form-control"
                                   id="pprice"
                                   name="pprice"
                                   value="<%= pb.getPprice() %>"
                                   readonly>

                        </div>

                    </div>

                    <!-- Available Quantity -->
                    <div class="col-12 col-md-6">

                        <label for="pqnty" class="form-label">
                            Available Quantity
                        </label>

                        <input type="text"
                               class="form-control"
                               id="pqnty"
                               name="pqnty"
                               value="<%= pb.getPqty() %>"
                               readonly>

                    </div>

                    <!-- Required Quantity -->
                    <div class="col-12 col-md-6">

                        <label for="reqpqnty" class="form-label">
                            Required Quantity
                        </label>

                        <input type="number"
                               class="form-control"
                               id="reqpqnty"
                               name="reqpqnty"
                               placeholder="Enter quantity"
                               min="1"
                               step="1"
                               required>

                    </div>

                </div>

                <!-- Information -->
                <div class="info-message mt-4 mb-4">
                    <i class="bi bi-info-circle me-2 text-primary"></i>
                    Please check the product details before submitting your order.
                </div>

                <!-- Submit -->
                <button type="submit" class="btn btn-primary btn-buy w-100">
                    <i class="bi bi-cart-check me-2"></i>
                    Buy Now
                </button>

            </form>

        </div>

    </div>

</main>

<!-- Footer -->
<footer class="footer">
    &copy; <%= java.time.Year.now() %> ShopEase. All rights reserved.
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
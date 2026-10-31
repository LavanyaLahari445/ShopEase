<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>nCart - Customer Login</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>
body {
    background-color: #f5f7fb;
    font-family: Arial, sans-serif;
    margin: 0;
}

/* Navbar */
.navbar {
    background-color: #ffffff;
    padding: 18px 0;
    border-bottom: 1px solid #e5eaf2;
}

.brand {
    color: #2768ff;
    font-size: 30px;
    font-weight: bold;
    text-decoration: none;
}

.brand:hover {
    color: #1954dc;
}

/* Main Content */
.main-content {
    max-width: 1000px;
    width: 100%;
    margin: 45px auto;
    padding: 0 25px;
}

/* Page Heading */
.page-title {
    color: #17345f;
    font-size: 28px;
    font-weight: 700;
    margin-bottom: 25px;
}

/* Success Message */
.message {
    background-color: #eaf7ef;
    color: #267747;
    font-family: Arial, sans-serif;
    font-size: 15px;
    font-weight: 500;
    line-height: 1.6;
    padding: 16px 22px;
    border-left: 4px solid #28a745;
    border-radius: 6px;
    margin-bottom: 30px;
    overflow-wrap: anywhere;
}

/* Mobile Responsive */
@media (max-width: 576px) {
    .navbar {
        padding: 14px 0;
    }

    .brand {
        font-size: 25px;
    }

    .main-content {
        margin: 30px auto;
        padding: 0 18px;
    }

    .page-title {
        font-size: 23px;
        margin-bottom: 20px;
    }

    .message {
        font-size: 14px;
        padding: 13px 16px;
        margin-bottom: 22px;
    }
}
</style>

</head>

<body>

<!-- Navbar -->
<nav class="navbar">
    <div class="container">
        <a href="#" class="brand">nCart</a>
    </div>
</nav>

<!-- Main Content -->
<main class="main-content">

    <h2 class="page-title">Customer Login</h2>

    <%
        Object msg = request.getAttribute("msg");

        if (msg != null) {
    %>

    <div class="message">
        <%= msg %>
    </div>

    <%
        }
    %>

    <jsp:include page="CustomerLogin.html"/>

</main>

</body>
</html>
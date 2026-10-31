<%@page import="com.bean.ProductBean"%>
<%@page import="com.bean.AdminLoginBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ShopEase | Admin Home</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: "Segoe UI", Arial, sans-serif;
    background: #f4f7fc;
    color: #263238;
    min-height: 100vh;
}

/* Navigation */
.navbar {
    background: #ffffff;
    padding: 18px 5%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid #e5e7eb;
    box-shadow: 0 3px 12px rgba(0, 0, 0, 0.04);
}

.brand {
    font-size: 28px;
    font-weight: 800;
    color: #2563eb;
    letter-spacing: -0.7px;
}

.brand span {
    color: #172554;
}

.admin-label {
    color: #1d4ed8;
    font-size: 14px;
    font-weight: 600;
    background: #eff6ff;
    padding: 10px 16px;
    border-radius: 8px;
}

/* Main container */
.container {
    width: 92%;
    max-width: 1250px;
    margin: 42px auto;
}

/* Welcome banner */
.welcome-banner {
    background: linear-gradient(115deg, #2457df, #5079f5);
    color: #ffffff;
    border-radius: 18px;
    padding: 38px 35px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 20px;
    box-shadow: 0 12px 28px rgba(37, 87, 223, 0.16);
}

.welcome-title {
    font-size: clamp(26px, 3vw, 38px);
    font-weight: 750;
    margin-bottom: 10px;
    overflow-wrap: anywhere;
}

.welcome-message {
    color: #edf2ff;
    font-size: 15px;
    line-height: 1.6;
}

.profile-icon {
    width: 65px;
    height: 65px;
    flex-shrink: 0;
}

/* Dashboard heading */
.section-title {
    font-size: 30px;
    font-weight: 750;
    color: #1e293b;
    margin: 40px 0 22px;
}

/* Product cards */
.actions {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 25px;
}

.action-card {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    min-height: 255px;
    padding: 28px;
    background: #ffffff;
    border: 1px solid rgba(226, 232, 240, 0.5);
    border-radius: 17px;
    text-decoration: none;
    box-shadow: 0 12px 30px rgba(15, 23, 42, 0.07);
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.action-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 16px 35px rgba(15, 23, 42, 0.1);
}

.icon-box {
    width: 58px;
    height: 58px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 15px;
    margin-bottom: 19px;
}

.add-icon {
    background: #e8efff;
    color: #2563eb;
}

.view-icon {
    background: #e1f8ed;
    color: #059669;
}

.icon-box svg {
    width: 31px;
    height: 31px;
}

.action-card h3 {
    color: #172033;
    font-size: 20px;
    font-weight: 700;
    margin-bottom: 10px;
}

.action-card p {
    color: #718096;
    font-size: 15px;
    line-height: 1.7;
    margin-bottom: 23px;
}

.card-link {
    margin-top: auto;
    display: inline-flex;
    align-items: center;
    gap: 9px;
    color: #315ff4;
    font-size: 15px;
    font-weight: 600;
    transition: color 0.2s ease;
}

.action-card:hover .card-link {
    color: #173db5;
}

.arrow {
    font-size: 21px;
    transition: transform 0.2s ease;
}

.action-card:hover .arrow {
    transform: translateX(4px);
}

/* Logout */
.logout-area {
    margin-top: 30px;
    padding-top: 23px;
    border-top: 1px solid #e2e8f0;
    display: flex;
    justify-content: flex-end;
}

.logout-btn {
    display: inline-block;
    text-decoration: none;
    color: #dc2626;
    background: #ffffff;
    border: 2px solid #dc2626;
    border-radius: 9px;
    padding: 11px 27px;
    font-size: 14px;
    font-weight: 700;
    transition: background 0.2s ease, color 0.2s ease;
}

.logout-btn:hover {
    color: #ffffff;
    background: #dc2626;
    box-shadow: 0 5px 14px rgba(220, 38, 38, 0.18);
}

.logout-btn:active {
    background: #b91c1c;
    border-color: #b91c1c;
}

/* Footer */
.footer {
    text-align: center;
    padding: 15px 15px 22px;
    color: #94a3b8;
    font-size: 13px;
}

/* Responsive design */
@media (max-width: 700px) {
    .navbar {
        padding: 16px 5%;
    }

    .brand {
        font-size: 24px;
    }

    .admin-label {
        font-size: 12px;
        padding: 8px 10px;
    }

    .container {
        margin: 28px auto;
    }

    .welcome-banner {
        padding: 28px 23px;
        border-radius: 14px;
    }

    .profile-icon {
        width: 45px;
        height: 45px;
    }

    .section-title {
        font-size: 25px;
        margin-top: 32px;
    }

    .actions {
        grid-template-columns: 1fr;
        gap: 18px;
    }

    .action-card {
        min-height: 235px;
        padding: 24px;
    }
}

@media (max-width: 420px) {
    .welcome-banner {
        padding: 24px 18px;
    }

    .welcome-title {
        font-size: 25px;
    }

    .welcome-message {
        font-size: 14px;
    }

    .profile-icon {
        width: 36px;
        height: 36px;
    }

    .action-card h3 {
        font-size: 19px;
    }

    .logout-area {
        justify-content: stretch;
    }

    .logout-btn {
        width: 100%;
        text-align: center;
    }
}
</style>
</head>

<body>

<header class="navbar">
    <div class="brand">Shop<span>Ease</span></div>
    <div class="admin-label">Admin Dashboard</div>
</header>

<main class="container">

    <section class="welcome-banner">
        <div>
            <h1 class="welcome-title">
                <%
                AdminLoginBean ab=(AdminLoginBean)session.getAttribute("abean");
                String msg=(String)request.getAttribute("msg");
                out.println("Welcome "+ab.getFname()+"<br><br>");
                %>
            </h1>

            <div class="welcome-message">
                <%
                out.println(msg+"<br><br>");
                %>
            </div>
        </div>

        <svg class="profile-icon" viewBox="0 0 64 64"
             fill="none" xmlns="http://www.w3.org/2000/svg"
             aria-hidden="true">
            <rect x="5" y="7" width="54" height="38" rx="5"
                  stroke="white" stroke-width="4"/>
            <circle cx="32" cy="24" r="8" fill="white"/>
            <path d="M16 56C16 46 23 40 32 40C41 40 48 46 48 56"
                  fill="white"/>
        </svg>
    </section>

    <h2 class="section-title">Dashboard Overview</h2>

    <section class="actions">

        <a href="AddProduct.html" class="action-card">
            <div class="icon-box add-icon">
                <svg viewBox="0 0 32 32" fill="none"
                     xmlns="http://www.w3.org/2000/svg"
                     aria-hidden="true">
                    <rect x="4" y="4" width="24" height="24" rx="3"
                          stroke="currentColor" stroke-width="1.8"/>
                    <path d="M16 9V23M9 16H23"
                          stroke="currentColor" stroke-width="1.8"
                          stroke-linecap="round"/>
                </svg>
            </div>

            <h3>Add product</h3>
            <p>Add a new product to your store.</p>

            <span class="card-link">
                Add a Product <span class="arrow">&rarr;</span>
            </span>
        </a>

        <a href="viewl" class="action-card">
            <div class="icon-box view-icon">
                <svg viewBox="0 0 32 32" fill="none"
                     xmlns="http://www.w3.org/2000/svg"
                     aria-hidden="true">
                    <path d="M16 3L28 8V24L16 29L4 24V8L16 3Z"
                          stroke="currentColor" stroke-width="1.7"
                          stroke-linejoin="round"/>
                    <path d="M4 8L16 13L28 8M16 13V29M10 5.5L22 10.5"
                          stroke="currentColor" stroke-width="1.7"
                          stroke-linejoin="round"/>
                </svg>
            </div>

            <h3>View product</h3>
            <p>View and manage your existing products.</p>

            <span class="card-link">
                View Products <span class="arrow">&rarr;</span>
            </span>
        </a>

    </section>

    <div class="logout-area">
        <a href="logout" class="logout-btn">Logout</a>
    </div>

</main>

<footer class="footer">
    &copy; ShopEase. All rights reserved.
</footer>

</body>
</html>
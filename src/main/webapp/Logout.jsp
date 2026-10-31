<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout | ShopEase</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #eff6ff, #e0e7ff);
        }

        .logout-card {
            width: 100%;
            max-width: 440px;
            padding: 40px 30px;
            text-align: center;
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 20px;
            box-shadow: 0 15px 45px rgba(30, 64, 175, 0.12);
        }

        .success-icon {
            width: 78px;
            height: 78px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 22px;
            border-radius: 50%;
            background: #dcfce7;
            color: #16a34a;
            font-size: 40px;
        }

        .brand {
            margin-bottom: 25px;
            color: #172554;
            font-size: 25px;
            font-weight: 800;
        }

        .brand i,
        .brand span {
            color: #2563eb;
        }

        h2 {
            margin-bottom: 12px;
            color: #172554;
            font-size: 26px;
            font-weight: 700;
        }

        .message {
            margin-bottom: 28px;
            color: #64748b;
            font-size: 15px;
            line-height: 1.8;
            overflow-wrap: anywhere;
        }

        .home-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            width: 100%;
            min-height: 50px;
            padding: 13px 18px;
            border-radius: 10px;
            background: #2563eb;
            color: #ffffff;
            font-size: 15px;
            font-weight: 700;
            text-decoration: none;
            transition: background 0.2s, transform 0.2s;
        }

        .home-btn:hover {
            background: #1d4ed8;
            color: #ffffff;
            transform: translateY(-2px);
        }

        .footer-text {
            margin-top: 25px;
            margin-bottom: 0;
            color: #94a3b8;
            font-size: 12px;
        }

        @media (max-width: 480px) {
            body {
                padding: 16px;
            }

            .logout-card {
                padding: 32px 22px;
                border-radius: 16px;
            }

            .brand {
                font-size: 23px;
            }

            h2 {
                font-size: 23px;
            }

            .message {
                font-size: 14px;
            }
        }
    </style>
</head>

<body>

    <div class="logout-card">

        <div class="brand">
            <i class="bi bi-bag-check-fill"></i>
            Shop<span>Ease</span>
        </div>

        <div class="success-icon">
            <i class="bi bi-check-lg"></i>
        </div>

        <h2>Logged Out</h2>

        <div class="message">
            <%
                String data = (String) request.getAttribute("msg");
                session.invalidate();

                if (data != null && !data.trim().isEmpty()) {
                    out.print(data);
                } else {
                    out.print("You have been logged out successfully.");
                }
            %>
        </div>

        <a href="index.html" class="home-btn">
            <i class="bi bi-house-door-fill"></i>
            Back to Home
        </a>

        <p class="footer-text">
            &copy; 2026 ShopEase. All Rights Reserved.
        </p>

    </div>

</body>
</html>
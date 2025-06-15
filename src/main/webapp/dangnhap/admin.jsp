<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Admin Dashboard</title>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <style>
            body {
                margin: 0;
                font-family: 'Roboto', sans-serif;
                background-color: #f5f5dc;
            }
            .container {
                display: flex;
            }
            .sidebar {
                width: 250px;
                background: linear-gradient(to right, #fbeec1, #f5f5dc);
                padding: 20px;
                min-height: 100vh;
                box-shadow: 2px 0 5px rgba(0,0,0,0.1);
            }
            .welcome {
                color: #333;
                margin-bottom: 20px;
            }
            .logo {
                text-align: center;
                margin-bottom: 20px;
            }
            .logo img {
                width: 100px;
                height: auto;
            }
            .menu {
                list-style: none;
                padding: 0;
            }
            .menu li {
                padding: 15px;
                margin: 10px 0;
                background: white;
                border-radius: 10px;
                color: #333;
                cursor: pointer;
                font-weight: 500;
                transition: all 0.3s ease;
            }
            .menu li:hover {
                background: #e0ffe3;
            }
            .menu i {
                margin-right: 10px;
            }
            .main {
                flex-grow: 1;
                padding: 30px;
            }
            .logout {
                margin-top: 20px;
                text-align: center;
            }
            .logout a {
                color: #0066cc;
                text-decoration: none;
                font-weight: 500;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <aside class="sidebar">
                <div class="welcome">
                    <% if (session.getAttribute("username") != null) {%>
                    <p>Xin chào, <%= session.getAttribute("username")%>!</p>
                    <% } else { %>
                    <p>Bạn chưa đăng nhập!</p>
                    <% }%>
                </div>
                <div class="logo">
                    <a href="<%= request.getContextPath()%>/home"><img src="<%= request.getContextPath()%>/homepage/img/eco.png" alt="EcoMart Logo"></a>
                </div>
                <ul class="menu">
                    <li><i class="fas fa-tachometer-alt"></i> Main dashboard</li>
                    <li><i class="fas fa-chart-line"></i> Revenue by month</li>
                    <li><i class="fas fa-chart-bar"></i> Revenue by year</li>
                    <li><i class="fas fa-receipt"></i> Order</li>
                    <li>
                        <a href="Product" style="color: #333; text-decoration: none">
                            <i class="fas fa-box"></i> Product
                        </a>
                    </li>
                    <li><i class="fas fa-user"></i> Account</li>
                    <li><i class="fas fa-parachute-box"></i> Supplier</li>
                    <li><i class="fas fa-shoe-prints"></i> Top 10 product</li>
                    <li><i class="fas fa-users"></i> Top 5 customer</li>
                </ul>
                <div class="logout">
                    <a href="<%= request.getContextPath()%>/logout">Dang Xuat</a>
                </div>
            </aside>dsfdsgdsgas
            <main class="main">
                <h2>Admin Dashboard</h2>
                <p>Chào mừng đến với bảng điều khiển quản trị!</p>
            </main>
        </div>
    </body>dgdgdsgsdgs
</html>
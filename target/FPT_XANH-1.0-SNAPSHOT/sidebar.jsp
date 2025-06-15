<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="assets/css/sidebar.css"/>
<aside class="sidebar">
    <div class="logo">
        <a href="home">
            <img src="assets/img/eco.png" alt="Logo">
        </a>
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
</aside>

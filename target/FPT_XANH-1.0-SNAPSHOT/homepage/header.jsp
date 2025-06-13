<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>EcoMart</title>
        <link rel="shortcut icon" href="homepage/img/eco.png" type="image/x-icon">
        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
        <!-- Google Font -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <link rel="stylesheet" href="./homepage/css/main.css?version=<%= System.currentTimeMillis() %>"/>
    </head>
    <body>

        <!-- Sidebar -->
        <div class="sidebar">
            <h2><i class="fas fa-list-ul"></i> Danh mục sản phẩm</h2>
            <div class="category">
                <button onclick="toggleCategory(this)">🍹 Nước giải khát <i class="fa fa-chevron-down"></i></button>
                <div class="category-content">
                    <a href="#">Nước ngọt</a>
                    <a href="#">Nước suối</a>
                </div>
            </div>
            
            <div class="category">
                <button onclick="toggleCategory(this)">🧃 Sữa các loại <i class="fa fa-chevron-down"></i></button>
                <div class="category-content">
                    <a href="#">Kẹo ngậm</a>
                    <a href="#">Bánh quy</a>
                </div>
            </div>

            <div class="category">
                <button onclick="toggleCategory(this)">🍎 Trái cây các loại <i class="fa fa-chevron-down"></i></button>
                <div class="category-content">
                    <a href="#">Xoài</a>
                    <a href="#">Chuối</a>
                </div>
            </div>

            <div class="category">
                <button onclick="toggleCategory(this)">🍬 Bánh kẹo các loại <i class="fa fa-chevron-down"></i></button>
                <div class="category-content">
                    <a href="#">Kẹo ngậm</a>
                    <a href="#">Bánh quy</a>
                </div>
            </div>

            <div class="category">
                <button onclick="toggleCategory(this)">🍼 Mẹ và bé <i class="fa fa-chevron-down"></i></button>
                <div class="category-content">
                    <a href="#">Sữa bột</a>
                    <a href="#">Tã em bé</a>
                </div>
            </div>

            <div class="category">
                <button onclick="toggleCategory(this)">💄 Mỹ phẩm <i class="fa fa-chevron-down"></i></button>
                <div class="category-content">
                    <a href="#">Kem dưỡng</a>
                    <a href="#">Sữa rửa mặt</a>
                </div>
            </div>
        </div>

        <!-- Header -->
        <div class="header">
            <div class="logo">
                <img src="homepage/img/eco.png" alt="Logo">
                <span>EcoMart</span>
            </div>

            <div class="search-bar">
                <i class="fas fa-search"></i>
                <input type="text" placeholder="Tìm kiếm sản phẩm...">
            </div>
        
       <div class="header-icons">
            <% String username = (String) session.getAttribute("username"); %>
            <% if (username != null) { %>
                <span>Chào, <%= username %></span>
                <a href="<%= request.getContextPath() %>/logout">Đăng xuất</a>
            <% } else { %>
                <a href="<%= request.getContextPath() %>/login">Đăng nhập</a>
                <a href="<%= request.getContextPath() %>/register">Đăng ký</a>
                <a href="<%= request.getContextPath() %>/cart">Giỏ hàng</a>
            <% } %>
        </div>
            
        </div>

        <!-- JS -->
        <script>
            function toggleCategory(button) {
                const content = button.nextElementSibling;
                content.style.display = content.style.display === "block" ? "none" : "block";
            }
        </script>

    </body>
</html>
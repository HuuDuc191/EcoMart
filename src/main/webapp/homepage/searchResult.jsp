<%@ page import="java.util.*, model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Kết quả tìm kiếm</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Font Awesome + Bootstrap or your custom CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
  <link href="https://fonts.googleapis.com/css2?family=Nunito&display=swap" rel="stylesheet">
  <style>
    /* (Toàn bộ CSS header + sidebar giống mình đã gửi ở trên...) */
  </style>
</head>

<body>

<!-- Header -->
<header>... (giống phần header ở trên) ...</header>

<div class="layout">
  <!-- Sidebar -->
  <aside>... (giữ nguyên như trên) ...</aside>

  <!-- Main content -->
  <main>
    <h2 class="section-title">🔍 Kết quả tìm kiếm: "<%= request.getAttribute("keyword") %>"</h2>

<%
    List<Product> list = (List<Product>) request.getAttribute("results");
    String sort = (String) request.getAttribute("sort");
    if (list == null || list.isEmpty()) {
%>
    <p class="text-muted fst-italic">⚠ Không tìm thấy sản phẩm nào phù hợp.</p>
<%
    } else {
%>

    <!-- Dropdown sắp xếp -->
    <div class="d-flex justify-content-end align-items-center mb-3">
        <form method="get" action="search" class="d-flex align-items-center">
            <input type="hidden" name="keyword" value="<%= request.getAttribute("keyword") %>" />
            <label class="me-2"><strong>Sắp xếp theo giá:</strong></label>
            <select class="form-select w-auto" name="sort" onchange="this.form.submit()">
                <option value="">-- Mặc định --</option>
                <option value="asc" <%= "asc".equals(sort) ? "selected" : "" %>>Tăng dần</option>
                <option value="desc" <%= "desc".equals(sort) ? "selected" : "" %>>Giảm dần</option>
            </select>
        </form>
    </div>

    <!-- Product Grid -->
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
<%
        for (Product p : list) {
%>
        <div class="col">
            <div class="card h-100 shadow-sm">
                <div class="position-relative">
                    <img src="homepage/img/<%= p.getImage() %>" class="card-img-top" alt="<%= p.getName() %>">
                    <div class="position-absolute top-0 end-0 m-2 d-flex flex-column gap-2 opacity-0 hover-opacity">
                        <button class="btn btn-light btn-sm rounded-circle"><i class="fas fa-cart-plus"></i></button>
                        <button class="btn btn-light btn-sm rounded-circle"><i class="fas fa-eye"></i></button>
                    </div>
                </div>
                <div class="card-body text-center">
                    <h5 class="card-title"><%= p.getName() %></h5>
                    <div class="text-warning mb-2">
                        <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i><i class="far fa-star"></i>
                        <span class="text-muted">(20)</span>
                    </div>
                    <p class="card-text fw-bold text-danger mb-1"><%= String.format("%,.0f", p.getPrice()) %>đ</p>
                    <small class="text-muted">/ <%= p.getUnit() %></small>
                    <div class="d-grid gap-2 mt-3">
                        <button class="btn btn-outline-secondary"><i class="fas fa-shopping-cart me-1"></i> Giỏ hàng</button>
                        <button class="btn btn-success">Mua ngay</button>
                    </div>
                </div>
            </div>
        </div>
<%
        }
%>
    </div>
<%
    }
%>

  </main>
</div>

</body>
</html>

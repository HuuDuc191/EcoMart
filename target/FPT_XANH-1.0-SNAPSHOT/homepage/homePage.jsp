<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="dao.viewProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
//    List<Product> featuredProducts = (List<Product>) request.getAttribute("featuredProducts");
    viewProductDAO dao = new viewProductDAO();
    List<Product> featuredProducts = dao.getFeaturedProducts();
    List<Product> drinkProducts = dao.getDrinkProducts();
    List<Product> FruitProducts = dao.getFruitProducts();
    List<Product> CandyProducts = dao.getCandyProducts();
    List<Product> CosmeticProducts = dao.getCosmeticProducts();
    List<Product> MilkProducts = dao.getMilkProducts();
    List<Product> MotherBabyProducts = dao.getMotherBabyProducts();
%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>EcoMart - Cửa hàng mua sắm trực tuyến</title>
        <link rel="shortcut icon" href="homepage/img/eco.png" type="image/x-icon">
        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <!-- Main CSS -->
        <link rel="stylesheet" href="./homepage/css/main.css?version=<%= System.currentTimeMillis()%>"/>
        <!-- Home CSS -->
        <link rel="stylesheet" href="./homepage/css/home.css?version=<%= System.currentTimeMillis()%>">
        <script defer src="./homepage/js/homeJs.js"></script>
        <!-- Animate on scroll -->
        <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
        <link rel="stylesheet" href="./css/home.css">
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <!-- Main content -->
        <div class="main-content">
            <!-- Hero Banner Section -->
            <section class="hero-section">
                <div class="slideshow-container">
                    <!-- Full-width images with number and caption text -->
                    <div class="mySlides fade">
                        <div class="numbertext">1 / 4</div>
                        <a href="#"><img src="https://cdnv2.tgdd.vn/bhx-static/bhx/7910/tc-moi-1800480_202502081609261675.jpg" alt="Banner 1"></a>
                    </div>
                    <div class="mySlides fade">
                        <div class="numbertext">2 / 4</div>
                        <a href="#"><img src="https://cdnv2.tgdd.vn/bhx-static/bhx/7910/freecompress-pc-1800x480-2_202505071644493334.jpg" alt="Banner 2"></a>
                    </div>
                    <div class="mySlides fade">
                        <div class="numbertext">3 / 4</div>
                        <a href="#"><img src="https://cdnv2.tgdd.vn/bhx-static/bhx/7910/freecompress-1800x480_202502190847402842.jpg" alt="Banner 3"></a>
                    </div>
                    <div class="mySlides fade">
                        <div class="numbertext">4 / 4</div>
                        <a href="#"><img src="https://cdnv2.tgdd.vn/bhx-static/bhx/7910/freecompress-pc-1800x480-2_202503061602312848.jpg" alt="Banner 4"></a>
                    </div>
                    <!-- Next and previous buttons -->
                    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                    <a class="next" onclick="plusSlides(1)">&#10095;</a>
                </div>

                <!-- The dots/circles -->
                <div class="dots-container">
                    <span class="dot" onclick="currentSlide(1)"></span>
                    <span class="dot" onclick="currentSlide(2)"></span>
                    <span class="dot" onclick="currentSlide(3)"></span>
                    <span class="dot" onclick="currentSlide(4)"></span>
                </div>
            </section>

            <!-- Category Navigation -->
            <section class="category-section" data-aos="fade-up">
                <div class="category-wrapper">
                    <div class="category-item">
                        <a href="#">
                            <div class="category-icon">
                                <img src="https://cdn.tgdd.vn/bachhoaxanh/www/Content/images/icon-history.v202301091407.png" alt="Mua lại đơn cũ">
                            </div>
                            <p>Mua lại đơn cũ</p>
                        </a>
                    </div>
                    <div class="category-item">
                        <a href="#">
                            <div class="category-icon">
                                <img src="assets/img/cocacola330ml.jpg" alt="Nước giải khát">
                            </div>
                            <p>Nước giải khát</p>
                        </a>
                    </div>
                    <div class="category-item">
                        <a href="#">
                            <div class="category-icon">
                                <img src="assets/img/traicay.webp" alt="Trái cây">
                            </div>
                            <p>Trái cây</p>
                        </a>
                    </div>
                    <div class="category-item">
                        <a href="#">
                            <div class="category-icon">
                                <img src="assets/img/banhkeo.jpg" alt="Bánh kẹo">
                            </div>
                            <p>Bánh kẹo</p>
                        </a>
                    </div>
                    <div class="category-item">
                        <a href="#">
                            <div class="category-icon">
                                <img src="assets/img/sua.jpg" alt="Sữa các loại">
                            </div>
                            <p>Sửa các loại</p>
                        </a>
                    </div>
                    <div class="category-item">
                        <a href="#">
                            <div class="category-icon">
                                <img src="assets/img/me&be.jpg" alt="Mẹ và bé">
                            </div>
                            <p>Mẹ và bé</p>
                        </a>
                    </div>
                    <div class="category-item">
                        <a href="#">
                            <div class="category-icon">
                                <img src="assets/img/mypham.jpg" alt="Mỹ phẩm">
                            </div>
                            <p>Mỹ phẩm</p>
                        </a>
                    </div>
                </div>
            </section>

            <!-- Hot Products Section -->
            <section class="product-section" data-aos="fade-up">
                <div class="section-header">
                    <div class="section-title">
                        <i class="fas fa-fire"></i> Sản phẩm nổi bật
                    </div>
                    <a href="#" class="view-all">Xem tất cả <i class="fas fa-chevron-right"></i></a>
                </div>
                <div class="product-grid">
                    <%
                        if (featuredProducts != null && !featuredProducts.isEmpty()) {
                            for (Product p : featuredProducts) {
                    %>
                    <div class="product-card">
                        <div class="product-badge">Hot</div>
                        <div class="product-image-container">
                            <img src="ImageServlet?name=<%= p.getImage()%>" alt="<%= p.getProductName()%>" class="product-image">
                            <div class="product-actions">
                                <button class="action-btn"><i class="fas fa-cart-plus"></i></button>
                                <a href="<%= request.getContextPath()%>/ProductDetail?id=<%= p.getProductID()%>">
                                    <i class="fas fa-eye"></i>
                                </a>
                            </div>
                        </div>
                        <div class="product-info">
                            <h3 class="product-name"><%= p.getProductName()%></h3>
                            <div class="product-rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                                <span>(29)</span>
                            </div>
                            <div class="product-price"><%= new java.text.DecimalFormat("#,###").format(p.getPrice())%> VNĐ / <%= p.getUnit()%></div>
                            <div class="button-group">
                                <button class="add-to-cart-btn"><i class="fas fa-shopping-cart"></i> Giỏ hàng</button>
                                <button class="buy-now-btn">Mua ngay</button>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <p class="no-featured-products">Không có sản phẩm nổi bật nào để hiển thị.</p>
                    <%
                        }
                    %>
                </div>
                <a href="#" class="see-more-btn">Xem thêm sản phẩm <i class="fas fa-arrow-right"></i></a>
            </section>


            <!--mở đầu-->

            <section class="banner-section" data-aos="fade-up">
                <img src="./homepage/img/freecompress-hero-banner-pc_202504181036599398.jpg" alt="Banner" class="full-width-banner">
            </section>

            <section class="product-section" data-aos="fade-up">
                <div class="section-header">
                    <div class="section-title">
                        <i class="fas fa-glass-cheers"></i> Nước giải khát
                    </div>

                    <a href="#" class="view-all">Xem tất cả <i class="fas fa-chevron-right"></i></a>
                </div>
                <div class="product-grid">
                    <%
                        if (drinkProducts != null && !drinkProducts.isEmpty()) {
                            for (Product p : drinkProducts) {
                    %>
                    <div class="product-card">
                        <!--<div class="product-badge">Hot</div>-->
                        <div class="product-image-container">
                            <img src="ImageServlet?name=<%= p.getImage()%>" alt="<%= p.getProductName()%>" class="product-image">
                            <div class="product-actions">
                                <button class="action-btn"><i class="fas fa-cart-plus"></i></button>
                                <a href="<%= request.getContextPath()%>/ProductDetail?id=<%= p.getProductID()%>">
                                    <i class="fas fa-eye"></i>
                                </a>
                            </div>
                        </div>
                        <div class="product-info">
                            <h3 class="product-name"><%= p.getProductName()%></h3>
                            <div class="product-rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                                <span>(29)</span>
                            </div>
                            <div class="product-price"><%= new java.text.DecimalFormat("#,###").format(p.getPrice())%> VNĐ / <%= p.getUnit()%></div>
                            <div class="button-group">
                                <button class="add-to-cart-btn"><i class="fas fa-shopping-cart"></i> Giỏ hàng</button>
                                <button class="buy-now-btn">Mua ngay</button>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <p class="no-featured-products">Không có sản phẩm nổi bật nào để hiển thị.</p>
                    <%
                        }
                    %>
                </div>
                <a href="#" class="see-more-btn">Xem thêm sản phẩm <i class="fas fa-arrow-right"></i></a>
            </section>

            <!--kết thúc-->

            <!--mở đầu-->

            <section class="banner-section" data-aos="fade-up">
                <img src="./homepage/img/freecompress-hero-banner-pc_202504181036599398.jpg" alt="Banner" class="full-width-banner">
            </section>

            <section class="product-section" data-aos="fade-up">
                <div class="section-header">
                    <div class="section-title">
                        <i class="fas fa-apple-alt"></i> Sữa
                    </div>
                    <a href="#" class="view-all">Xem tất cả <i class="fas fa-chevron-right"></i></a>
                </div>
                <div class="product-grid">
                    <%
                        if (MilkProducts != null && !MilkProducts.isEmpty()) {
                            for (Product p : MilkProducts) {
                    %>
                    <div class="product-card">
                        <!--<div class="product-badge">Hot</div>-->
                        <div class="product-image-container">
                            <img src="ImageServlet?name=<%= p.getImage()%>" alt="<%= p.getProductName()%>" class="product-image">
                            <div class="product-actions">
                                <button class="action-btn"><i class="fas fa-cart-plus"></i></button>
                                <a href="<%= request.getContextPath()%>/ProductDetail?id=<%= p.getProductID()%>">
                                    <i class="fas fa-eye"></i>
                                </a>
                            </div>
                        </div>
                        <div class="product-info">
                            <h3 class="product-name"><%= p.getProductName()%></h3>
                            <div class="product-rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                                <span>(29)</span>
                            </div>
                            <div class="product-price"><%= new java.text.DecimalFormat("#,###").format(p.getPrice())%> VNĐ / <%= p.getUnit()%></div>
                            <div class="button-group">
                                <button class="add-to-cart-btn"><i class="fas fa-shopping-cart"></i> Giỏ hàng</button>
                                <button class="buy-now-btn">Mua ngay</button>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <p class="no-featured-products">Không có sản phẩm nổi bật nào để hiển thị.</p>
                    <%
                        }
                    %>
                </div>
                <a href="#" class="see-more-btn">Xem thêm sản phẩm <i class="fas fa-arrow-right"></i></a>
            </section>

            <!--kết thúc--> 

            <!--mở đầu-->

            <section class="banner-section" data-aos="fade-up">
                <img src="./homepage/img/freecompress-hero-banner-pc_202504181036599398.jpg" alt="Banner" class="full-width-banner">
            </section>

            <section class="product-section" data-aos="fade-up">
                <div class="section-header">
                    <div class="section-title">
                        <i class="fas fa-apple-alt"></i> Trái cây
                    </div>
                    <a href="#" class="view-all">Xem tất cả <i class="fas fa-chevron-right"></i></a>
                </div>
                <div class="product-grid">
                    <%
                        if (FruitProducts != null && !FruitProducts.isEmpty()) {
                            for (Product p : FruitProducts) {
                    %>
                    <div class="product-card">
                        <!--<div class="product-badge">Hot</div>-->
                        <div class="product-image-container">
                            <img src="ImageServlet?name=<%= p.getImage()%>" alt="<%= p.getProductName()%>" class="product-image">
                            <div class="product-actions">
                                <button class="action-btn"><i class="fas fa-cart-plus"></i></button>
                                <a href="<%= request.getContextPath()%>/ProductDetail?id=<%= p.getProductID()%>">
                                    <i class="fas fa-eye"></i>
                                </a><button class="action-btn"><i class="fas fa-eye"></i></button>
                            </div>
                        </div><
                        <div class="product-info">
                            <h3 class="product-name"><%= p.getProductName()%></h3>
                            <div class="product-rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                                <span>(29)</span>
                            </div>
                            <div class="product-price"><%= new java.text.DecimalFormat("#,###").format(p.getPrice())%> VNĐ / <%= p.getUnit()%></div>
                            <div class="button-group">
                                <button class="add-to-cart-btn"><i class="fas fa-shopping-cart"></i> Giỏ hàng</button>
                                <button class="buy-now-btn">Mua ngay</button>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <p class="no-featured-products">Không có sản phẩm nổi bật nào để hiển thị.</p>
                    <%
                        }
                    %>
                </div>
                <a href="#" class="see-more-btn">Xem thêm sản phẩm <i class="fas fa-arrow-right"></i></a>
            </section>

            <!--kết thúc--> 

            <!--mở đầu-->

            <section class="banner-section" data-aos="fade-up">
                <img src="./homepage/img/freecompress-hero-banner-pc_202504181036599398.jpg" alt="Banner" class="full-width-banner">
            </section>

            <section class="product-section" data-aos="fade-up">
                <div class="section-header">
                    <div class="section-title">
                        <i class="fas fa-apple-alt"></i> Bánh Kẹo
                    </div>
                    <a href="#" class="view-all">Xem tất cả <i class="fas fa-chevron-right"></i></a>
                </div>
                <div class="product-grid">
                    <%
                        if (CandyProducts != null && !CandyProducts.isEmpty()) {
                            for (Product p : CandyProducts) {
                    %>
                    <div class="product-card">
                        <!--<div class="product-badge">Hot</div>-->
                        <div class="product-image-container">
                            <img src="ImageServlet?name=<%= p.getImage()%>" alt="<%= p.getProductName()%>" class="product-image">
                            <div class="product-actions">
                                <button class="action-btn"><i class="fas fa-cart-plus"></i></button>
                                <a href="<%= request.getContextPath()%>/ProductDetail?id=<%= p.getProductID()%>">
                                    <i class="fas fa-eye"></i>
                                </a>
                            </div>
                        </div>
                        <div class="product-info">
                            <h3 class="product-name"><%= p.getProductName()%></h3>
                            <div class="product-rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                                <span>(29)</span>
                            </div>
                            <div class="product-price"><%= new java.text.DecimalFormat("#,###").format(p.getPrice())%> VNĐ / <%= p.getUnit()%></div>
                            <div class="button-group">
                                <button class="add-to-cart-btn"><i class="fas fa-shopping-cart"></i> Giỏ hàng</button>
                                <button class="buy-now-btn">Mua ngay</button>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <p class="no-featured-products">Không có sản phẩm nổi bật nào để hiển thị.</p>
                    <%
                        }
                    %>
                </div>
                <a href="#" class="see-more-btn">Xem thêm sản phẩm <i class="fas fa-arrow-right"></i></a>
            </section>

            <!--kết thúc--> 




            <!--mở đầu-->

            <section class="banner-section" data-aos="fade-up">
                <img src="./homepage/img/freecompress-hero-banner-pc_202504181036599398.jpg" alt="Banner" class="full-width-banner">
            </section>

            <section class="product-section" data-aos="fade-up">
                <div class="section-header">
                    <div class="section-title">
                        <i class="fas fa-apple-alt"></i> Mẹ Và Bé
                    </div>
                    <a href="#" class="view-all">Xem tất cả <i class="fas fa-chevron-right"></i></a>
                </div>
                <div class="product-grid">
                    <%
                        if (MotherBabyProducts != null && !MotherBabyProducts.isEmpty()) {
                            for (Product p : MotherBabyProducts) {
                    %>
                    <div class="product-card">
                        <!--<div class="product-badge">Hot</div>-->
                        <div class="product-image-container">
                            <img src="ImageServlet?name=<%= p.getImage()%>" alt="<%= p.getProductName()%>" class="product-image">
                            <div class="product-actions">
                                <button class="action-btn"><i class="fas fa-cart-plus"></i></button>
                                <a href="<%= request.getContextPath()%>/ProductDetail?id=<%= p.getProductID()%>">
                                    <i class="fas fa-eye"></i>
                                </a>
                            </div>
                        </div>
                        <div class="product-info">
                            <h3 class="product-name"><%= p.getProductName()%></h3>
                            <div class="product-rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                                <span>(29)</span>
                            </div>
                            <div class="product-price"><%= new java.text.DecimalFormat("#,###").format(p.getPrice())%> VNĐ / <%= p.getUnit()%></div>
                            <div class="button-group">
                                <button class="add-to-cart-btn"><i class="fas fa-shopping-cart"></i> Giỏ hàng</button>
                                <button class="buy-now-btn">Mua ngay</button>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <p class="no-featured-products">Không có sản phẩm nổi bật nào để hiển thị.</p>
                    <%
                        }
                    %>
                </div>
                <a href="#" class="see-more-btn">Xem thêm sản phẩm <i class="fas fa-arrow-right"></i></a>
            </section>

            <!--kết thúc--> 

            <!--mở đầu-->

            <section class="banner-section" data-aos="fade-up">
                <img src="./homepage/img/freecompress-hero-banner-pc_202504181036599398.jpg" alt="Banner" class="full-width-banner">
            </section>

            <section class="product-section" data-aos="fade-up">
                <div class="section-header">
                    <div class="section-title">
                        <i class="fas fa-apple-alt"></i> Mỹ Phẩm
                    </div>
                    <a href="#" class="view-all">Xem tất cả <i class="fas fa-chevron-right"></i></a>
                </div>
                <div class="product-grid">
                    <%
                        if (CosmeticProducts != null && !CosmeticProducts.isEmpty()) {
                            for (Product p : CosmeticProducts) {
                    %>
                    <div class="product-card">
                        <!--<div class="product-badge">Hot</div>-->
                        <div class="product-image-container">
                            <img src="ImageServlet?name=<%= p.getImage()%>" alt="<%= p.getProductName()%>" class="product-image">
                            <div class="product-actions">
                                <button class="action-btn"><i class="fas fa-cart-plus"></i></button>
                                <a href="<%= request.getContextPath()%>/ProductDetail?id=<%= p.getProductID()%>">
                                    <i class="fas fa-eye"></i>
                                </a>button class="action-btn"><i class="fas fa-eye"></i></button>
                            </div>
                        </div>
                        <div class="product-info">
                            <h3 class="product-name"><%= p.getProductName()%></h3>
                            <div class="product-rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                                <span>(29)</span>
                            </div>
                            <div class="product-price"><%= new java.text.DecimalFormat("#,###").format(p.getPrice())%> VNĐ / <%= p.getUnit()%></div>
                            <div class="button-group">
                                <button class="add-to-cart-btn"><i class="fas fa-shopping-cart"></i> Giỏ hàng</button>
                                <button class="buy-now-btn">Mua ngay</button>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <p class="no-featured-products">Không có sản phẩm nổi bật nào để hiển thị.</p>
                    <%
                        }
                    %>
                </div>
                <a href="#" class="see-more-btn">Xem thêm sản phẩm <i class="fas fa-arrow-right"></i></a>
            </section>

            <!--kết thúc--> 


            <!-- Tips Section -->
            <section class="tips-section" data-aos="fade-up">
                <div class="section-header">
                    <div class="section-title">
                        <i class="fas fa-lightbulb"></i> Mẹo vặt hữu ích
                    </div>
                    <a href="meo-vat.html" class="view-all">Xem tất cả <i class="fas fa-chevron-right"></i></a>
                </div>

                <div class="tips-container">
                    <div class="tips-video">
                        <iframe width="560" height="315" src="https://www.youtube.com/embed/jN58QsGK4WI?si=2bBTyZJ0KCMstDbu"
                                title="YouTube video player" frameborder="0"
                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                                referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                    </div>

                    <div class="tips-list">
                        <a href="meo-vat.html#lam-sach-rau-cu" class="tip-item">
                            <div class="tip-image">
                                <img src="https://th.bing.com/th/id/OIP.z6N7VnK2aWx6YlRmR-gpCwHaEK?w=200&h=112&rs=1&qlt=80&o=6&dpr=1.3&pid=3.1" alt="Làm sạch rau củ">
                            </div>
                            <div class="tip-content">
                                <h3 class="tip-title">Cách làm sạch rau củ nhanh chóng</h3>
                                <p class="tip-desc">Học cách rửa rau củ đúng cách để loại bỏ bụi bẩn và hóa chất.</p>
                            </div>
                        </a>

                        <a href="meo-vat.html#bao-quan-thit-ca" class="tip-item">
                            <div class="tip-image">
                                <img src="https://th.bing.com/th/id/OIP.quVOFTDt4CAdc7VhwyocagHaEo?w=295&h=184&c=7&r=0&o=7&cb=iwp2&dpr=1.3&pid=1.7&rm=3" alt="Bảo quản thịt cá">
                            </div>
                            <div class="tip-content">
                                <h3 class="tip-title">Bí quyết bảo quản thịt cá tươi lâu</h3>
                                <p class="tip-desc">Mẹo giữ thịt cá tươi ngon trong tủ lạnh hoặc tủ đông.</p>
                            </div>
                        </a>

                        <a href="meo-vat.html#chong-lang-phi-thuc-pham" class="tip-item">
                            <div class="tip-image">
                                <img src="https://th.bing.com/th/id/OIP.-2dh96wDCZIaPp8k1q3b7gHaE8?w=269&h=180&c=7&r=0&o=7&cb=iwp2&dpr=1.3&pid=1.7&rm=3" alt="Chống lãng phí">
                            </div>
                            <div class="tip-content">
                                <h3 class="tip-title">Mẹo chống lãng phí thực phẩm</h3>
                                <p class="tip-desc">Cách tận dụng thức ăn thừa để tiết kiệm và bảo vệ môi trường.</p>
                            </div>
                        </a>

                        <a href="meo-vat.html#lam-nuoc-uong-tai-nha" class="tip-item">
                            <div class="tip-image">
                                <img src="https://th.bing.com/th/id/OIP.qtsxKJLVM8WZX27VbcEp3AHaE8?w=242&h=180&c=7&r=0&o=7&cb=iwp2&dpr=1.3&pid=1.7&rm=3" alt="Nước uống tại nhà">
                            </div>
                            <div class="tip-content">
                                <h3 class="tip-title">Cách làm nước uống giải nhiệt tại nhà</h3>
                                <p class="tip-desc">Công thức đơn giản để tạo ra thức uống mát lành từ trái cây tươi.</p>
                            </div>
                        </a>
                    </div>
                </div>
            </section>
        </div>

        <jsp:include page="scrollToTop.jsp"/>
        <jsp:include page="footer.jsp"/>
        <!-- JavaScript -->
        <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
        <script>
                        // Initialize AOS
                        AOS.init({
                            duration: 800,
                            easing: 'ease-in-out',
                            once: true,
                            delay: 100
                        });

                        // Current slide index
                        let slideIndex = 1;
                        showSlides(slideIndex);

                        // Auto slide every 4 seconds
                        setInterval(function () {
                            plusSlides(1);
                        }, 4000);

                        // Next/previous controls
                        function plusSlides(n) {
                            showSlides(slideIndex += n);
                        }

                        // Thumbnail image controls
                        function currentSlide(n) {
                            showSlides(slideIndex = n);
                        }

                        function showSlides(n) {
                            let i;
                            let slides = document.getElementsByClassName("mySlides");
                            let dots = document.getElementsByClassName("dot");
                            if (n > slides.length) {
                                slideIndex = 1
                            }
                            if (n < 1) {
                                slideIndex = slides.length
                            }
                            for (i = 0; i < slides.length; i++) {
                                slides[i].style.display = "none";
                            }
                            for (i = 0; i < dots.length; i++) {
                                dots[i].className = dots[i].className.replace(" active", "");
                            }
                            slides[slideIndex - 1].style.display = "block";
                            dots[slideIndex - 1].className += " active";
                        }
        </script>
    </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                                <img src="https://ts1.mm.bing.net/th?id=OIP.FCF2S7TfFoDIVt8g1DWciwHaHa&pid=15.1" alt="Nước giải khát">
                            </div>
                            <p>Nước giải khát</p>
                        </a>
                    </div>
                    <div class="category-item">
                        <a href="#">
                            <div class="category-icon">
                                <img src="https://cdnv2.tgdd.vn/bhx-static/bhx/Category/Images/8788/image-2461_202410151408000050.png" alt="Trái cây">
                            </div>
                            <p>Trái cây</p>
                        </a>
                    </div>
                    <div class="category-item">
                        <a href="#">
                            <div class="category-icon">
                                <img src="https://th.bing.com/th/id/OIP.VqYSq7knIlebLnvMfmcaDgHaHa?w=174&h=180&c=7&r=0&o=7&cb=iwp2&dpr=1.3&pid=1.7&rm=3" alt="Bánh kẹo">
                            </div>
                            <p>Bánh kẹo</p>
                        </a>
                    </div>
                    <div class="category-item">
                        <a href="#">
                            <div class="category-icon">
                                <img src="https://th.bing.com/th/id/OIP.VqYSq7knIlebLnvMfmcaDgHaHa?w=174&h=180&c=7&r=0&o=7&cb=iwp2&dpr=1.3&pid=1.7&rm=3" alt="Bánh kẹo">
                            </div>
                            <p>Sửa các loại</p>
                        </a>
                    </div>
                    <div class="category-item">
                        <a href="#">
                            <div class="category-icon">
                                <img src="homepage/img/mother-child-icon.png" alt="Mẹ và bé">
                            </div>
                            <p>Mẹ và bé</p>
                        </a>
                    </div>
                    <div class="category-item">
                        <a href="#">
                            <div class="category-icon">
                                <img src="homepage/img/mypham.jpg" alt="Mỹ phẩm">
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
                    <div class="product-card">
                        <div class="product-badge">Hot</div>
                        <div class="product-image-container">
                            <img src="homepage/img/SonBlackRouge.jpg" alt="Son Black Rouge" class="product-image">
                            <div class="product-actions">
                                <button class="action-btn"><i class="fas fa-cart-plus"></i></button>
                                <button class="action-btn"><i class="fas fa-eye"></i></button>
                            </div>
                        </div>
                        <div class="product-info">
                            <h3 class="product-name">Son Black Rouge</h3>
                            <div class="product-rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                                <span>(45)</span>
                            </div>
                            <div class="product-price">
                                <span class="current-price">150.000đ</span>
                                <span class="unit">/ thỏi</span>
                            </div>
                            <div class="button-group">
                                <button class="add-to-cart-btn"><i class="fas fa-shopping-cart"></i> Giỏ hàng</button>
                                <button class="buy-now-btn">Mua ngay</button>
                            </div>
                        </div>
                    </div>
                    
                    <div class="product-card">
                        <div class="product-badge sale">-15%</div>
                        <div class="product-image-container">
                            <img src="homepage/img/yensaocollagen.jpg" alt="Nước yến sào" class="product-image">
                            <div class="product-actions">
                                <button class="action-btn"><i class="fas fa-cart-plus"></i></button>
                                <button class="action-btn"><i class="fas fa-eye"></i></button>
                            </div>
                        </div>
                        <div class="product-info">
                            <h3 class="product-name">Nước yến sào collagen</h3>
                            <div class="product-rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="far fa-star"></i>
                                <span>(32)</span>
                            </div>
                            <div class="product-price">
                                <span class="current-price">25.000đ</span>
                                <span class="unit">/ chai</span>
                                <span class="old-price">30.000đ</span>
                            </div>
                            <div class="button-group">
                                <button class="add-to-cart-btn"><i class="fas fa-shopping-cart"></i> Giỏ hàng</button>
                                <button class="buy-now-btn">Mua ngay</button>
                            </div>
                        </div>
                    </div>
                    
                    <div class="product-card">
                        <div class="product-image-container">
                            <img src="homepage/img/banhque.jpg" alt="Bánh quế 4 vị" class="product-image">
                            <div class="product-actions">
                                <button class="action-btn"><i class="fas fa-cart-plus"></i></button>
                                <button class="action-btn"><i class="fas fa-eye"></i></button>
                            </div>
                        </div>
                        <div class="product-info">
                            <h3 class="product-name">Bánh quế 4 vị</h3>
                            <div class="product-rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                                <i class="far fa-star"></i>
                                <span>(18)</span>
                            </div>
                            <div class="product-price">
                                <span class="current-price">14.000đ</span>
                                <span class="unit">/ gói</span>
                            </div>
                            <div class="button-group">
                                <button class="add-to-cart-btn"><i class="fas fa-shopping-cart"></i> Giỏ hàng</button>
                                <button class="buy-now-btn">Mua ngay</button>
                            </div>
                        </div>
                    </div>
                    
                    <div class="product-card">
                        <div class="product-badge new">Mới</div>
                        <div class="product-image-container">
                            <img src="homepage/img/mitsay.jpg" alt="Mít sấy gói 100g" class="product-image">
                            <div class="product-actions">
                                <button class="action-btn"><i class="fas fa-cart-plus"></i></button>
                                <button class="action-btn"><i class="fas fa-eye"></i></button>
                            </div>
                        </div>
                        <div class="product-info">
                            <h3 class="product-name">Mít sấy gói 100g</h3>
                            <div class="product-rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <span>(27)</span>
                            </div>
                            <div class="product-price">
                                <span class="current-price">30.000đ</span>
                                <span class="unit">/ gói</span>
                            </div>
                            <div class="button-group">
                                <button class="add-to-cart-btn"><i class="fas fa-shopping-cart"></i> Giỏ hàng</button>
                                <button class="buy-now-btn">Mua ngay</button>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="#" class="see-more-btn">Xem thêm sản phẩm <i class="fas fa-arrow-right"></i></a>
            </section>

            <!-- Banner -->
            <section class="banner-section" data-aos="fade-up">
                <img src="./homepage/img/freecompress-hero-banner-pc_202504181036599398.jpg" alt="Banner" class="full-width-banner">
            </section>

            <!-- Beverages Section -->
            <section class="product-section" data-aos="fade-up">
                <div class="section-header">
                    <div class="section-title">
                        <i class="fas fa-glass-cheers"></i> Nước giải khát
                    </div>
                    <a href="#" class="view-all">Xem tất cả <i class="fas fa-chevron-right"></i></a>
                </div>
                
                <div class="product-grid">
                    <div class="product-card">
                        <div class="product-image-container">
                            <img src="https://cdnv2.tgdd.vn/bhx-static/bhx/Products/Images/8820/238556/bhx/238556-thumb-omni_202505141343284334.jpg" alt="Coca Cola" class="product-image">
                            <div class="product-actions">
                                <button class="action-btn"><i class="fas fa-cart-plus"></i></button>
                                <button class="action-btn"><i class="fas fa-eye"></i></button>
                            </div>
                        </div>
                        <div class="product-info">
                            <h3 class="product-name">Coca Cola Original</h3>
                            <div class="product-rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="far fa-star"></i>
                                <span>(42)</span>
                            </div>
                            <div class="product-price">
                                <span class="current-price">15.000đ</span>
                                <span class="unit">/ chai</span>
                            </div>
                            <div class="button-group">
                                <button class="add-to-cart-btn"><i class="fas fa-shopping-cart"></i> Giỏ hàng</button>
                                <button class="buy-now-btn">Mua ngay</button>
                            </div>
                        </div>
                    </div>
                    
                    <div class="product-card">
                        <div class="product-image-container">
                            <img src="https://cdnv2.tgdd.vn/bhx-static/bhx/Products/Images/8781/332800/bhx/thit-dui-heo-300g_202504121350469749.jpg" alt="Pepsi" class="product-image">
                            <div class="product-actions">
                                <button class="action-btn"><i class="fas fa-cart-plus"></i></button>
                                <button class="action-btn"><i class="fas fa-eye"></i></button>
                            </div>
                        </div>
                        <div class="product-info">
                            <h3 class="product-name">Pepsi</h3>
                            <div class="product-rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="far fa-star"></i>
                                <span>(36)</span>
                            </div>
                            <div class="product-price">
                                <span class="current-price">15.000đ</span>
                                <span class="unit">/ chai</span>
                            </div>
                            <div class="button-group">
                                <button class="add-to-cart-btn"><i class="fas fa-shopping-cart"></i> Giỏ hàng</button>
                                <button class="buy-now-btn">Mua ngay</button>
                            </div>
                        </div>
                    </div>
                    
                    <div class="product-card">
                        <div class="product-badge sale">-10%</div>
                        <div class="product-image-container">
                            <img src="https://cdnv2.tgdd.vn/bhx-static/bhx/Products/Images/8783/309143/bhx/trung-ga-so-hop-10-tang-2_202504121919506761.jpg" alt="Sprite" class="product-image">
                            <div class="product-actions">
                                <button class="action-btn"><i class="fas fa-cart-plus"></i></button>
                                <button class="action-btn"><i class="fas fa-eye"></i></button>
                            </div>
                        </div>
                        <div class="product-info">
                            <h3 class="product-name">Sprite Chanh</h3>
                            <div class="product-rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <span>(19)</span>
                            </div>
                            <div class="product-price">
                                <span class="current-price">13.500đ</span>
                                <span class="unit">/ chai</span>
                                <span class="old-price">15.000đ</span>
                            </div>
                            <div class="button-group">
                                <button class="add-to-cart-btn"><i class="fas fa-shopping-cart"></i> Giỏ hàng</button>
                                <button class="buy-now-btn">Mua ngay</button>
                            </div>
                        </div>
                    </div>
                    
                    <div class="product-card">
                        <div class="product-image-container">
                            <img src="https://cdnv2.tgdd.vn/bhx-static/bhx/Products/Images/8783/309143/bhx/trung-ga-so-hop-10-tang-2_202504121919506761.jpg" alt="Fanta" class="product-image">
                            <div class="product-actions">
                                <button class="action-btn"><i class="fas fa-cart-plus"></i></button>
                                <button class="action-btn"><i class="fas fa-eye"></i></button>
                            </div>
                        </div>
                        <div class="product-info">
                            <h3 class="product-name">Fanta Orange</h3>
                            <div class="product-rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="far fa-star"></i>
                                <span>(24)</span>
                            </div>
                            <div class="product-price">
                                <span class="current-price">15.000đ</span>
                                <span class="unit">/ chai</span>
                            </div>
                            <div class="button-group">
                                <button class="add-to-cart-btn"><i class="fas fa-shopping-cart"></i> Giỏ hàng</button>
                                <button class="buy-now-btn">Mua ngay</button>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="#" class="see-more-btn">Xem thêm sản phẩm <i class="fas fa-arrow-right"></i></a>
            </section>

            <!-- Banner 2 -->
            <section class="banner-section" data-aos="fade-up">
                <img src="./homepage/img/freecompress-pc-1800x480-1_202503052034203959.jpg" alt="Banner" class="full-width-banner">
            </section>

            <!-- Fruits Section -->
            <section class="product-section" data-aos="fade-up">
                <div class="section-header">
                    <div class="section-title">
                        <i class="fas fa-apple-alt"></i> Trái cây
                    </div>
                    <a href="#" class="view-all">Xem tất cả <i class="fas fa-chevron-right"></i></a>
                </div>
                
                <div class="product-grid">
                    <div class="product-card">
                        <div class="product-badge organic">Hữu cơ</div>
                        <div class="product-image-container">
                            <img src="https://cdnv2.tgdd.vn/bhx-static/bhx/Products/Images/8820/238556/bhx/238556-thumb-omni_202505141343284334.jpg" alt="Táo Mỹ" class="product-image">
                            <div class="product-actions">
                                <button class="action-btn"><i class="fas fa-cart-plus"></i></button>
                                <button class="action-btn"><i class="fas fa-eye"></i></button>
                            </div>
                        </div>
                        <div class="product-info">
                            <h3 class="product-name">Táo Mỹ</h3>
                            <div class="product-rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="far fa-star"></i>
                                <span>(32)</span>
                            </div>
                            <div class="product-price">
                                <span class="current-price">45.000đ</span>
                                <span class="unit">/ kg</span>
                            </div>
                            <div class="button-group">
                                <button class="add-to-cart-btn"><i class="fas fa-shopping-cart"></i> Giỏ hàng</button>
                                <button class="buy-now-btn">Mua ngay</button>
                            </div>
                        </div>
                    </div>
                    
                    <div class="product-card">
                        <div class="product-badge sale">-20%</div>
                        <div class="product-image-container">
                            <img src="https://cdnv2.tgdd.vn/bhx-static/bhx/Products/Images/8781/332800/bhx/thit-dui-heo-300g_202504121350469749.jpg" alt="Cam Sành" class="product-image">
                            <div class="product-actions">
                                <button class="action-btn"><i class="fas fa-cart-plus"></i></button>
                                <button class="action-btn"><i class="fas fa-eye"></i></button>
                            </div>
                        </div>
                        <div class="product-info">
                            <h3 class="product-name">Cam Sành</h3>
                            <div class="product-rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                                <span>(48)</span>
                            </div>
                            <div class="product-price">
                                <span class="current-price">32.000đ</span>
                                <span class="unit">/ kg</span>
                                <span class="old-price">40.000đ</span>
                            </div>
                            <div class="button-group">
                                <button class="add-to-cart-btn"><i class="fas fa-shopping-cart"></i> Giỏ hàng</button>
                                <button class="buy-now-btn">Mua ngay</button>
                            </div>
                        </div>
                    </div>
                    
                    <div class="product-card">
                        <div class="product-image-container">
                            <img src="https://cdnv2.tgdd.vn/bhx-static/bhx/Products/Images/8783/309143/bhx/trung-ga-so-hop-10-tang-2_202504121919506761.jpg" alt="Xoài" class="product-image">
                            <div class="product-actions">
                                <button class="action-btn"><i class="fas fa-cart-plus"></i></button>
                                <button class="action-btn"><i class="fas fa-eye"></i></button>
                            </div>
                        </div>
                        <div class="product-info">
                            <h3 class="product-name">Xoài Cát Hòa Lộc</h3>
                            <div class="product-rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <span>(56)</span>
                            </div>
                            <div class="product-price">
                                <span class="current-price">55.000đ</span>
                                <span class="unit">/ kg</span>
                            </div>
                            <div class="button-group">
                                <button class="add-to-cart-btn"><i class="fas fa-shopping-cart"></i> Giỏ hàng</button>
                                <button class="buy-now-btn">Mua ngay</button>
                            </div>
                        </div>
                    </div>
                    
                    <div class="product-card">
                        <div class="product-badge new">Mới</div>
                        <div class="product-image-container">
                            <img src="https://cdnv2.tgdd.vn/bhx-static/bhx/Products/Images/8783/309143/bhx/trung-ga-so-hop-10-tang-2_202504121919506761.jpg" alt="Nho" class="product-image">
                            <div class="product-actions">
                                <button class="action-btn"><i class="fas fa-cart-plus"></i></button>
                                <button class="action-btn"><i class="fas fa-eye"></i></button>
                            </div>
                        </div>
                        <div class="product-info">
                            <h3 class="product-name">Nho Mỹ không hạt</h3>
                            <div class="product-rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                                <span>(29)</span>
                            </div>
                            <div class="product-price">
                                <span class="current-price">120.000đ</span>
                                <span class="unit">/ kg</span>
                            </div>
                            <div class="button-group">
                                <button class="add-to-cart-btn"><i class="fas fa-shopping-cart"></i> Giỏ hàng</button>
                                <button class="buy-now-btn">Mua ngay</button>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="#" class="see-more-btn">Xem thêm sản phẩm <i class="fas fa-arrow-right"></i></a>
            </section>

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
            setInterval(function() {
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
                if (n > slides.length) {slideIndex = 1}
                if (n < 1) {slideIndex = slides.length}
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[slideIndex-1].style.display = "block";
                dots[slideIndex-1].className += " active";
            }
        </script>
    </body>
</html>
<%@page import="model.Product"%>
<%@page import="model.Review"%>
<%@page import="java.util.List"%>
<%
    Product product = (Product) request.getAttribute("product");
    List<Product> related = (List<Product>) request.getAttribute("relatedProducts");
    List<Review> reviews = (List<Review>) request.getAttribute("reviews");
%>

<style>
    .product-detail {
        display: flex;
        flex-direction: column;
        gap: 30px;
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
        font-family: Arial, sans-serif;
    }

    .product-detail-top {
        display: flex;
        gap: 30px;
    }

    .left-image img {
        width: 350px;
        height: auto;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    .right-info {
        flex: 1;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }

    .right-info h2 {
        font-size: 28px;
        margin-bottom: 10px;
        color: #333;
    }

    .right-info p {
        margin: 6px 0;
        font-size: 16px;
    }

    .related-and-reviews {
        display: flex;
        gap: 30px;
    }

    .product-reviews, .related-products {
        flex: 1;
    }

    .product-reviews h3,
    .related-products h3 {
        font-size: 22px;
        margin-bottom: 15px;
        border-bottom: 2px solid #ccc;
        padding-bottom: 5px;
        color: #444;
    }

    .review-item {
        background-color: #f9f9f9;
        padding: 12px;
        margin-bottom: 12px;
        border-radius: 6px;
    }

    .review-item img {
        max-width: 100px;
        height: auto;
        margin-top: 10px;
        border-radius: 4px;
        display: block;
    }

    .product-grid {
        display: flex;
        flex-wrap: wrap;
        gap: 15px;
    }

    .product-card {
        width: calc(50% - 10px);
        background-color: #fafafa;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 6px;
        text-align: center;
    }

    .product-card img {
        width: 100%;
        height: auto;
        border-radius: 6px;
        margin-bottom: 10px;
    }

    .product-card p {
        margin: 5px 0;
        font-size: 15px;
    }

    .product-card a {
        text-decoration: none;
        color: #fff;
        background-color: #28a745;
        padding: 6px 10px;
        border-radius: 4px;
        display: inline-block;
        margin-top: 5px;
        transition: background-color 0.3s ease;
    }
    .review-item img {
        max-width: 200px;
        height: auto;
        margin-top: 10px;
        border-radius: 4px;
        display: block;
        object-fit: contain;
        box-shadow: 0 0 5px rgba(0,0,0,0.1);
    }


    .product-card a:hover {
        background-color: #218838;
    }
</style>

<div class="product-detail">
    <div class="product-detail-top">
        <div class="left-image">
            <img src="ImageServlet?name=<%= product.getImage()%>" alt="<%= product.getProductName()%>" />
        </div>
        <div class="right-info">
            <h2><%= product.getProductName()%></h2>
            <p>Giá: <%= new java.text.DecimalFormat("#,###").format(product.getPrice())%> VN? / <%= product.getUnit()%></p>
            <p>Mô t?: <%= product.getDescription()%></p>
            <p>Danh m?c: <%= product.getCategory().getCategoryName()%></p>
            <p>Nhà cung c?p: <%= product.getSupplier().getSupplierName()%></p>
            <p>Tr?ng thái: <%= product.getStatus()%></p>
        </div>
    </div>

    <div class="product-reviews">
        <h3>?ánh giá t? khách hàng</h3>
        <%
            if (reviews != null && !reviews.isEmpty()) {
                for (Review r : reviews) {
                    String reviewImage = r.getImage();
        %>
        <div class="review-item">
            <p><strong>? <%= r.getRating()%>/5</strong></p>
            <p><%= r.getComment()%></p>
            <% if (reviewImage != null && !reviewImage.trim().isEmpty()) {%>
            <img src="ImageServlet?name=<%= reviewImage%>" alt="review image" />
            <% } %>
            <hr />
        </div>
        <%  }
        } else { %>
        <p>Ch?a có ?ánh giá nào.</p>
        <% } %>
    </div>


    <div class="related-products">
        <h3>S?n ph?m liên quan</h3>
        <div class="product-grid">
            <%
                for (Product p : related) {
            %>
            <div class="product-card">
                <img src="ImageServlet?name=<%= p.getImage()%>" />
                <p><%= p.getProductName()%></p>
                <p><%= new java.text.DecimalFormat("#,###").format(p.getPrice())%> VN?</p>
                <a href="ProductDetail?id=<%= p.getProductID()%>">Chi ti?t</a>
            </div>
            <% }%>
        </div>
    </div>
</div>
</div>

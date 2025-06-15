<%@page import="model.Supplier"%>
<%@page import="model.Category"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.productDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Category> cate = (List<Category>) request.getAttribute("dataCate");
    List<Product> product = (List<Product>) request.getAttribute("data");
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Product Management</title>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/crudProduct.css">
    </head>
    <body>
        <div class="main-container">
            <%@ include file="../sidebar.jsp" %>

            <div class="content">
                <div class="content-container table-container">
                    <h1>Product List</h1>
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end" style="margin: 5px;">
                        <a href="Product?action=create" class="btn btn-success me-md-2">Create</a>
                    </div>
                    <% if (product != null && !product.isEmpty()) { %>
                    <table class="table table-striped table-hover">
                        <thead class="text-center">
                            <tr>
                                <th>ID</th>
                                <th class="parent-category">Category</th>
                                <th class="product-name">Product Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Unit</th>
                                <th>Description</th>
                                <th>Image</th>
                                <th>Supplier</th>
                                <th>Create Date</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Product pro : product) {
                                    Category child = pro.getCategory();
                                    String parentName = "N/A";

                                    if (child != null) {
                                        int parentId = child.getParentID();
                                        for (Category c : cate){
                                            if (c.getCategoryID() == parentId) {
                                                parentName = c.getCategoryName();
                                                break;
                                            }
                                        }
                                    }
                            %>
                            <tr>
                                <td><%= pro.getProductID() %></td>
                                <td class="parent-category"><%= parentName %></td>
                                <td class="product-name"><%= pro.getProductName() %></td>
                                <td><%= new java.text.DecimalFormat("#,###").format(pro.getPrice()) %></td>
                                <td><%= pro.getQuantity() %></td>
                                <td><%= pro.getUnit() %></td>
                                <td>
                                    <%= pro.getDescription().replaceAll("\n", "<br/>") %>
                                </td>


                                <td>
                                    <img src="ImageServlet?name=<%= pro.getImage() %>" alt="Product Image" style="width: 60px; height: auto;">
                                </td>
                                <td><%= pro.getSupplier().getSupplierName()%></td>
                                <td><%= pro.getCreatedAt() %></td>
                                <td class="action-buttons">
                                    <a href="Product?action=update&id=<%= pro.getProductID()%>" class="btn btn-primary btn-sm">Edit</a>
                                    <a href="Product?action=delete&id=<%= pro.getProductID() %>" class="btn btn-danger btn-sm">Delete</a>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                    <% } else { %>
                    <div class="text-center">
                        <h1 style="color: red; margin: 30px;">There is no data!</h1>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

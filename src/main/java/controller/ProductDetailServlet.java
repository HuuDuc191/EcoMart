/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.ViewProductDetail;

import dao.ReviewDAO;
import dao.productDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Product;
import model.Review;

/**
 *
 * @author nguye
 */
@WebServlet("/ProductDetail")
public class ProductDetailServlet extends HttpServlet {

    private productDAO productDAO = new productDAO();
    private ReviewDAO reviewDAO = new ReviewDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(request.getParameter("id"));

            // Lấy thông tin sản phẩm
            Product product = productDAO.getProductByIdDetail(productId);
            request.setAttribute("product", product);

// Lấy các sản phẩm liên quan (cùng ParentID, trừ chính nó)
            List<Product> relatedProducts = productDAO.getProductsByCategory(
                    product.getCategory().getParentID(),
                    product.getProductID()
            );
            request.setAttribute("relatedProducts", relatedProducts);

            // Lấy đánh giá sản phẩm
            List<Review> reviews = reviewDAO.getReviewsByProductID(productId);
            request.setAttribute("reviews", reviews);

            request.getRequestDispatcher("homepage/productDetail.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Không tìm thấy sản phẩm!");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void processRequest(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
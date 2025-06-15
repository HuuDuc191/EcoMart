package controller.Search;

import dao.ProductDAO;
import model.Product;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");
        String sort = request.getParameter("sort");

        ProductDAO dao = new ProductDAO();
        List<Product> list = dao.searchByCategoryRelation(keyword, sort);

        request.setAttribute("keyword", keyword);
        request.setAttribute("results", list);
        request.setAttribute("sort", sort);

        request.getRequestDispatcher("homepage/searchResult.jsp").forward(request, response);
    }
}

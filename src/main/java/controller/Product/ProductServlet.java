package controller.Product;

import dao.productDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import static java.lang.System.out;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.util.List;
import model.Category;
import model.Product;
import model.Supplier;

@WebServlet(name = "ProductServlet", urlPatterns = {"/Product"})
@MultipartConfig
public class ProductServlet extends HttpServlet {

    private static final String IMAGE_UPLOAD_DIR = "C:/ProductImages";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }
        productDAO dao = new productDAO();
        switch (action) {
            case "list":
                List<Product> list = dao.getAll();
                List<Category> listCategory = dao.getCategory();

                request.setAttribute("dataCate", listCategory);
                request.setAttribute("data", list);

                request.getRequestDispatcher("product.jsp").forward(request, response);
                break;
            case "create":
                request.setAttribute("dataCate", dao.getCategory());
                request.setAttribute("dataSup", dao.getAllSuppliers());
                request.getRequestDispatcher("./CRUD_Product/create-product.jsp").forward(request, response);
                break;
            case "delete":
                String idRaw = request.getParameter("id");
                int id = 0;
                Product mo = null;
                try {
                    id = Integer.parseInt(idRaw);
                    mo = dao.getProductById(id);
                    request.setAttribute("mo", mo);
                    request.getRequestDispatcher("./CRUD_Product/delete-product.jsp").forward(request, response);
                } catch (Exception e) {
                    out.println(e.getMessage());
                }
                break;
            case "update":
                String idRaw1 = request.getParameter("id");
                int id1 = 0;
                try {
                    id1 = Integer.parseInt(idRaw1);
                    mo = dao.getProductById(id1);
                    request.setAttribute("mo", mo);

                    request.setAttribute("dataCate", dao.getCategory());
                    request.setAttribute("dataSup", dao.getAllSuppliers());

                    request.getRequestDispatcher("./CRUD_Product/edit-product.jsp").forward(request, response);
                } catch (Exception e) {
                    out.println(e.getMessage());
                }
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        productDAO dao = new productDAO();
        String action = request.getParameter("action");
        PrintWriter out = response.getWriter();
        if (action == null) {
            response.sendRedirect("Product");
            return;
        }

        switch (action) {
            case "create":
                String pName = request.getParameter("pName");
                double pPrice = Double.parseDouble(request.getParameter("pPrice"));
                int pQuantity = Integer.parseInt(request.getParameter("pQuanity"));
                String pUnit = request.getParameter("pUnit");
                String pDescription = request.getParameter("pDescription");

                int categoryID = Integer.parseInt(request.getParameter("categoryID"));
                int supplierID = Integer.parseInt(request.getParameter("supplierID"));

                Part filePart = request.getPart("pImage");
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

                if (!fileName.isEmpty()) {
                    File uploadDir = new File(IMAGE_UPLOAD_DIR);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdirs();
                    }
                    filePart.write(IMAGE_UPLOAD_DIR + File.separator + fileName);
                }

                String pImage = fileName;
                Timestamp date = new Timestamp(System.currentTimeMillis());

                int res = dao.insert(pName, pPrice, pDescription, pQuantity, pImage, pUnit, date, categoryID, supplierID);

                if (res == 1) {
                    response.sendRedirect("Product");
                } else {
                    response.sendRedirect("Product?action=create");
                }
                break;

            case "delete":
                String idRaw = request.getParameter("id");
                int id = Integer.parseInt(idRaw);
                if (dao.delete(id) == 1) {
                    response.sendRedirect("Product");
                } else {
                    response.sendRedirect("Product?action=delete&id=" + id);
                }
                break;

            case "update":
                int id1 = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("pName");
                double price = Double.parseDouble(request.getParameter("pPrice"));
                int quantity = Integer.parseInt(request.getParameter("pQuantity"));
                String unit = request.getParameter("pUnit");
                String description = request.getParameter("pDescription");
                int categoryId = Integer.parseInt(request.getParameter("categoryID"));
                int supplierId = Integer.parseInt(request.getParameter("supplierID"));

                Part filePart1 = request.getPart("pImage");
                String fileName1 = Paths.get(filePart1.getSubmittedFileName()).getFileName().toString();
                String image;

                if (!fileName1.isEmpty()) {
                    File uploadDir = new File(IMAGE_UPLOAD_DIR);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdirs();
                    }
                    filePart1.write(IMAGE_UPLOAD_DIR + File.separator + fileName1);
                    image = fileName1;
                } else {
                    Product existing = dao.getProductById(id1);
                    image = existing.getImage();
                }

                Timestamp createdAt = new Timestamp(System.currentTimeMillis());
                Product product = new Product(id1, name, price, quantity, unit, description, image, createdAt);

                Category category = new Category();
                category.setCategoryID(categoryId);
                product.setCategory(category);

                Supplier supplier = new Supplier();
                supplier.setSupplierId(supplierId);
                product.setSupplier(supplier);

                boolean result = dao.update(product);

                if (result) {
                    response.sendRedirect("Product");
                } else {
                    response.sendRedirect("Product?action=update&id=" + id1);
                }
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "ProductServlet handles CRUD for products";
    }
}

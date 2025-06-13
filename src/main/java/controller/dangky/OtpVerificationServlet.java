/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.dangky;

import dao.AccountDAO;
import dao.TokenDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Token;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "OtpVerificationServlet", urlPatterns = {"/otp"})
public class OtpVerificationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OtpconfirmServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OtpconfirmServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Forwarding to /dangky/otp.jsp");
        request.getRequestDispatcher("/dangky/otp.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer customerId = (Integer) request.getSession().getAttribute("customerId");
        Integer accountId = (Integer) request.getSession().getAttribute("accountId");
        String otp = request.getParameter("otp");

        System.out.println("OTP verification attempt: customerId=" + customerId + ", accountId=" + accountId + ", otp=" + otp);

        if (customerId == null || accountId == null) {
            System.out.println("Missing session attributes: customerId=" + customerId + ", accountId=" + accountId);
            request.setAttribute("error", "Phiên đăng ký đã hết hạn. Vui lòng đăng ký lại!");
            request.getRequestDispatcher("/dangky/register.jsp").forward(request, response);
            return;
        }

        if (otp == null || otp.trim().isEmpty()) {
            System.out.println("Empty OTP input");
            request.setAttribute("error", "Vui lòng nhập OTP!");
            request.getRequestDispatcher("/dangky/otp.jsp").forward(request, response);
            return;
        }

        TokenDAO tokenDAO = new TokenDAO();
        try {
            Token token = tokenDAO.getValidToken(customerId, otp.trim());
            if (token != null) {
                System.out.println("Valid OTP found: TokenID=" + token.getTokenId() + ", Token=" + token.getToken() + ", Time_Exp=" + token.getTimeExp());
                tokenDAO.updateTokenStatus(token.getTokenId(), "used");
                AccountDAO accountDAO = new AccountDAO();
                accountDAO.updateAccountStatus(accountId, "Active");
                System.out.println("OTP verified successfully for customerId=" + customerId + ", accountId=" + accountId);
                request.getSession().removeAttribute("customerId");
                request.getSession().removeAttribute("accountId");
                response.sendRedirect(request.getContextPath() + "/login");
            } else {
                System.out.println("Invalid or expired OTP for customerId=" + customerId + ", otp=" + otp);
                request.setAttribute("error", "OTP không hợp lệ hoặc đã hết hạn!");
                request.getRequestDispatcher("/dangky/otp.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            System.out.println("Database error during OTP verification: " + e.getMessage());
            request.setAttribute("error", "Lỗi hệ thống: " + e.getMessage());
            request.getRequestDispatcher("/dangky/otp.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Handles OTP verification";
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Mentor;

/**
 *
 * @author luutu
 */
@WebServlet(name = "ViewProfile", urlPatterns = {"/ViewProfile"})
public class ViewProfile extends HttpServlet {

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
            out.println("<title>Servlet ViewProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewProfile at " + request.getContextPath() + "</h1>");
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
        AccountDAO aDAO = new AccountDAO();

        String accountIdParam = request.getParameter("id");

        if (accountIdParam != null && !accountIdParam.isEmpty()) {
            try {
                int accountId = Integer.parseInt(accountIdParam);
                Account account = aDAO.getAccPf(accountId);
                Mentor mentor = aDAO.getMentorPf(accountId);
                if (account != null) {

                    if (account.getRole().getRoleName().equals("Mentee")) {
                        request.setAttribute("acc", account);
                        request.getRequestDispatcher("/profile-mentee.jsp").forward(request, response);
                    } else if (account.getRole().getRoleName().equals("Mentor")) {
                        request.setAttribute("mentor", mentor);
                        request.getRequestDispatcher("/profile-mentor.jsp").forward(request, response);
                    } else {
                        response.sendError(HttpServletResponse.SC_FORBIDDEN, "Unauthorized role");
                    }
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Account not found");
                }
            } catch (NumberFormatException e) {
                // Handle the case where the ID parameter is not a valid integer
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid account ID");
            }
        } else {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "You need to log in first");
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

}

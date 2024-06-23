/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author asus
 */
//@WebServlet(name="AccountManage", urlPatterns={"/admin/account_admin"})
public class AccountManage extends HttpServlet {

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
            out.println("<title>Servlet NewServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewServlet at " + request.getContextPath() + "</h1>");
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

        request.getRequestDispatcher("login.jsp").forward(request, response);

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
        String action_admin = request.getParameter("action_admin");
        if (action_admin.equals("login")) {
            String user_name = request.getParameter("user_name");
            String password = request.getParameter("password");

            if (user_name.isEmpty() || password.isEmpty()) {
                request.setAttribute("error", "Bạn chưa nhập tên tài khoản hoặc mật khẩu!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                AccountDAO accountDAO = new AccountDAO();
                Account account = accountDAO.login(user_name, password);
                if (account == null) {
                    request.setAttribute("error", "Tài khoản của bạn không đúng!");

                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else if (account.getStatus() == false) {
                    request.setAttribute("error", "Tài khoản của bạn chưa được kích hoạt!");

                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    if (account.getRole().getRole_id() == 3 || account.getRole().getRole_id() == 4) {
                        HttpSession sess = request.getSession();
                        sess.setAttribute("ad_acc", account);
                        sess.setMaxInactiveInterval(3600);
                        request.getRequestDispatcher("/admin/home").forward(request, response);
                    } else {
                        request.setAttribute("error", "Tài khoản của bạn không đúng!");

                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }

                }
            }
        }else if(action_admin.equals("register")){ 
            String full_name = request.getParameter("full_name");
            String user_name = request.getParameter("user_name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String role = request.getParameter("role");
            int role_id = Integer.parseInt(role);
            AccountDAO accountDAO = new AccountDAO();
            
            try {
                Account account = accountDAO.checkAccount(user_name, email);
                if(account!= null){
                    request.setAttribute("full_name", full_name);
                    request.setAttribute("user_name", user_name);
                    request.setAttribute("email", email);
                    request.setAttribute("password", password);
                    request.setAttribute("role_id", role_id);
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }else {
                    accountDAO.registerAdmin(user_name, full_name, email, password, role_id);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(AccountManage.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
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

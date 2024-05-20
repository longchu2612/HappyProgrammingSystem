/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import util.Email;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author asus
 */
public class AccountController extends HttpServlet {

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
            throws ServletException, IOException, ParseException, SQLException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action.equals("checkregister")) {

            String account_name = request.getParameter("account_name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String confirm_password = request.getParameter("confirm_password");
            String full_name = request.getParameter("full_name");
            String phone_number = request.getParameter("phone");
            String dob = request.getParameter("birthday");
            Date date = Date.valueOf(dob);

            String gender = request.getParameter("gender");

            String address = request.getParameter("address");
            String role = request.getParameter("role");
            int role_id = Integer.parseInt(role);
            Boolean sex = Boolean.parseBoolean(gender);
            Boolean status = false;
            AccountDAO account_dao = new AccountDAO();
            Account account = account_dao.checkAccount(account_name, email);
            if (account != null) {
                request.setAttribute("account_name", account_name);
                request.setAttribute("email", email);
                request.setAttribute("password", password);
                request.setAttribute("confirm_password", confirm_password);
                request.setAttribute("full_name", full_name);
                request.setAttribute("phone_number", phone_number);
               

                request.setAttribute("dob", dob);
                request.setAttribute("address", address);
                request.setAttribute("sex", sex);
                request.setAttribute("role_id", role_id);
                request.setAttribute("error", "Email or username already exists on the system!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else {

                account_dao.Register(account_name, email, password, full_name, phone_number, date, sex, address, role_id, false);
                
                String activationCode = java.util.Base64.getEncoder().encodeToString(email.getBytes());
                Email.sendEmail(email, activationCode);
                
            }
        } else {

        }

//        int result = account_dao.Register(account_name, email, password, full_name, phone_number, dateOfBirth, sex, address, role_id, false);
//        if (result == 1) {
//            Email.sendEmail(email, "Hello Long");
//        } else {
//            response.getWriter().println("Thất bại");
//        }
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

        try {
            processRequest(request, response);
        } catch (ParseException | SQLException ex) {
            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
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

        try {
            processRequest(request, response);
        } catch (ParseException | SQLException ex) {
            System.out.println(ex.getMessage());
            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
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

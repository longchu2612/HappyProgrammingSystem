/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author ngoqu
 */
public class ProfileMenteeController extends HttpServlet {

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
        processRequest(request, response);
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
        HttpSession session = request.getSession();
        String userLogin = (String) session.getAttribute("username");
        int sex = (int) session.getAttribute("sex");
        String address = (String) session.getAttribute("address");
        String phonenumber = (String) session.getAttribute("phonenumber");
        String fullname = (String) session.getAttribute("fullname");
        String newname = request.getParameter("newname");
        String newfullname = request.getParameter("newfullname");
        String mobile = request.getParameter("mobile");
        String newaddress = request.getParameter("newaddress");
        String gender = request.getParameter("option");
        int gender1 = Integer.parseInt(gender);
        String newdob = request.getParameter("newdob");
         java.sql.Date date = java.sql.Date.valueOf(newdob);
        AccountDAO ac = new AccountDAO();
          java.sql.Date   dob = null;
        try {
            dob = ac.getDOBByUser(userLogin);
        } catch (SQLException ex) {
            Logger.getLogger(ProfileMenteeController.class.getName()).log(Level.SEVERE, null, ex);
        }
       if (!fullname.equals(newfullname)) {
            ac.updateUserfullname(userLogin, newfullname);
            session.setAttribute("fullname", newfullname);
        }
       if(sex!=gender1){
           ac.updateSex(userLogin, gender1);
            session.setAttribute("sex", gender1);
       }
        if (dob.compareTo(date)==0) {
        } else {
            ac.updateDOB(userLogin, date);
             session.setAttribute("dob", date);
        }
        
        if (!address.equals(newaddress)) {
            ac.updateAddress(userLogin, newaddress);
             session.setAttribute("address", newaddress);
       
        }
        if (!phonenumber.equals(mobile)) {
            ac.updatePhonenumber(userLogin, mobile);
            session.setAttribute("phonenumber", mobile);
 
        } if (!userLogin.equals(newname)) {
            ac.updateUsername(userLogin, newname);
         response.sendRedirect("login.jsp");
         return;
        }
                response.sendRedirect("profile-settings-mentee.jsp");
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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ScheduleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Account;

/**
 *
 * @author asus
 */
public class ScheduleMentorController extends HttpServlet {

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
            out.println("<title>Servlet ScheduleMentorController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ScheduleMentorController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession(false);
        Account account = (Account) session.getAttribute("account");
        if (session == null || session.getAttribute("account") == null || account.getRole().getRole_id() == 1) {
            response.sendRedirect("login.jsp");
            return;
        }

//        ScheduleDAO scheduleDAO = new ScheduleDAO();
//        List<Account> accounts = scheduleDAO.getScheduleOfMentor(account.getAccount_id());
//        Map<Account, Date> startDatesMap = new HashMap<>();
//        Map<Account, Date> endDatesMap = new HashMap<>();
//        if (accounts != null) {
//            for (Account account_1 : accounts) {
//                Date startDate = scheduleDAO.getTeachDateStart(account_1.getAccount_id(), account_1.getSchedules().get(0).getSessionId());
//                Date endDate = scheduleDAO.getTeachDateEnd(account_1.getAccount_id(), account_1.getSchedules().get(0).getSessionId());
//                startDatesMap.put(account_1, startDate);
//                endDatesMap.put(account_1, endDate);
//            }
//        }
//        request.setAttribute("startDatesMap", startDatesMap);
//        request.setAttribute("endDatesMap", endDatesMap);
//        request.setAttribute("accounts", accounts);
//        request.getRequestDispatcher("listSchedule.jsp").forward(request, response);
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

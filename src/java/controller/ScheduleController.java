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
import model.Account;

/**
 *
 * @author asus
 */
public class ScheduleController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet ScheduleController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ScheduleController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("createSchedule.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Account account = (Account) session.getAttribute("account");
        if (session == null || session.getAttribute("account") == null || account.getRole().getRole_id() == 1) {
            response.sendRedirect("login.jsp");
            return;
        }
        ScheduleDAO scheduleDAO = new ScheduleDAO();
        
        int mentor_id = account.getAccount_id();
        
        String[] checkboxDay = request.getParameterValues("selecteDay");
        if(checkboxDay != null){ 
            for(String day : checkboxDay){
                if(Integer.parseInt(day) == 2){
                    String startMonday = request.getParameter("startDateMonday");
                    String endMonday = request.getParameter("enDateMonday");
                    scheduleDAO.createNewSchedule(startMonday, endMonday, 2, mentor_id);
                }else if(Integer.parseInt(day) == 3){
                    String startTuesday = request.getParameter("startDateTuesday");
                    String endTuesday = request.getParameter("enDateTuesday");
                    scheduleDAO.createNewSchedule(startTuesday, endTuesday, 3, mentor_id);
                }else if(Integer.parseInt(day) == 4){
                    String startWed = request.getParameter("startWednesday");
                    String endWed = request.getParameter("endWednesday");
                    scheduleDAO.createNewSchedule(startWed, endWed, 4, mentor_id);
                }else if(Integer.parseInt(day) == 5){
                    String startThurs = request.getParameter("startThursday");
                    String endThurs = request.getParameter("endThursday");
                    scheduleDAO.createNewSchedule(startThurs, endThurs, 5, mentor_id);
                }else {
                    String startFriday = request.getParameter("startFriday");
                    String endFriday = request.getParameter("endFriday");
                    scheduleDAO.createNewSchedule(startFriday, endFriday, 6, mentor_id);
                }
            }
        }
        
        
        
//        request.getRequestDispatcher("createSchedule.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

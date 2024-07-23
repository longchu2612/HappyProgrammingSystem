/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import dao.CVDAO;
import dao.RequestCourseDAO;
import dao.SlotMenteeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.CV;
import model.Request_Course;

/**
 *
 * @author asus
 */
public class MyRequestController extends HttpServlet {

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
            out.println("<title>Servlet MyRequestController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MyRequestController at " + request.getContextPath() + "</h1>");
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
        Account mentor = (Account) session.getAttribute("account");
//        if(session.getAttribute("account") == null || mentor.getRole().getRole_id() == 1){ 
//            response.sendRedirect("login.jsp");
//            return;
//        }
        List<Request_Course> listRequestOfMentor = new ArrayList<>();
        RequestCourseDAO requestCourseDAO = new RequestCourseDAO();
        listRequestOfMentor = requestCourseDAO.getAllRequestCourseOfMentor(mentor.getAccount_id());
        request.setAttribute("listRequestOfMentor", listRequestOfMentor);
        request.getRequestDispatcher("myRequest.jsp").forward(request, response);
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
        
        HttpSession session = request.getSession(false);
        Account mentor = (Account) session.getAttribute("account");
        RequestCourseDAO requestCourseDAO = new RequestCourseDAO();
        SlotMenteeDAO slotMenteeDAO = new SlotMenteeDAO();
        AccountDAO accountDAO = new AccountDAO();
        List<Request_Course> listRequestOfMentor = new ArrayList<>();
        listRequestOfMentor = requestCourseDAO.getAllRequestCourseOfMentor(mentor.getAccount_id());
        
        String action = request.getParameter("action");
        String requestIdStr = request.getParameter("requestId");
        String reason = request.getParameter("reason");
        int requestId = Integer.parseInt(requestIdStr);
        
        if("accept".equalsIgnoreCase(action)){ 
            requestCourseDAO.updateRequestStatus(requestId, "2", reason);
            
        }else if("reject".equalsIgnoreCase(action)){ 
            requestCourseDAO.updateRequestStatus(requestId, "3", reason);
            Request_Course request_Course = requestCourseDAO.getRequestCourseById(requestId);
            int totalSlotOfMentee = slotMenteeDAO.countNumberOfSaveSlotMentee(request_Course.getSchedule().getId());
            CV cv = new CVDAO().getCVByAccId(String.valueOf(mentor.getAccount_id()));
            int rate = Integer.parseInt(cv.getRate());
            int totalPrice = rate *2*totalSlotOfMentee;
            int holdOfMentee = accountDAO.getHoldOfMentee(request_Course.getMentee().getAccount_id());
            holdOfMentee = holdOfMentee - totalPrice;
            accountDAO.updateHoldOfAccount(request_Course.getMentee().getAccount_id(), holdOfMentee);
            
        }
        
        request.setAttribute("listRequestOfMentor", listRequestOfMentor);
        request.getRequestDispatcher("myRequest.jsp").forward(request, response);
        
        
        
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

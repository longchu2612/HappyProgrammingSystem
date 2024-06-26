
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.ScheduleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;
import model.Slot;

/**
 *
 * @author asus
 */
public class UpdateScheduleManage extends HttpServlet {

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
            out.println("<title>Servlet UpdateScheduleManage</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateScheduleManage at " + request.getContextPath() + "</h1>");
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
        String schedule_id = request.getParameter("schedule_id");
        String sessionId = request.getParameter("sessionId");
        String account_id = request.getParameter("id");
        String month = request.getParameter("month");
        ScheduleDAO scheduleDAO = new ScheduleDAO();

        List<Slot> slots = scheduleDAO.getAllDayOfSlot(Integer.parseInt(schedule_id));

//        List<String> slotOfMonday = scheduleDAO.getAllSlotsOfDay(Integer.parseInt(id), sessionId, 1);
//        List<String> slotOfTuesday = scheduleDAO.getAllSlotsOfDay(Integer.parseInt(id), sessionId, 2);
//        List<String> slotOfWednesday = scheduleDAO.getAllSlotsOfDay(Integer.parseInt(id), sessionId, 3);
//        List<String> slotOfThursday = scheduleDAO.getAllSlotsOfDay(Integer.parseInt(id), sessionId, 4);
//        List<String> slotOfFriday = scheduleDAO.getAllSlotsOfDay(Integer.parseInt(id), sessionId, 5);
//        List<String> slotOfSaturday = scheduleDAO.getAllSlotsOfDay(Integer.parseInt(id), sessionId, 6);
//        List<String> slotOfSunday = scheduleDAO.getAllSlotsOfDay(Integer.parseInt(id), sessionId, 7);
        
        request.setAttribute("slots", slots);
//        request.setAttribute("slotOfMonday", slotOfMonday);
//        request.setAttribute("slotOfTuesday", slotOfTuesday);
//        request.setAttribute("slotOfWednesday", slotOfWednesday);
//        request.setAttribute("slotOfThursday", slotOfThursday);
//        request.setAttribute("slotOfFriday", slotOfFriday);
//        request.setAttribute("slotOfSaturday", slotOfSaturday);
//        request.setAttribute("slotOfSunday", slotOfSunday);
        request.setAttribute("month", month);
        request.setAttribute("schedule_id", schedule_id);
        request.setAttribute("accountId", account_id);
        request.setAttribute("sessionId", sessionId);
        request.getRequestDispatcher("update-schedule.jsp").forward(request, response);
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
        String accountId = request.getParameter("account_id");
        String sessionId = request.getParameter("session_id");
        String action = request.getParameter("action");
        String note = request.getParameter("note");
        String schedule_id = request.getParameter("schedule_id");
        String message = "";
        boolean check = true;

        ScheduleDAO scheduleDAO = new ScheduleDAO();
        List<Slot> slots = scheduleDAO.getAllDayOfSlot(Integer.parseInt(schedule_id));
//        Date startDate = scheduleDAO.getTeachDateStart(Integer.parseInt(accountId), sessionId);
//        Date endDate = scheduleDAO.getTeachDateEnd(Integer.parseInt(accountId), sessionId);
//        List<String> slotOfMonday = scheduleDAO.getAllSlotsOfDay(Integer.parseInt(accountId), sessionId, 1);
//        List<String> slotOfTuesday = scheduleDAO.getAllSlotsOfDay(Integer.parseInt(accountId), sessionId, 2);
//        List<String> slotOfWednesday = scheduleDAO.getAllSlotsOfDay(Integer.parseInt(accountId), sessionId, 3);
//        List<String> slotOfThursday = scheduleDAO.getAllSlotsOfDay(Integer.parseInt(accountId), sessionId, 4);
//        List<String> slotOfFriday = scheduleDAO.getAllSlotsOfDay(Integer.parseInt(accountId), sessionId, 5);
//        List<String> slotOfSaturday = scheduleDAO.getAllSlotsOfDay(Integer.parseInt(accountId), sessionId, 6);
//        List<String> slotOfSunday = scheduleDAO.getAllSlotsOfDay(Integer.parseInt(accountId), sessionId, 7);

        if (action.equals("accept")) {
            if (scheduleDAO.updateScheduleAcceptByMentorId(Integer.parseInt(schedule_id)) == 0) {
                message = "<span style='color:green;'>Accept failed!</span>";
            } else {
                message = "<span style='color:green;'>Accept successful!</span>";
            }

        } else if (action.equals("reject")) {
            if (scheduleDAO.updateScheduleRejectByMentorId(Integer.parseInt(schedule_id)) == 0) {
                message = "<span style='color:red;'>Reject failed!</span>";
            } else {
                message = "<span style='color:red;'>Reject successful!</span>";
            }
        }
//        request.setAttribute("note", note);
//        request.setAttribute("startDate", startDate);
//        request.setAttribute("endDate", endDate);
//        request.setAttribute("accountId", accountId);
//        request.setAttribute("sessionId", sessionId);
//        request.setAttribute("message", message);
//        request.setAttribute("slotOfMonday", slotOfMonday);
//        request.setAttribute("slotOfTuesday", slotOfTuesday);
//        request.setAttribute("slotOfWednesday", slotOfWednesday);
//        request.setAttribute("slotOfThursday", slotOfThursday);
//        request.setAttribute("slotOfFriday", slotOfFriday);
//        request.setAttribute("slotOfSaturday", slotOfSaturday);
//        request.setAttribute("slotOfSunday", slotOfSunday);
        request.setAttribute("schedule_id", schedule_id);
        request.setAttribute("message", message);
        request.setAttribute("slots", slots);
        request.getRequestDispatcher("update-schedule.jsp").forward(request, response);
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

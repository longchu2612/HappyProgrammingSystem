/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import static controller.ScheduleController.getFirstDayOfWeek;
import static controller.ScheduleController.getNumberOfISOWeeksInYear;
import dao.ScheduleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.Year;
import java.time.temporal.WeekFields;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import model.Schedule;
import model.Slot;

/**
 *
 * @author asus
 */
public class UpdateScheduleController extends HttpServlet {

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
            out.println("<title>Servlet UpdateScheduleController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateScheduleController at " + request.getContextPath() + "</h1>");
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

        int currentYear = Year.now().getValue();
        WeekFields weekFields = WeekFields.ISO;
        List<String> weeks = new ArrayList<>();
        LocalDate today = LocalDate.now();
        int currentWeek = today.get(weekFields.weekOfWeekBasedYear());
        int totalWeeks = getNumberOfISOWeeksInYear(currentYear);
        for (int week = 1; week <= totalWeeks; week++) {
            LocalDate firstDayOfWeek = getFirstDayOfWeek(currentYear, week);
            LocalDate lastDayOfWeek = firstDayOfWeek.plusDays(6);

            String weekRange = String.format("%02d/%02d To %02d/%02d",
                    firstDayOfWeek.getDayOfMonth(), firstDayOfWeek.getMonthValue(),
                    lastDayOfWeek.getDayOfMonth(), lastDayOfWeek.getMonthValue());
            weeks.add(weekRange);
        }

        String scheduleId = request.getParameter("scheduleId");
        String month = request.getParameter("month");
        ScheduleDAO scheduleDAO = new ScheduleDAO();
        List<Slot> slots = scheduleDAO.getAllDayOfSlot(Integer.parseInt(scheduleId));
        request.setAttribute("currentWeek", currentWeek);
        request.setAttribute("scheduleId", scheduleId);
        request.setAttribute("weeks", weeks);
        request.setAttribute("currentYear", currentYear);
        request.setAttribute("slots", slots);
        request.setAttribute("month", month);
        request.getRequestDispatcher("updatesSchedule.jsp").forward(request, response);
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
        String action = request.getParameter("action");
        
        
            
            String selectYear = request.getParameter("selectYear");
            List<String> weeks = new ArrayList<>();
            int totalWeeks = getNumberOfISOWeeksInYear(Integer.parseInt(selectYear));
            for (int week = 1; week <= totalWeeks; week++) {
                LocalDate firstDayOfWeek = getFirstDayOfWeek(Integer.parseInt(selectYear), week);
                LocalDate lastDayOfWeek = firstDayOfWeek.plusDays(6);

                String weekRange = String.format("%02d/%02d To %02d/%02d",
                        firstDayOfWeek.getDayOfMonth(), firstDayOfWeek.getMonthValue(),
                        lastDayOfWeek.getDayOfMonth(), lastDayOfWeek.getMonthValue());
                weeks.add(weekRange);
            }
            String scheduleId = request.getParameter("scheduleId");
            String month = request.getParameter("selectMonth");
            ScheduleDAO scheduleDAO = new ScheduleDAO();
            List<Slot> slots = scheduleDAO.getAllDayOfSlot(Integer.parseInt(scheduleId));
            request.setAttribute("scheduleId", scheduleId);
            request.setAttribute("weeks", weeks);
            request.setAttribute("currentYear", Integer.parseInt(selectYear));
            request.setAttribute("slots", slots);
            request.setAttribute("month", month);
            request.getRequestDispatcher("updatesSchedule.jsp").forward(request, response);
            
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

    public static void main(String[] args) {

    }

    public static int getNumberOfISOWeeksInYear(int year) {

        LocalDate firstDayOfYear = LocalDate.of(year, 1, 1);
        LocalDate firstDayOfNextYear = LocalDate.of(year + 1, 1, 1);
        WeekFields weekFields = WeekFields.ISO;
        int lastWeekOfCurrentYear = firstDayOfNextYear.minusDays(1).get(weekFields.weekOfWeekBasedYear());
        if (lastWeekOfCurrentYear == 1) {
            return firstDayOfNextYear.minusDays(7).get(weekFields.weekOfWeekBasedYear());
        } else {
            return lastWeekOfCurrentYear;
        }
    }

}

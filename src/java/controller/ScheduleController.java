/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ScheduleDAO;
import helper.ScheduleHelper;
import java.time.LocalDateTime;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.sql.Timestamp;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.DayOfWeek;
import java.time.Year;
import java.time.temporal.TemporalAdjusters;
import java.time.temporal.WeekFields;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import model.Account;

/**
 *
 * @author asus
 */
public class ScheduleController extends HttpServlet {

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
            out.println("<title>Servlet ScheduleController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ScheduleController at " + request.getContextPath() + "</h1>");
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
        List<String> weeks = new ArrayList<>();
       
        int totalWeeks = getNumberOfISOWeeksInYear(currentYear);
        
        
        for (int week = 1; week <= totalWeeks; week++) {
            LocalDate firstDayOfWeek = getFirstDayOfWeek(currentYear, week);
            LocalDate lastDayOfWeek = firstDayOfWeek.plusDays(6);

            String weekRange = firstDayOfWeek.getDayOfMonth() + "/" + firstDayOfWeek.getMonthValue()
                    + " To " + lastDayOfWeek.getDayOfMonth() + "/" + lastDayOfWeek.getMonthValue();
            weeks.add(weekRange);
        }

        request.setAttribute("weeks", weeks);
        request.setAttribute("currentYear", currentYear);
        request.getRequestDispatcher("createScheduleDemo.jsp").forward(request, response);
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

        String year = request.getParameter("selectYear");
        List<String> weeks = new ArrayList<>();
        int totalWeeks = getNumberOfISOWeeksInYear(Integer.parseInt(year));
        for (int week = 1; week <= totalWeeks; week++) {
            LocalDate firstDayOfWeek = getFirstDayOfWeek(Integer.parseInt(year), week);
            LocalDate lastDayOfWeek = firstDayOfWeek.plusDays(6);

            String weekRange = firstDayOfWeek.getDayOfMonth() + "/" + firstDayOfWeek.getMonthValue()
                    + " To " + lastDayOfWeek.getDayOfMonth() + "/" + lastDayOfWeek.getMonthValue();
            weeks.add(weekRange);
        }
         
        request.setAttribute("weeks", weeks);
        request.setAttribute("currentYear", year); 
        request.getRequestDispatcher("createScheduleDemo.jsp").forward(request, response);
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

    public static LocalDate getFirstDayOfWeek(int year, int week) {
        
        LocalDate firstDayOfYear = LocalDate.of(year, 1, 1);
        LocalDate firstMonday = firstDayOfYear.with(TemporalAdjusters.nextOrSame(DayOfWeek.MONDAY));
        if (firstMonday.getDayOfYear() > 4) {
            firstMonday = firstMonday.minusWeeks(1);
        }
        LocalDate firstDayOfRequestedWeek = firstMonday.plusWeeks(week - 1);
        return firstDayOfRequestedWeek;
    }
    public static void main(String[] args) {
//        int currentYear = Year.now().getValue();
//        List<String> weeks = new ArrayList<>();
//        LocalDate lastDayOfYear = LocalDate.of(currentYear, 12, 31);
//        WeekFields weekFields = WeekFields.ISO;
//        int totalWeeks = lastDayOfYear.get(weekFields.weekOfWeekBasedYear());
//        
//        
//        for (int week = 1; week <= totalWeeks; week++) {
//            LocalDate firstDayOfWeek = getFirstDayOfWeek(currentYear, week);
//            LocalDate lastDayOfWeek = firstDayOfWeek.plusDays(6);
//
//            String weekRange = firstDayOfWeek.getDayOfMonth() + "/" + firstDayOfWeek.getMonthValue()
//                    + " To " + lastDayOfWeek.getDayOfMonth() + "/" + lastDayOfWeek.getMonthValue();
//            weeks.add(weekRange);
//        }
//        for(String week: weeks){
//            System.out.println(week);
//        }
//        int year = 2026; // Thay đổi năm tùy ý
//        int totalWeeks = getNumberOfISOWeeksInYear(year);
//
//        System.out.println("Số tuần trong năm " + year + " là: " + totalWeeks);
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

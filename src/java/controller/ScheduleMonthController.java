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
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.YearMonth;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.UUID;
import model.Account;

/**
 *
 * @author asus
 */
public class ScheduleMonthController extends HttpServlet {

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
            out.println("<title>Servlet ScheduleMonthController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ScheduleMonthController at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("createSchedule.jsp").forward(request, response);
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
        Account account = (Account) session.getAttribute("account");
        if (session == null || session.getAttribute("account") == null || account.getRole().getRole_id() == 1) {
            response.sendRedirect("login.jsp");
            return;
        }

//        String start_time = request.getParameter("start_date");
//        String end_time = request.getParameter("end_date");
//        LocalDate startDate = LocalDate.parse(start_time);
//        LocalDate endDate = LocalDate.parse(end_time);
//        long daysBetween = ChronoUnit.DAYS.between(startDate, endDate);
//        if(daysBetween < 30 || daysBetween > 90){
//            request.setAttribute("message", "<span style=\"color: red;\">The min teaching schedule is 1 month and maximum is 3 months!</span>");
//            request.setAttribute("startDate", startDate);
//            request.setAttribute("endDate", endDate);
//            request.getRequestDispatcher("createSchedule.jsp").forward(request, response);
//            return;
//        }
        String month = request.getParameter("selectMonth");
        String sessionId = UUID.randomUUID().toString();
        ScheduleDAO scheduleDAO = new ScheduleDAO();
        scheduleDAO.createNewSchedule(account.getAccount_id(),"1" , LocalDateTime.now(), Integer.parseInt(month), sessionId);
        
        int schedule_id = scheduleDAO.getScheduleId(account.getAccount_id(), sessionId);
        
        LocalDate currentDate = LocalDate.now(); 
        int currentYear = currentDate.getYear();
        LocalDate[] dates = getStartAndEndDateOfMonth(currentYear, Integer.parseInt(month));
        
        
        String[] checkedValuesSlotOne = request.getParameterValues("slot_1");
        String[] checkedValuesSlotTwo = request.getParameterValues("slot_2");
        String[] checkedValuesSlotThree = request.getParameterValues("slot_3");
        String[] checkedValuesSlotFour = request.getParameterValues("slot_4");
        String[] checkedValuesSlotFive = request.getParameterValues("slot_5");
        String message = "";
        boolean check = true;
       
        
        if(checkedValuesSlotOne == null && checkedValuesSlotTwo == null && checkedValuesSlotThree == null && 
                checkedValuesSlotThree == null && checkedValuesSlotFour == null && checkedValuesSlotFive == null){
            request.setAttribute("selectMonth", month);
            request.setAttribute("message", "<span style=\"color: red;\">Add failed class schedule!</span>");
            request.getRequestDispatcher("createSchedule.jsp").forward(request, response);
            return;
        }
        

        for (LocalDate date = dates[0]; !date.isAfter(dates[1]); date = date.plusDays(1)) {
            DayOfWeek dayOfWeek = date.getDayOfWeek();
            int dayOfWeekValue = dayOfWeek.getValue();

            if (checkedValuesSlotOne != null) {
                for (String slot_day : checkedValuesSlotOne) {
                    if (dayOfWeekValue == Integer.parseInt(slot_day)) {
                        int result = scheduleDAO.createSlotOfSchedule(1, dayOfWeekValue, schedule_id, date);
                        if (result != 1) {
                            check = false;
                        }
                    }
                }
            }
            if (checkedValuesSlotTwo != null) {
                for (String slot_day : checkedValuesSlotTwo) {
                    if (dayOfWeekValue == Integer.parseInt(slot_day)) {
                        int result = scheduleDAO.createSlotOfSchedule(2, dayOfWeekValue, schedule_id, date);
                        if (result != 1) {
                            check = false;
                        }
                    }
                }
            }

            if (checkedValuesSlotThree != null) {
                for (String slot_day : checkedValuesSlotThree) {
                    if (dayOfWeekValue == Integer.parseInt(slot_day)) {
                        int result = scheduleDAO.createSlotOfSchedule(3, dayOfWeekValue, schedule_id,date);
                        if (result != 1) {
                            check = false;
                        }
                    }
                }
            }

            if (checkedValuesSlotFour != null) {
                for (String slot_day : checkedValuesSlotFour) {
                    if (dayOfWeekValue == Integer.parseInt(slot_day)) {
                        int result = scheduleDAO.createSlotOfSchedule(4, dayOfWeekValue, schedule_id, date);
                        if (result != 1) {
                            check = false;
                        }
                    }
                }
            }

            if (checkedValuesSlotFive != null) {
                for (String slot_day : checkedValuesSlotFive) {
                    if (dayOfWeekValue == Integer.parseInt(slot_day)) {
                        //insert
                        LocalDateTime currentDateTime = LocalDateTime.now();
                        int result = scheduleDAO.createSlotOfSchedule(5, dayOfWeekValue, schedule_id,date);
                        if (result != 1) {
                            check = false;
                        }
                    }
                }
            }

        }
        if(check == false){
            message = "<span style=\"color: red;\">Add failed class schedule!</span>";
        }else {
            message = "<span style=\"color: green;\">Add class schedule successfully!</span>";
            
        }
        request.setAttribute("checkedValuesOne", checkedValuesSlotOne);
        request.setAttribute("checkedValuesTwo", checkedValuesSlotTwo);
        request.setAttribute("checkedValuesThree", checkedValuesSlotThree);
        request.setAttribute("checkedValuesFour", checkedValuesSlotFour);
        request.setAttribute("checkedValuesFive", checkedValuesSlotFive);
        request.setAttribute("selectMonth", month);
        request.setAttribute("message", message);
        request.getRequestDispatcher("createSchedule.jsp").forward(request, response);

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
    
    public static LocalDate[] getStartAndEndDateOfMonth(int year, int month) {
        YearMonth yearMonth = YearMonth.of(year, month);
        
        LocalDate startOfMonth = yearMonth.atDay(1);
        LocalDate endOfMonth = yearMonth.atEndOfMonth();
        
        return new LocalDate[]{startOfMonth, endOfMonth};
    }
    

}

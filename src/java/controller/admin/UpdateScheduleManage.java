
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import static controller.ScheduleController.getFirstDayOfWeek;
import static controller.UpdateScheduleController.getNumberOfISOWeeksInYear;
import dao.NotificationScheduleDAO;
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
import java.time.Year;
import java.time.temporal.WeekFields;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Account;
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

        int currentYear = Year.now().getValue();
        WeekFields weekFields = WeekFields.ISO;
        List<String> weeks = new ArrayList<>();
        LocalDate currentDate = LocalDate.now();
        int isoWeek = currentDate.get(WeekFields.ISO.weekOfWeekBasedYear());
        LocalDate firstDayOfWeek_2 = LocalDate.of(currentYear, 1, 1)
                .with(WeekFields.ISO.weekOfWeekBasedYear(), isoWeek)
                .with(DayOfWeek.MONDAY);
        String[] weekDates = new String[7];
        for (int i = 0; i < 7; i++) {
            weekDates[i] = firstDayOfWeek_2.plusDays(i).toString();
        }
        int totalWeeks = getNumberOfISOWeeksInYear(currentYear);
        for (int week = 1; week <= totalWeeks; week++) {
            LocalDate firstDayOfWeek = getFirstDayOfWeek(currentYear, week);
            LocalDate lastDayOfWeek = firstDayOfWeek.plusDays(6);

            String weekRange = String.format("%02d/%02d To %02d/%02d",
                    firstDayOfWeek.getDayOfMonth(), firstDayOfWeek.getMonthValue(),
                    lastDayOfWeek.getDayOfMonth(), lastDayOfWeek.getMonthValue());
            weeks.add(weekRange);
        }
        List<Slot> slots = scheduleDAO.getAllSlotByDates(Integer.parseInt(schedule_id), firstDayOfWeek_2.toString(), firstDayOfWeek_2.plusDays(6).toString());
        int status = scheduleDAO.getStatusOfSchedule(Integer.parseInt(schedule_id));
        
        request.setAttribute("status", status);
        request.setAttribute("slots", slots);
        request.setAttribute("weekDates", weekDates);
        request.setAttribute("isoWeek", isoWeek);
        request.setAttribute("weeks", weeks);
        request.setAttribute("currentYear", currentYear);
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
        HttpSession session = request.getSession(false);
        Account manager = (Account) session.getAttribute("ad_acc");
        if (session.getAttribute("ad_acc") == null || manager.getRole().getRole_id() == 3 || manager.getRole().getRole_id() == 2
                || manager.getRole().getRole_id() == 1) {
            response.sendRedirect("login.jsp");
            return;
        }
        String action = request.getParameter("action");
        if (action.equals("update_week")) {
            String weekValue = request.getParameter("selectedWeek");
            String currentYear = request.getParameter("value_year");
            String schedule_id = request.getParameter("schedule_id");
            String month = request.getParameter("month_form_updateweek");
            String accountId = request.getParameter("accountId_updateweek");

            int week = Integer.parseInt(weekValue);
            int year = Integer.parseInt(currentYear);
            LocalDate firstDayOfWeek = LocalDate.of(year, 1, 1)
                    .with(WeekFields.ISO.weekOfWeekBasedYear(), week)
                    .with(DayOfWeek.MONDAY);
            String[] weekDates = new String[7];
            for (int i = 0; i < 7; i++) {
                weekDates[i] = firstDayOfWeek.plusDays(i).toString();
            }
            List<String> weeks = new ArrayList<>();
            int totalWeeks_2 = getNumberOfISOWeeksInYear(Integer.parseInt(currentYear));
            for (int week_2 = 1; week_2 <= totalWeeks_2; week_2++) {
                LocalDate firstDayOfWeek_2 = getFirstDayOfWeek(Integer.parseInt(currentYear), week_2);
                LocalDate lastDayOfWeek_2 = firstDayOfWeek_2.plusDays(6);

                String weekRange = String.format("%02d/%02d To %02d/%02d",
                        firstDayOfWeek_2.getDayOfMonth(), firstDayOfWeek_2.getMonthValue(),
                        lastDayOfWeek_2.getDayOfMonth(), lastDayOfWeek_2.getMonthValue());
                weeks.add(weekRange);
            }
            List<Slot> slots = new ArrayList<>();
            ScheduleDAO scheduleDAO = new ScheduleDAO();
            String firstDay = firstDayOfWeek.toString();
            String endDay = firstDayOfWeek.plusDays(6).toString();
            slots = scheduleDAO.getAllSlotByDates(Integer.parseInt(schedule_id), firstDay, endDay);
            int status = scheduleDAO.getStatusOfSchedule(Integer.parseInt(schedule_id));
            
            request.setAttribute("status", status);
            request.setAttribute("month", month);
            request.setAttribute("weeks", weeks);
            request.setAttribute("schedule_id", schedule_id);
            request.setAttribute("slots", slots);
            request.setAttribute("accountId", accountId);
            request.setAttribute("isoWeek", week);
            request.setAttribute("currentYear", Integer.parseInt(currentYear));
            request.setAttribute("weekDates", weekDates);
        }
        if (action.equals("update_schedule")) {
            String accountId = request.getParameter("accountId_update_schedule");
            String schedule_id = request.getParameter("schedule_id_update_schedule");
            String weekValue = request.getParameter("isoWeek_update_schedule");
            String month = request.getParameter("month_update_schedule");
            String note = request.getParameter("note");
            String button_action = request.getParameter("button_action");
            
            String message = "";
            boolean check = true;
            ScheduleDAO scheduleDAO = new ScheduleDAO();
            NotificationScheduleDAO notificationDAO = new NotificationScheduleDAO();

            if (button_action.equals("accept")) {
                if (scheduleDAO.updateScheduleAcceptByMentorId(Integer.parseInt(schedule_id)) == 0) {
                    message = "<span style='color:green;'>Accept failed!</span>";
                } else {
                    message = "<span style='color:green;'>Accept successful!</span>";
                }
                if (notificationDAO.checkNotificationScheduleExist(Integer.parseInt(accountId), manager.getAccount_id(), Integer.parseInt(schedule_id)) == null) {
//                    notificationDAO.createNotificationSchedule(Integer.parseInt(accountId), manager.getAccount_id(), note, LocalDate.now(), Integer.parseInt(schedule_id));
                      notificationDAO.createNotificationSchedule(Integer.parseInt(accountId), manager.getAccount_id(), note, LocalDate.now(), Integer.parseInt(schedule_id));
                } else {
                    notificationDAO.updateNotificationSchedule(Integer.parseInt(accountId), manager.getAccount_id(), Integer.parseInt(schedule_id), note, LocalDate.now());
                }
                
            }else if (button_action.equals("reject")) {
                if (scheduleDAO.updateScheduleRejectByMentorId(Integer.parseInt(schedule_id)) == 0) {
                    message = "<span style='color:red;'>Reject failed!</span>";
                } else {
                    message = "<span style='color:red;'>Reject successful!</span>";
                }
                if (notificationDAO.checkNotificationScheduleExist(Integer.parseInt(accountId), manager.getAccount_id(), Integer.parseInt(schedule_id)) == null) {
                    notificationDAO.createNotificationSchedule(Integer.parseInt(accountId), manager.getAccount_id(), note, LocalDate.now(), Integer.parseInt(schedule_id));
                } else {
                    notificationDAO.updateNotificationSchedule(Integer.parseInt(accountId), manager.getAccount_id(), Integer.parseInt(schedule_id), note, LocalDate.now());
                }
                
            }
            
            LocalDate startOfWeek = LocalDate.of(2024, 1, 1)
                    .with(WeekFields.ISO.weekOfWeekBasedYear(), Integer.parseInt(weekValue))
                    .with(DayOfWeek.MONDAY);
            LocalDate endOfWeek = startOfWeek.plusDays(6);
            
            List<Slot> slots = new ArrayList<>();
            slots = scheduleDAO.getAllSlotByDates(Integer.parseInt(schedule_id), startOfWeek.toString(), endOfWeek.toString());
            
            String[] weekDates = new String[7];
            for (int i = 0; i < 7; i++) {
                weekDates[i] = startOfWeek.plusDays(i).toString();
            }
            
            List<String> weeks = new ArrayList<>();
            int totalWeeks_2 = getNumberOfISOWeeksInYear(2024);
            for (int week_2 = 1; week_2 <= totalWeeks_2; week_2++) {
                LocalDate firstDayOfWeek_2 = getFirstDayOfWeek(2024, week_2);
                LocalDate lastDayOfWeek_2 = firstDayOfWeek_2.plusDays(6);

                String weekRange = String.format("%02d/%02d To %02d/%02d",
                        firstDayOfWeek_2.getDayOfMonth(), firstDayOfWeek_2.getMonthValue(),
                        lastDayOfWeek_2.getDayOfMonth(), lastDayOfWeek_2.getMonthValue());
                weeks.add(weekRange);
            }
            int status = scheduleDAO.getStatusOfSchedule(Integer.parseInt(schedule_id));
            
            request.setAttribute("status", status);
            request.setAttribute("slots", slots);
            request.setAttribute("note", note);
            request.setAttribute("message", message);
            request.setAttribute("weekDates", weekDates);
            request.setAttribute("isoWeek", Integer.parseInt(weekValue));
            request.setAttribute("schedule_id", schedule_id);
            request.setAttribute("weeks", weeks);
            request.setAttribute("month", month);
            request.setAttribute("accountId", accountId);
        }

//        String accountId = request.getParameter("account_id");
//        String sessionId = request.getParameter("session_id");
//        
//        String note = request.getParameter("note");
//        String schedule_id = request.getParameter("schedule_id");
//        String message = "";
//        boolean check = true;
//
//        ScheduleDAO scheduleDAO = new ScheduleDAO();
//        NotificationScheduleDAO notificationDAO = new NotificationScheduleDAO();
//        List<Slot> slots = scheduleDAO.getAllDayOfSlot(Integer.parseInt(schedule_id));
//
//
//        if (action.equals("accept")) {
//            if (scheduleDAO.updateScheduleAcceptByMentorId(Integer.parseInt(schedule_id)) == 0) {
//                message = "<span style='color:green;'>Accept failed!</span>";
//            } else {
//                message = "<span style='color:green;'>Accept successful!</span>";
//            }
//            if(notificationDAO.checkNotificationScheduleExist(Integer.parseInt(accountId), manager.getAccount_id(), Integer.parseInt(schedule_id)) == null){ 
//               notificationDAO.createNotificationSchedule(Integer.parseInt(accountId), manager.getAccount_id(), note, LocalDate.now(), Integer.parseInt(schedule_id));  
//            }else{
//                notificationDAO.updateNotificationSchedule(Integer.parseInt(accountId),manager.getAccount_id(), Integer.parseInt(schedule_id), note, LocalDate.now());
//            }
//            
//
//        } else if (action.equals("reject")) {
//            if (scheduleDAO.updateScheduleRejectByMentorId(Integer.parseInt(schedule_id)) == 0) {
//                message = "<span style='color:red;'>Reject failed!</span>";
//            } else {
//                message = "<span style='color:red;'>Reject successful!</span>";
//            }
//            if(notificationDAO.checkNotificationScheduleExist(Integer.parseInt(accountId), manager.getAccount_id(), Integer.parseInt(schedule_id)) == null){ 
//               notificationDAO.createNotificationSchedule(Integer.parseInt(accountId), manager.getAccount_id(), note, LocalDate.now(), Integer.parseInt(schedule_id));  
//            }else{
//                notificationDAO.updateNotificationSchedule(Integer.parseInt(accountId),manager.getAccount_id(), Integer.parseInt(schedule_id), note, LocalDate.now());
//            }
//            
//        }
//        
//
//        
////        request.setAttribute("sessionId", sessionId);
////        request.setAttribute("message", message);
//        request.setAttribute("accountId", accountId);
//        request.setAttribute("note", note);
//        request.setAttribute("schedule_id", schedule_id);
//        request.setAttribute("message", message);
//        request.setAttribute("slots", slots);
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

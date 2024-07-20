/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import static controller.ScheduleController.getFirstDayOfWeek;
import static controller.UpdateScheduleController.getNumberOfISOWeeksInYear;
import dao.AccountDAO;
import dao.CVDAO;
import dao.ScheduleDAO;
import dao.SkillDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.Year;
import java.time.temporal.WeekFields;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.CV;
import model.Schedule;
import model.Skill;
import model.Slot;

/**
 *
 * @author asus
 */
public class BookingScheduleController extends HttpServlet {

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
            out.println("<title>Servlet BookingScheduleController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingScheduleController at " + request.getContextPath() + "</h1>");
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
        Account acc = new AccountDAO().getAccountByAccId(request.getParameter("mentorId"));
        int phoneInt = acc.getPhone();
        String phone = String.valueOf(phoneInt);
        if (!phone.startsWith("0")) {
            phone = "0" + phone;
        }
        CV cv = new CVDAO().getCVByAccId(request.getParameter("mentorId"));
        ArrayList<Skill> listS = new SkillDAO().getSkillByCvId(request.getParameter("cvId"));

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
        ScheduleDAO scheduleDAO = new ScheduleDAO();
        Schedule schedule = scheduleDAO.getLastestSchedule(acc.getAccount_id());
        if(schedule == null){ 
            request.setAttribute("check", false);
        }else {
            String scheduleId = String.valueOf(schedule.getId());
            String month = String.valueOf(schedule.getMonth());
            List<Slot> slots = scheduleDAO.getAllSlotByDates(schedule.getId(), firstDayOfWeek_2.toString(), firstDayOfWeek_2.plusDays(6).toString());
            request.setAttribute("check", true);
            request.setAttribute("scheduleId", scheduleId);
            request.setAttribute("slots", slots);
            request.setAttribute("month", month);
        }
        
        request.setAttribute("mentor", acc);
        request.setAttribute("mentorId", acc.getAccount_id());
        request.setAttribute("phone", phone);
        request.setAttribute("mentor_cv", cv);
        request.setAttribute("listS", listS);
        request.setAttribute("accountId", String.valueOf(acc.getAccount_id()));
        request.setAttribute("weekDates", weekDates);
        request.setAttribute("isoWeek", isoWeek);
        request.setAttribute("weeks", weeks);
        request.setAttribute("currentYear", currentYear);
        request.getRequestDispatcher("course_details.jsp").forward(request, response);
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
        if (action.equals("update_year")) {
            String selectYear = request.getParameter("selectYear");
            String[] weekDates = new String[7];
            if (Integer.parseInt(selectYear) == 2023) {
                weekDates[0] = "2023-01-02";
                weekDates[1] = "2023-01-03";
                weekDates[2] = "2023-01-04";
                weekDates[3] = "2023-01-05";
                weekDates[4] = "2023-01-06";
                weekDates[5] = "2023-01-07";
                weekDates[6] = "2023-01-08";
            } else if (Integer.parseInt(selectYear) == 2025) {
                weekDates[0] = "2025-12-30";
                weekDates[1] = "2025-12-31";
                weekDates[2] = "2025-01-01";
                weekDates[3] = "2025-01-02";
                weekDates[4] = "2025-01-03";
                weekDates[5] = "2025-01-04";
                weekDates[6] = "2025-01-05";
            } else if (Integer.parseInt(selectYear) == 2026) {
                weekDates[0] = "2026-12-29";
                weekDates[1] = "2026-12-30";
                weekDates[2] = "2026-12-31";
                weekDates[3] = "2026-01-01";
                weekDates[4] = "2026-01-02";
                weekDates[5] = "2026-01-03";
                weekDates[6] = "2026-01-04";
            }
            List<String> weeks = new ArrayList<>();
            int totalWeeks = getNumberOfISOWeeksInYear(Integer.parseInt(selectYear));
            String schedule_id = request.getParameter("scheduleId");
            for (int week = 1; week <= totalWeeks; week++) {
                LocalDate firstDayOfWeek = getFirstDayOfWeek(Integer.parseInt(selectYear), week);
                LocalDate lastDayOfWeek = firstDayOfWeek.plusDays(6);

                String weekRange = String.format("%02d/%02d To %02d/%02d",
                        firstDayOfWeek.getDayOfMonth(), firstDayOfWeek.getMonthValue(),
                        lastDayOfWeek.getDayOfMonth(), lastDayOfWeek.getMonthValue());
                weeks.add(weekRange);
            }
            if (Integer.parseInt(selectYear) == LocalDate.now().getYear()) {
                LocalDate currentDate = LocalDate.now();
                int isoWeek = currentDate.get(WeekFields.ISO.weekOfWeekBasedYear());
                LocalDate firstDayOfWeek = LocalDate.of(Integer.parseInt(selectYear), 1, 1)
                        .with(WeekFields.ISO.weekOfWeekBasedYear(), isoWeek)
                        .with(DayOfWeek.MONDAY);
                for (int i = 0; i < 7; i++) {
                    weekDates[i] = firstDayOfWeek.plusDays(i).toString();
                }
                request.setAttribute("isoWeek", isoWeek);
            } else {
                request.setAttribute("isoWeek", 1);
            }
            String month = request.getParameter("month_form_updateyear");
            String accountId = request.getParameter("accountId");
            String mentorId = request.getParameter("mentorId_form_updateyear");
            String phone = (String) request.getAttribute("phone");
            Account acc = new AccountDAO().getAccountByAccId(mentorId);
            CV cv = new CVDAO().getCVByAccId(mentorId);
            ArrayList<Skill> listS = new SkillDAO().getSkillByCvId(cv.getId());

            request.setAttribute("mentor", acc);
            request.setAttribute("mentorId", acc.getAccount_id());
            request.setAttribute("phone", phone);
            request.setAttribute("listS", listS);
            request.setAttribute("mentor_cv", cv);
            request.setAttribute("accountId", accountId);
            request.setAttribute("weeks", weeks);
            request.setAttribute("month", month);
            request.setAttribute("scheduleId", schedule_id);
            request.setAttribute("weekDates", weekDates);
            request.setAttribute("currentYear", Integer.parseInt(selectYear));

        }
        if (action.equals("update_week")) {
            String weekValue = request.getParameter("selectedWeek");
            String currentYear = request.getParameter("value_year");
            String schedule_id = request.getParameter("schedule_id");
            String month = request.getParameter("month_form_updateweek");

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

            String accountId = request.getParameter("accountId");
            
            String mentorId = request.getParameter("mentorId_form_updateweek");
            String phone = request.getParameter("phone_form_updateweek");
            Account acc = new AccountDAO().getAccountByAccId(mentorId);
            CV cv = new CVDAO().getCVByAccId(mentorId);
            ArrayList<Skill> listS = new SkillDAO().getSkillByCvId(cv.getId());

            request.setAttribute("mentor", acc);
            request.setAttribute("mentorId", acc.getAccount_id());
            request.setAttribute("phone", phone);
            request.setAttribute("mentor_cv", cv);
            request.setAttribute("accountId", accountId);
            request.setAttribute("month", month);
            request.setAttribute("listS", listS);
            request.setAttribute("weeks", weeks);
            request.setAttribute("scheduleId", schedule_id);
            request.setAttribute("slots", slots);
            request.setAttribute("isoWeek", week);
            request.setAttribute("currentYear", Integer.parseInt(currentYear));
            request.setAttribute("weekDates", weekDates);
        }
        
        request.getRequestDispatcher("course_details.jsp").forward(request, response);
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

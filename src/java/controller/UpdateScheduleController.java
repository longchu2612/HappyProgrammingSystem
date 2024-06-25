/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import static controller.ScheduleController.getFirstDayOfWeek;
import static controller.ScheduleController.getNumberOfISOWeeksInYear;
import dao.ScheduleDAO;
import dao.SlotDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Year;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.time.temporal.WeekFields;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import java.util.UUID;
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

        String scheduleId = request.getParameter("scheduleId");
        String month = request.getParameter("month");
        ScheduleDAO scheduleDAO = new ScheduleDAO();
        List<Slot> slots = scheduleDAO.getAllSlotByDates(Integer.parseInt(scheduleId), firstDayOfWeek_2.toString(), firstDayOfWeek_2.plusDays(6).toString());
        String accountId = request.getParameter("accountId");
        request.setAttribute("accountId", accountId);
        request.setAttribute("weekDates", weekDates);
        request.setAttribute("isoWeek", isoWeek);
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

            HttpSession session = request.getSession();
            Integer scheduleDraft = (Integer) session.getAttribute("scheduleDraft");

            session.setMaxInactiveInterval(900);

            if (scheduleDraft == null) {
                ScheduleDAO schedule_dao = new ScheduleDAO();
                String sessionId = UUID.randomUUID().toString();
                int mentorId = schedule_dao.getMentorIdByScheduleId(Integer.parseInt(schedule_id));
                schedule_dao.createNewSchedule(mentorId, "4", LocalDateTime.now(), Integer.parseInt(month), sessionId);
                scheduleDraft = schedule_dao.getScheduleId(mentorId, sessionId);

                session.setAttribute("scheduleDraft", scheduleDraft);
            }

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

            List<Slot> slots_2 = scheduleDAO.getAllSlotByDates(scheduleDraft, firstDay, endDay);

            if (slots_2.size() == 0) {

                slots = scheduleDAO.getAllSlotByDates(Integer.parseInt(schedule_id), firstDay, endDay);
            } else {
                slots = scheduleDAO.getAllSlotByDates(scheduleDraft, firstDay, endDay);
            }

            String accountId = request.getParameter("accountId");
            request.setAttribute("accountId", accountId);
            request.setAttribute("month", month);
            request.setAttribute("weeks", weeks);
            request.setAttribute("scheduleId", schedule_id);
            request.setAttribute("slots", slots);
            request.setAttribute("isoWeek", week);
            request.setAttribute("currentYear", Integer.parseInt(currentYear));
            request.setAttribute("weekDates", weekDates);

        }
        if (action.equals("update_schedule_week")) {
            boolean check = true;
            ScheduleDAO scheduleDAO = new ScheduleDAO();
            String month = request.getParameter("month_update_schedule");
            String year = request.getParameter("year_update_schedule");
            String weekValue = request.getParameter("week_update_schedule");
            String schedule_id = request.getParameter("schedule_id_schedule");

            String message = "";
            LocalDate startOfWeek = LocalDate.of(Integer.parseInt(year), 1, 1)
                    .with(WeekFields.ISO.weekOfWeekBasedYear(), Integer.parseInt(weekValue))
                    .with(DayOfWeek.MONDAY);
            LocalDate endOfWeek = startOfWeek.plusDays(6);

            boolean isWeekContainingMonth = false;
            LocalDate currentDay = startOfWeek;
            while (currentDay.isBefore(endOfWeek.plusDays(1))) { // plusDays(1) để bao gồm cả ngày kết thúc
                if (currentDay.getMonthValue() == 5) {
                    isWeekContainingMonth = true;
                    break;
                }
                currentDay = currentDay.plusDays(1);
            }

            HttpSession session = request.getSession();
            Integer scheduleDraft = (Integer) session.getAttribute("scheduleDraft");

            session.setMaxInactiveInterval(900);

            if (scheduleDraft == null) {
                ScheduleDAO schedule_dao = new ScheduleDAO();
                String sessionId = UUID.randomUUID().toString();
                int mentorId = schedule_dao.getMentorIdByScheduleId(Integer.parseInt(schedule_id));
                schedule_dao.createNewSchedule(mentorId, "4", LocalDateTime.now(), Integer.parseInt(month), sessionId);
                scheduleDraft = schedule_dao.getScheduleId(mentorId, sessionId);

                session.setAttribute("scheduleDraft", scheduleDraft);
            }

            if (isWeekContainingMonth) {

                String[] checkedValuesSlotOne = request.getParameterValues("slot_1");
                String[] checkedValuesSlotTwo = request.getParameterValues("slot_2");
                String[] checkedValuesSlotThree = request.getParameterValues("slot_3");
                String[] checkedValuesSlotFour = request.getParameterValues("slot_4");
                String[] checkedValuesSlotFive = request.getParameterValues("slot_5");

                String button_action = request.getParameter("button_action");

                if ("draft".equals(button_action)) {

                    if (checkedValuesSlotOne == null && checkedValuesSlotTwo == null && checkedValuesSlotThree == null
                            && checkedValuesSlotThree == null && checkedValuesSlotFour == null && checkedValuesSlotFive == null) {

                    } else {
                        SlotDAO slotDAO = new SlotDAO();
                        slotDAO.deleteSchedule(scheduleDraft, startOfWeek.toString(), endOfWeek.toString());
                        for (LocalDate date = startOfWeek; !date.isAfter(endOfWeek); date = date.plusDays(1)) {
                            DayOfWeek dayOfWeek = date.getDayOfWeek();
                            int dayOfWeekValue = dayOfWeek.getValue();
                            if (checkedValuesSlotOne != null) {
                                for (String slot_day : checkedValuesSlotOne) {
                                    if (dayOfWeekValue == Integer.parseInt(slot_day)) {
                                        int result = scheduleDAO.createSlotOfSchedule(1, dayOfWeekValue, scheduleDraft, date);
                                        if (result != 1) {
                                            check = false;
                                        }
                                    }
                                }
                            }
                            if (checkedValuesSlotTwo != null) {
                                for (String slot_day : checkedValuesSlotTwo) {
                                    if (dayOfWeekValue == Integer.parseInt(slot_day)) {
                                        int result = scheduleDAO.createSlotOfSchedule(2, dayOfWeekValue, scheduleDraft, date);
                                        if (result != 1) {
                                            check = false;
                                        }
                                    }
                                }
                            }
                            if (checkedValuesSlotThree != null) {
                                for (String slot_day : checkedValuesSlotThree) {
                                    if (dayOfWeekValue == Integer.parseInt(slot_day)) {
                                        int result = scheduleDAO.createSlotOfSchedule(3, dayOfWeekValue, scheduleDraft, date);
                                        if (result != 1) {
                                            check = false;
                                        }
                                    }
                                }
                            }
                            if (checkedValuesSlotFour != null) {
                                for (String slot_day : checkedValuesSlotFour) {
                                    if (dayOfWeekValue == Integer.parseInt(slot_day)) {
                                        int result = scheduleDAO.createSlotOfSchedule(4, dayOfWeekValue, scheduleDraft, date);
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
                                        int result = scheduleDAO.createSlotOfSchedule(5, dayOfWeekValue, scheduleDraft, date);
                                        if (result != 1) {
                                            check = false;
                                        }
                                    }
                                }
                            }

                        }
                    }
                    if (check == false) {
                        message = "Add failed to draft!";
                    } else {
                        message = "Add Draft successfully!";
                    }

                } else if ("update".equals(button_action)) {
                    boolean checkUpdate = true;
                    if (scheduleDraft == null || scheduleDAO.getAllSlotByScheduleId(scheduleDraft) == null) {
                        
                    }
                    
                        List<Slot> slots = scheduleDAO.getAllSlotByScheduleId(scheduleDraft);
                        SlotDAO slotDAO = new SlotDAO();
                        slotDAO.deleteSchedule(Integer.parseInt(schedule_id));

                        for (Slot slot : slots) {
                            int result = scheduleDAO.createSlotOfSchedule(slot.getSlot(), slot.getDayOfWeek(), Integer.parseInt(schedule_id), slot.getTeach_date());
                            if (result != 1) {
                                checkUpdate = false;
                            }
                        }
                        if (checkUpdate) {
                            message = "Update schedule succesfully";
                            scheduleDAO.updateSchedulePendingByMentorId(Integer.parseInt(schedule_id));
                            session.removeAttribute("scheduleDraft");
                            session.setMaxInactiveInterval(0);
                        } else {
                            message = "Update schedule failed";
                        }
                }
            } else {

                message = "This week is not selected!";

            }

            List<Slot> slots = new ArrayList<>();
            if (scheduleDraft != null) {
                if (scheduleDAO.getAllSlotByDates(scheduleDraft, startOfWeek.toString(), endOfWeek.toString()) != null) {
                    slots = scheduleDAO.getAllSlotByDates(scheduleDraft, startOfWeek.toString(), endOfWeek.toString());
                } else {
                    slots = scheduleDAO.getAllSlotByDates(Integer.parseInt(schedule_id), startOfWeek.toString(), endOfWeek.toString());
                }
            } else {
                slots = scheduleDAO.getAllSlotByDates(Integer.parseInt(schedule_id), startOfWeek.toString(), endOfWeek.toString());
            }

            String[] weekDates = new String[7];
            for (int i = 0; i < 7; i++) {
                weekDates[i] = startOfWeek.plusDays(i).toString();
            }

            List<String> weeks = new ArrayList<>();
            int totalWeeks_2 = getNumberOfISOWeeksInYear(Integer.parseInt(year));
            for (int week_2 = 1; week_2 <= totalWeeks_2; week_2++) {
                LocalDate firstDayOfWeek_2 = getFirstDayOfWeek(Integer.parseInt(year), week_2);
                LocalDate lastDayOfWeek_2 = firstDayOfWeek_2.plusDays(6);

                String weekRange = String.format("%02d/%02d To %02d/%02d",
                        firstDayOfWeek_2.getDayOfMonth(), firstDayOfWeek_2.getMonthValue(),
                        lastDayOfWeek_2.getDayOfMonth(), lastDayOfWeek_2.getMonthValue());
                weeks.add(weekRange);
            }
            request.setAttribute("message", message);
            request.setAttribute("weekDates", weekDates);
            request.setAttribute("slots", slots);
            request.setAttribute("isoWeek", Integer.parseInt(weekValue));
            request.setAttribute("scheduleId", schedule_id);
            request.setAttribute("weeks", weeks);
            request.setAttribute("month", month);
            request.setAttribute("currentYear", Integer.parseInt(year));
        }

        request.getRequestDispatcher(
                "updatesSchedule.jsp").forward(request, response);
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
        LocalDate startOfWeek = LocalDate.of(2024, 1, 1)
                .with(WeekFields.ISO.weekOfWeekBasedYear(), 24)
                .with(DayOfWeek.MONDAY);
        LocalDate endOfWeek = startOfWeek.plusDays(6);

        boolean isWeekContainingMonth = false;
        LocalDate currentDay = startOfWeek;
        while (currentDay.isBefore(endOfWeek.plusDays(1))) { // plusDays(1) để bao gồm cả ngày kết thúc
            if (currentDay.getMonthValue() == 5) {
                isWeekContainingMonth = true;
                break;
            }
            currentDay = currentDay.plusDays(1);
        }

        if (isWeekContainingMonth) {
            System.out.println("OK");
        } else {
            System.out.println("Not OKs");
        }
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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import static controller.ScheduleController.getFirstDayOfWeek;
import static controller.UpdateScheduleController.getNumberOfISOWeeksInYear;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.*;
import java.util.*;
import model.*;
import dao.*;
import java.text.ParseException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Year;
import java.time.format.DateTimeFormatter;
import java.time.temporal.WeekFields;

public class RequestController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String service = request.getParameter("service");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        RequestDAO daoReq = new RequestDAO();
        OrderDAO daoOrder = new OrderDAO();
        if (account != null) {
            switch (service) {
                case "list_request" -> {

                    int roleId = account.getRole().getRole_id();
                    switch (roleId) {
                        case 1 -> {
                            ArrayList<Request> listRq = daoReq.getRequestByCreateBy(account.getAccount_id());
                            request.setAttribute("listRq", listRq);
                            request.getRequestDispatcher("list-request.jsp").forward(request, response);
                        }
                        case 2 -> {
                        }
                        default -> {
                        }
                    }
                }
                case "create_request" -> {
                    Account acc = new AccountDAO().getAccountByAccId(request.getParameter("mentorId"));
                    CV cv = new CVDAO().getCVByAccId(request.getParameter("mentorId"));
                    ArrayList<Skill> listS = new SkillDAO().getSkillByCvId(request.getParameter("cvId"));
                    Request req = daoReq.checkRequestDraft(account.getAccount_id(), acc.getAccount_id());
                    if (req == null) {
                        request.setAttribute("acc", acc);
                        request.setAttribute("cv", cv);
                        request.setAttribute("listS", listS);
                        request.getRequestDispatcher("request-booking.jsp").forward(request, response);
                    } else {
                        response.sendRedirect("alert-request.jsp");
                    }

                }

                case "update" -> {

                }
                default -> {
                }
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        Account acc = new AccountDAO().getAccountByAccId(request.getParameter("mentorId"));
        CV cv = new CVDAO().getCVByAccId(request.getParameter("mentorId"));
        ArrayList<Skill> listS = new SkillDAO().getSkillByCvId(request.getParameter("cvId"));
        String cvId = request.getParameter("cvId");

        // Schedule
        String accountId = request.getParameter("mentorId");
        //Back to Create Request
        String title = (String) request.getParameter("title");
        String content = (String) request.getParameter("content");
        String deadline = (String) request.getParameter("deadline");
        String skill = (String) request.getParameter("skill");
        if (title != null) {
            request.setAttribute("title", title);
        }
        if (content != null) {
            request.setAttribute("content", content);
        }
        if (deadline != null) {
            request.setAttribute("deadline", deadline);
        }
        if (skill != null) {
            request.setAttribute("skill", skill);
        }

        request.setAttribute("accountId", accountId);
        request.setAttribute("acc", acc);
        request.setAttribute("cv", cv);
        request.setAttribute("listS", listS);
        request.setAttribute("cvId", cvId);

        request.getRequestDispatcher("request-booking.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        processRequest(request, response);
        String action = request.getParameter("action");
        if (action.equals("create_request")) {
            String title = request.getParameter("title");
            String skill = request.getParameter("skills");
            String deadline = request.getParameter("deadline");
            String content = request.getParameter("content");
            String cvId = request.getParameter("cvId_form_createRequest");
            String mentorId = request.getParameter("mentorId_form_createRequest");
            ArrayList<Skill> listS = new SkillDAO().getSkillByCvId(cvId);
            String button_action = request.getParameter("button_action");

            boolean isFormFilled = true;

            if (title == null || title.isEmpty()
                    || skill == null || skill.isEmpty()
                    || deadline == null || deadline.isEmpty()
                    || content == null || content.isEmpty()) {
                isFormFilled = false;
            }

            if (button_action.equals("save")) {
                if (!isFormFilled) {
                    request.setAttribute("errorMessage", "Please fill in the request information completely.");
                    request.setAttribute("title", title);
                    request.setAttribute("skill", skill);
                    request.setAttribute("deadline", deadline);
                    request.setAttribute("content", content);
                    request.setAttribute("cvId", cvId);
                    request.setAttribute("accountId", mentorId);
                    request.setAttribute("listS", listS);
                } else {
                    HttpSession session = request.getSession();
                    Account account = (Account) session.getAttribute("account");
                    Request req = new Request();
                    req.setTitle(title);
                    req.setContent(content);
                    req.setDeadline(LocalDateTime.parse(deadline));
                    req.setCreatedBy(account.getAccount_id());
                    req.setCreatedDate(LocalDateTime.now());
                    session.setAttribute("request", req);
                    session.setAttribute("skill", skill);

                    request.setAttribute("errorMessage", "Saved");
                    request.setAttribute("title", title);
                    request.setAttribute("skill", skill);
                    request.setAttribute("deadline", deadline);
                    request.setAttribute("content", content);
                    request.setAttribute("cvId", cvId);
                    request.setAttribute("accountId", mentorId);
                    request.setAttribute("listS", listS);
                }
            } else if (button_action.equals("create_schedule")) {
                HttpSession session = request.getSession();
                Request req = (Request) session.getAttribute("request");
                if (req != null) {

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
                    Schedule schedule = scheduleDAO.getLastestSchedule(Integer.parseInt(mentorId));
                    String scheduleId = String.valueOf(schedule.getId());
                    String month = String.valueOf(schedule.getMonth());
                    List<Slot> slots = scheduleDAO.getAllSlotByDates(schedule.getId(), firstDayOfWeek_2.toString(), firstDayOfWeek_2.plusDays(6).toString());
                    request.setAttribute("isFormFilled", isFormFilled);
                    request.setAttribute("scheduleId", scheduleId);
                    request.setAttribute("errorMessage", "");
                    request.setAttribute("slots", slots);
                    request.setAttribute("month", month);
                    request.setAttribute("accountId", mentorId);
                    request.setAttribute("weekDates", weekDates);
                    request.setAttribute("isoWeek", isoWeek);
                    request.setAttribute("weeks", weeks);
                    request.setAttribute("currentYear", currentYear);

                } else {
                    request.setAttribute("errorMessage", "You have not entered data for the request.");
                    request.setAttribute("accountId", mentorId);
                    request.setAttribute("cvId", cvId);
                    request.setAttribute("listS", listS);

                }

            }
        }
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
            request.setAttribute("isFormFilled", true);
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
            ScheduleDAO scheduleDAO = new ScheduleDAO();
            List<Slot> slots = new ArrayList<>();
            String firstDay = firstDayOfWeek.toString();
            String endDay = firstDayOfWeek.plusDays(6).toString();
            slots = scheduleDAO.getAllSlotByDates(Integer.parseInt(schedule_id), firstDay, endDay);

            request.setAttribute("month", month);
            request.setAttribute("weeks", weeks);
            request.setAttribute("scheduleId", Integer.parseInt(schedule_id));
            request.setAttribute("slots", slots);
            request.setAttribute("isoWeek", week);
            request.setAttribute("isFormFilled", true);
            request.setAttribute("currentYear", Integer.parseInt(currentYear));
            request.setAttribute("weekDates", weekDates);
        }
        if (action.equals("choose_schedule_week")) {
            ScheduleDAO scheduleDAO = new ScheduleDAO();
            String month = request.getParameter("month_update_schedule");
            String year = request.getParameter("year_update_schedule");
            String weekValue = request.getParameter("week_update_schedule");
            String schedule_id = request.getParameter("schedule_id_schedule");

            String[] checkedValuesSlotOne = request.getParameterValues("slot_1");
            String[] checkedValuesSlotTwo = request.getParameterValues("slot_2");
            String[] checkedValuesSlotThree = request.getParameterValues("slot_3");
            String[] checkedValuesSlotFour = request.getParameterValues("slot_4");
            String[] checkedValuesSlotFive = request.getParameterValues("slot_5");
            
            HttpSession session = request.getSession();

            String messageSchedule = "";
            LocalDate startOfWeek = LocalDate.of(Integer.parseInt(year), 1, 1)
                    .with(WeekFields.ISO.weekOfWeekBasedYear(), Integer.parseInt(weekValue))
                    .with(DayOfWeek.MONDAY);
            LocalDate endOfWeek = startOfWeek.plusDays(6);
            String button_action_2 = request.getParameter("actionType");

            if (button_action_2.equals("save")) {
                boolean isWeekContainingMonth = false;
                LocalDate currentDay = startOfWeek;
                while (currentDay.isBefore(endOfWeek.plusDays(1))) { // plusDays(1) để bao gồm cả ngày kết thúc
                    if (currentDay.getMonthValue() == Integer.parseInt(month)) {
                        isWeekContainingMonth = true;
                        break;
                    }
                    currentDay = currentDay.plusDays(1);
                }
                if (isWeekContainingMonth) {
                    boolean check = true;
                    SlotDAO slotDAO = new SlotDAO();
                    String skillIdString = (String) session.getAttribute("skill");
                    int skillID = Integer.parseInt(skillIdString);
                    Integer scheduleMenteeDraft = (Integer) session.getAttribute("scheduleMenteeDraft_" + schedule_id);
                    if(scheduleMenteeDraft == null){ 
                        ScheduleDAO schedule_dao = new ScheduleDAO();
                        String sessionId = UUID.randomUUID().toString();
                        Account mentee = (Account) session.getAttribute("account");
                        int menteeId = mentee.getAccount_id();
                        schedule_dao.createNewSchedule(menteeId, "4", LocalDateTime.now(), Integer.parseInt(month), sessionId);
                        scheduleMenteeDraft = schedule_dao.getScheduleId(menteeId, sessionId);
                        
                        session.setAttribute("scheduleMenteeDraft_" + schedule_id, scheduleMenteeDraft);
                    }
                    if (checkedValuesSlotOne == null && checkedValuesSlotTwo == null && checkedValuesSlotThree == null
                            && checkedValuesSlotThree == null && checkedValuesSlotFour == null && checkedValuesSlotFive == null) {
                        check = true;

                    }else{
                        SlotMenteeDAO slotMenteeDAO = new SlotMenteeDAO();
                        slotMenteeDAO.deleteSchedule(scheduleMenteeDraft, startOfWeek.toString(), endOfWeek.toString());
                        for (LocalDate date = startOfWeek; !date.isAfter(endOfWeek); date = date.plusDays(1)) { 
                            DayOfWeek dayOfWeek = date.getDayOfWeek();
                            int dayOfWeekValue = dayOfWeek.getValue();
                            for (int slotNumber = 1; slotNumber <= 5; slotNumber++) { 
                                String[] checkedValues = null;
                                switch (slotNumber) {
                                    case 1:
                                        checkedValues = checkedValuesSlotOne;
                                        break;
                                    case 2:
                                        checkedValues = checkedValuesSlotTwo;
                                        break;
                                    case 3:
                                        checkedValues = checkedValuesSlotThree;
                                        break;
                                    case 4:
                                        checkedValues = checkedValuesSlotFour;
                                        break;
                                    case 5:
                                        checkedValues = checkedValuesSlotFive;
                                        break;
                                    default:
                                        break;
                                }
                                if (checkedValues != null) {
                                    for (String slot_day : checkedValues) {
                                        if (dayOfWeekValue == Integer.parseInt(slot_day)) {
                                            int ressult = slotMenteeDAO.createSlotOfScheduleMentee(slotNumber, dayOfWeekValue, scheduleMenteeDraft, date, skillID, false);
                                        }
                                    }

                                }
                            }
                        }
                    }
                    
                    
                }else{ 
                    messageSchedule = "This week is not selected";
                    
                }
            } else if (button_action_2.equals("repeat")) {

            } else if (button_action_2.equals("submit")) {

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
            
            request.setAttribute("isFormFilled", true);
            request.setAttribute("messageSchedule", messageSchedule);
            request.setAttribute("weekDates", weekDates);
            request.setAttribute("isoWeek", Integer.parseInt(weekValue));
            request.setAttribute("scheduleId", schedule_id);
            request.setAttribute("weeks", weeks);
            request.setAttribute("month", month);
            request.setAttribute("currentYear", Integer.parseInt(year));
            
        }

        request.getRequestDispatcher("request-booking.jsp").forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

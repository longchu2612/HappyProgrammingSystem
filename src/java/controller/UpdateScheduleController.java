/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import static controller.ScheduleController.getFirstDayOfWeek;
import static controller.ScheduleController.getNumberOfISOWeeksInYear;
import dao.NotificationScheduleDAO;
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
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.UUID;
import model.Schedule;
import model.Slot;
import model.WeekRange;

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
        HttpSession session = request.getSession();
        Integer scheduleDraft = (Integer) session.getAttribute("scheduleDraft_" + scheduleId);

        session.setMaxInactiveInterval(3600);

        if (scheduleDraft == null) {
            ScheduleDAO schedule_dao = new ScheduleDAO();
            String sessionId = UUID.randomUUID().toString();
            int mentorId = schedule_dao.getMentorIdByScheduleId(Integer.parseInt(scheduleId));
            schedule_dao.createNewSchedule(mentorId, "4", LocalDateTime.now(), Integer.parseInt(month), sessionId);
            scheduleDraft = schedule_dao.getScheduleId(mentorId, sessionId);

            session.setAttribute("scheduleDraft_" + scheduleId, scheduleDraft);
        }

        List<WeekRange> selectedWeeks = (List<WeekRange>) session.getAttribute("selectedWeeks_"+scheduleId);
        if (selectedWeeks == null) {
            selectedWeeks = new ArrayList<>();
            session.setAttribute("selectedWeeks_"+scheduleId, selectedWeeks);
        }
        NotificationScheduleDAO notificationDAO = new NotificationScheduleDAO();
        String message = notificationDAO.getNoteSchedule(Integer.parseInt(scheduleId));
        int status = scheduleDAO.getStatusOfSchedule(Integer.parseInt(scheduleId));
//        String[] checkedValuesSlotOne = new String[]{"begin"};
//        String[] checkedValuesSlotTwo = new String[]{"begin"};
//        String[] checkedValuesSlotThree = new String[]{"begin"};
//        String[] checkedValuesSlotFour = new String[]{"begin"};
//        String[] checkedValuesSlotFive = new String[]{"begin"};
        

//        request.setAttribute("checkedValuesSlotOne", checkedValuesSlotOne);
//        request.setAttribute("checkedValuesSlotTwo", checkedValuesSlotTwo);
//        request.setAttribute("checkedValuesSlotThree", checkedValuesSlotThree);
//        request.setAttribute("checkedValuesSlotFour", checkedValuesSlotFour);
//        request.setAttribute("checkedValuesSlotFive", checkedValuesSlotFive);
        request.setAttribute("status", status);
        request.setAttribute("note", message);
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
            
            NotificationScheduleDAO notificationScheduleDAO = new NotificationScheduleDAO();
            String note = notificationScheduleDAO.getNoteSchedule(Integer.parseInt(schedule_id));
            
            ScheduleDAO scheduleDAO = new ScheduleDAO();
            int status = scheduleDAO.getStatusOfSchedule(Integer.parseInt(schedule_id));
            
            request.setAttribute("status", status);
            request.setAttribute("note", note);
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
            
            NotificationScheduleDAO notificationScheduleDAO = new NotificationScheduleDAO();
            String note = notificationScheduleDAO.getNoteSchedule(Integer.parseInt(schedule_id));

//            String[] checkedValuesSlotOne = request.getParameterValues("checkedValuesSlotOne");
//            String[] checkedValuesSlotTwo = request.getParameterValues("checkedValuesSlotTwo");
//            String[] checkedValuesSlotThree = request.getParameterValues("checkedValuesSlotThree");
//            String[] checkedValuesSlotFour = request.getParameterValues("checkedValuesSlotFour");
//            String[] checkedValuesSlotFive = request.getParameterValues("checkedValuesSlotFive");

            HttpSession session = request.getSession();
            Integer scheduleDraft = (Integer) session.getAttribute("scheduleDraft_" + schedule_id);

            session.setMaxInactiveInterval(3600);

            if (scheduleDraft == null) {
                ScheduleDAO schedule_dao = new ScheduleDAO();
                String sessionId = UUID.randomUUID().toString();
                int mentorId = schedule_dao.getMentorIdByScheduleId(Integer.parseInt(schedule_id));
                schedule_dao.createNewSchedule(mentorId, "4", LocalDateTime.now(), Integer.parseInt(month), sessionId);
                scheduleDraft = schedule_dao.getScheduleId(mentorId, sessionId);

                session.setAttribute("scheduleDraft_" + schedule_id, scheduleDraft);
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
           
            

//            if (scheduleDraft != null) {
//                List<Slot> slots_2 = scheduleDAO.getAllSlotByDates(scheduleDraft, firstDay, endDay);
//                if (slots_2.size() == 0) {
//                    if ((checkedValuesSlotOne == null || checkedValuesSlotOne.length == 0) && (checkedValuesSlotTwo == null || checkedValuesSlotTwo.length == 0) && (checkedValuesSlotThree == null || checkedValuesSlotThree.length == 0)
//                            && (checkedValuesSlotThree == null || checkedValuesSlotThree.length == 0) && (checkedValuesSlotFour == null || checkedValuesSlotFour.length == 0) && (checkedValuesSlotFive == null || checkedValuesSlotFive.length == 0)) {
//                        slots = Collections.emptyList();
//                    }else { 
//                       slots = scheduleDAO.getAllSlotByDates(Integer.parseInt(schedule_id), firstDay, endDay); 
//                    }
//                } else {
//                    slots = scheduleDAO.getAllSlotByDates(scheduleDraft, firstDay, endDay);
//                }
//            } else {
//                slots = scheduleDAO.getAllSlotByDates(Integer.parseInt(schedule_id), firstDay, endDay);
//            }
//            String[] checkedValuesSlotOne = request.getParameterValues("checkedValuesSlotOne");
//            String[] checkedValuesSlotTwo = request.getParameterValues("checkedValuesSlotTwo");
//            String[] checkedValuesSlotThree = request.getParameterValues("checkedValuesSlotThree");
//            String[] checkedValuesSlotFour = request.getParameterValues("checkedValuesSlotFour");
//            String[] checkedValuesSlotFive = request.getParameterValues("checkedValuesSlotFive");
            List<WeekRange> selectedWeeks = (List<WeekRange>) session.getAttribute("selectedWeeks_"+schedule_id);
            if (scheduleDraft != null) {
                List<Slot> slots_2 = scheduleDAO.getAllSlotByDates(scheduleDraft, firstDay, endDay);
                if (slots_2.size() == 0) {
                    if(checkWeekRange(selectedWeeks, firstDayOfWeek, firstDayOfWeek.plusDays(6)) == true){ 
                        slots = Collections.emptyList();
                    }else{ 
                        slots = scheduleDAO.getAllSlotByDates(Integer.parseInt(schedule_id), firstDay, endDay);
                    }
                } else {
                    slots = scheduleDAO.getAllSlotByDates(scheduleDraft, firstDay, endDay);
                }
            } else {
                slots = scheduleDAO.getAllSlotByDates(Integer.parseInt(schedule_id), firstDay, endDay);
            }

            String accountId = request.getParameter("accountId");
            
            int status = scheduleDAO.getStatusOfSchedule(Integer.parseInt(schedule_id));
            
            request.setAttribute("status", status);
            request.setAttribute("accountId", accountId);
            request.setAttribute("month", month);
            request.setAttribute("weeks", weeks);
            request.setAttribute("scheduleId", schedule_id);
            request.setAttribute("slots", slots);
            request.setAttribute("isoWeek", week);
            request.setAttribute("currentYear", Integer.parseInt(currentYear));
            request.setAttribute("note", note);
            request.setAttribute("weekDates", weekDates);
            
        }
        if (action.equals("update_schedule_week")) {
            boolean check = true;
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
            
            String button_action_2 = request.getParameter("button_action");

            String message = "";
            LocalDate startOfWeek = LocalDate.of(Integer.parseInt(year), 1, 1)
                    .with(WeekFields.ISO.weekOfWeekBasedYear(), Integer.parseInt(weekValue))
                    .with(DayOfWeek.MONDAY);
            LocalDate endOfWeek = startOfWeek.plusDays(6);

            boolean isWeekContainingMonth = false;
            LocalDate currentDay = startOfWeek;
            while (currentDay.isBefore(endOfWeek.plusDays(1))) { // plusDays(1) để bao gồm cả ngày kết thúc
                if (currentDay.getMonthValue() == Integer.parseInt(month)) {
                    isWeekContainingMonth = true;
                    break;
                }
                currentDay = currentDay.plusDays(1);
            }

            HttpSession session = request.getSession();
            Integer scheduleDraft = (Integer) session.getAttribute("scheduleDraft_" + schedule_id);

            session.setMaxInactiveInterval(3600);

            if (scheduleDraft == null) {
                ScheduleDAO schedule_dao = new ScheduleDAO();
                String sessionId = UUID.randomUUID().toString();
                int mentorId = schedule_dao.getMentorIdByScheduleId(Integer.parseInt(schedule_id));
                schedule_dao.createNewSchedule(mentorId, "4", LocalDateTime.now(), Integer.parseInt(month), sessionId);
                scheduleDraft = schedule_dao.getScheduleId(mentorId, sessionId);

                session.setAttribute("scheduleDraft_" + schedule_id, scheduleDraft);
            }
            List<WeekRange> selectedWeeks = (List<WeekRange>) session.getAttribute("selectedWeeks_"+schedule_id);
            if (selectedWeeks == null) {
                selectedWeeks = new ArrayList<>();
                session.setAttribute("selectedWeeks_"+schedule_id, selectedWeeks);
            }

            if (isWeekContainingMonth) {

                String button_action = request.getParameter("button_action");

                if ("draft".equals(button_action)) {
                    SlotDAO slotDAO = new SlotDAO();
                    List<Slot> slotsAfterDraft = slotDAO.getAllSlotByScheduleDarft(scheduleDraft, startOfWeek, endOfWeek);
                    if (checkedValuesSlotOne == null && checkedValuesSlotTwo == null && checkedValuesSlotThree == null
                            && checkedValuesSlotThree == null && checkedValuesSlotFour == null && checkedValuesSlotFive == null) {
                        check = true;

                    } else {
                        slotDAO.deleteSchedule(scheduleDraft, startOfWeek.toString(), endOfWeek.toString());
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
                                            int result = scheduleDAO.createSlotOfSchedule(slotNumber, dayOfWeekValue, scheduleDraft, date);
                                        }
                                    }

                                }
                            }
                        }

                    }
                    if (check == false) {
                        message = "Add failed to draft!";
                        slotDAO.deleteSchedule(scheduleDraft, startOfWeek.toString(), endOfWeek.toString());
                        for(Slot slot : slotsAfterDraft){ 
                            scheduleDAO.createSlotOfSchedule(slot.getSlot(), slot.getDayOfWeek(), scheduleDraft, slot.getTeach_date());
                        }
                    } else {
                        // Check if this week already exists in selectWeek saved to session
                        boolean found = false;
                        for (WeekRange weekRange : selectedWeeks) {
                            if (weekRange.getStartOfWeek().equals(startOfWeek) && weekRange.getEndOfWeek().equals(endOfWeek)) {
                                found = true;
                                break;
                            }
                        }
                        if (!found) {
                            selectedWeeks.add(new WeekRange(startOfWeek, endOfWeek));
                        }

                        // Get the first and last day of the month
                        LocalDate monthStart = LocalDate.of(Integer.parseInt(year), Integer.parseInt(month), 1);
                        LocalDate monthEnd = monthStart.withDayOfMonth(monthStart.lengthOfMonth());
                        // Given a for loop from the first day of the month to the last day of the month
                        for (LocalDate date = monthStart; !date.isAfter(monthEnd); date = date.plusDays(1)) {
                            boolean isInSelectedWeek = false;
                            // Kiểm tra xem ngày này có tồn tại trong các tuần mà đã bấm lưu Draft hay không
                            for (WeekRange weekRange : selectedWeeks) {
                                if (!date.isBefore(weekRange.getStartOfWeek()) && !date.isAfter(weekRange.getEndOfWeek())) {
                                    isInSelectedWeek = true;
                                    break;
                                }
                            }
                            // Nếu ngày này chưa tồn tại trong các ngày ở bên trên trong Draft thì lưu thêm vào trong Draft.
                            if (!isInSelectedWeek) {

                                // Lấy ra thông tin ngày trong tuần
                                DayOfWeek dayOfWeek = date.getDayOfWeek();
                                int dayOfWeekValue = dayOfWeek.getValue();

                                // Lấy ra thông tin các slot với dữ liệu date và schedule_id trên.
                                slotDAO.deleteScheduleByDateAndScheduleId(scheduleDraft, date);
                                List<Slot> slots = slotDAO.getAllSlotByDateAndScheduleId(Integer.parseInt(schedule_id), date);
                                // Thêm dữ liệu vào trong Draft
                                for (Slot slot : slots) {
                                    scheduleDAO.createSlotOfSchedule(slot.getSlot(), slot.getDayOfWeek(), scheduleDraft, date);
                                }
                            }
                        }
                        message = "Add Draft successfully!";
                    }

                } else if ("update".equals(button_action)) {
                    boolean checkUpdate = true;
                    List<Slot> slotsAfterUpdate = scheduleDAO.getAllSlotByScheduleId(Integer.parseInt(schedule_id));
                    // Kiểm tra vào trường hợp người dùng không thay đổi tuần nào cả và bấm update
                    if (scheduleDraft == null || scheduleDAO.getAllSlotByScheduleId(scheduleDraft) == null || scheduleDAO.getAllSlotByScheduleId(scheduleDraft).size() == 0) {
                        checkUpdate = true;
                    } else {
                        List<Slot> slots = scheduleDAO.getAllSlotByScheduleId(scheduleDraft);
                        SlotDAO slotDAO = new SlotDAO();
                        slotDAO.deleteSchedule(Integer.parseInt(schedule_id));

                        for (Slot slot : slots) {
                            int result = scheduleDAO.createSlotOfSchedule(slot.getSlot(), slot.getDayOfWeek(), Integer.parseInt(schedule_id), slot.getTeach_date());
                            if (result != 1) {
                                checkUpdate = false;
                            }
                        }
                    }

                    if (checkUpdate) {
                        message = "Update schedule succesfully";
                        scheduleDAO.updateSchedulePendingByMentorId(Integer.parseInt(schedule_id));
                        // Đang bị lỗi do xóa scheduleDraft đi và khi đó tạo ra Draft mới nên List<Slot> đang bị rỗng

                        SlotDAO slotDAO = new SlotDAO();
                        
                        slotDAO.deleteSchedule(scheduleDraft);

//                        int mentorId = scheduleDAO.getMentorIdByScheduleId(Integer.parseInt(schedule_id));
//                        scheduleDAO.deleteScheduleByMentorIdAndStatus(mentorId, "4", scheduleDraft);
                        scheduleDAO.deleteScheduleById(scheduleDraft);
                        session.removeAttribute("scheduleDraft_" + schedule_id);
                         
                        session.removeAttribute("selectedWeeks_"+schedule_id);

//                        session.setMaxInactiveInterval(0);
                    } else {
                        SlotDAO slotDAO = new SlotDAO();
                        slotDAO.deleteSchedule(Integer.parseInt(schedule_id));
                        for(Slot slot : slotsAfterUpdate){ 
                            scheduleDAO.createSlotOfSchedule(slot.getSlot(), slot.getDayOfWeek(), Integer.parseInt(schedule_id), slot.getTeach_date());
                        }
                        message = "Update schedule failed";
                        
                    }
                }
            } else {

                message = "This week is not selected!";

            }

            List<Slot> slots = new ArrayList<>();

            if (scheduleDraft != null) {
                List<Slot> slots_2 = scheduleDAO.getAllSlotByDates(scheduleDraft, startOfWeek.toString(), endOfWeek.toString());
                if (slots_2.isEmpty()) {
                    if (button_action_2.equals("update")&&(checkedValuesSlotOne == null || checkedValuesSlotOne.length == 0) && (checkedValuesSlotTwo == null || checkedValuesSlotTwo.length == 0) && (checkedValuesSlotThree == null || checkedValuesSlotThree.length == 0)
                            && (checkedValuesSlotThree == null || checkedValuesSlotThree.length == 0) && (checkedValuesSlotFour == null || checkedValuesSlotFour.length == 0) && (checkedValuesSlotFive == null || checkedValuesSlotFive.length == 0)) {
                        slots = scheduleDAO.getAllSlotByDates(Integer.parseInt(schedule_id), startOfWeek.toString(), endOfWeek.toString());

                    } else if(button_action_2.equals("draft")&&(checkedValuesSlotOne == null || checkedValuesSlotOne.length == 0) && (checkedValuesSlotTwo == null || checkedValuesSlotTwo.length == 0) && (checkedValuesSlotThree == null || checkedValuesSlotThree.length == 0)
                            && (checkedValuesSlotThree == null || checkedValuesSlotThree.length == 0) && (checkedValuesSlotFour == null || checkedValuesSlotFour.length == 0) && (checkedValuesSlotFive == null || checkedValuesSlotFive.length == 0)){
                       
                        slots = Collections.emptyList();
                    }else { 
                        slots = scheduleDAO.getAllSlotByDates(Integer.parseInt(schedule_id), startOfWeek.toString(), endOfWeek.toString());
                    }

                } else {
                    slots = slots_2;
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
            
            NotificationScheduleDAO notificationScheduleDAO = new NotificationScheduleDAO();
            String note = notificationScheduleDAO.getNoteSchedule(Integer.parseInt(schedule_id));
            int status = scheduleDAO.getStatusOfSchedule(Integer.parseInt(schedule_id));
            
            request.setAttribute("status", status);
            request.setAttribute("note", note);
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
        
        LocalDate startOfWeek_2 = LocalDate.of(2024,4,29);
        LocalDate endOfWeek_2 = LocalDate.of(2024,5,5);
        WeekRange weekRange = new WeekRange(startOfWeek_2, endOfWeek_2);
        
        LocalDate startOfWeek_3 = LocalDate.of(2024,5,6);
        LocalDate endOfWeek_3 = LocalDate.of(2024,5,12);
        WeekRange weekRange1 = new WeekRange(startOfWeek, endOfWeek);
        List<WeekRange> weekRanges  = new ArrayList<>();
        weekRanges.add(weekRange);
        weekRanges.add(weekRange1);
       
        boolean check = checkWeekRange(weekRanges, LocalDate.of(2024,4,29), LocalDate.of(2024,5,5));
        System.out.println(check);
        
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
    
    public static boolean checkWeekRange(List<WeekRange> weekRanges, LocalDate startOfWeek, LocalDate endOfWeek){ 
        if(weekRanges != null){ 
           boolean found = false;
           for(WeekRange weekRange : weekRanges){ 
               if(weekRange.getStartOfWeek().equals(startOfWeek) && weekRange.getEndOfWeek().equals(endOfWeek)){ 
                   found = true;
                   break;
               }
           }
           return found;
        }else { 
            return false;
        }
    }
    
    

}

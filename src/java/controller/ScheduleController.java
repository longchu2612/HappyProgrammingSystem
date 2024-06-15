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
import java.time.temporal.WeekFields;
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
        LocalDate currentDate = LocalDate.now();
        WeekFields weekFields = WeekFields.ISO;
        int selectWeek = currentDate.get(weekFields.weekOfWeekBasedYear()); 
        request.setAttribute("selectWeek", selectWeek);
        request.getRequestDispatcher("createScheduleTwo.jsp").forward(request, response);
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
        if (session == null || session.getAttribute("account") == null || account.getRole().getRole_id() == 1)  {
            response.sendRedirect("login.jsp");
            return;
        }
         String sessionId = UUID.randomUUID().toString();
        String[] checkedValuesSlotOne = request.getParameterValues("slot_1");
        String[] checkedValuesSlotTwo = request.getParameterValues("slot_2");
        String[] checkedValuesSlotThree = request.getParameterValues("slot_3");
        String[] checkedValuesSlotFour  = request.getParameterValues("slot_4");
        String[] checkedValuesSlotFive = request.getParameterValues("slot_5");
        int selectWeek = Integer.parseInt(request.getParameter("selectedWeek"));
        
        String message = "";
        Boolean check = true;
        ScheduleDAO scheduleDAO = new ScheduleDAO();
        
        if(checkedValuesSlotOne == null && checkedValuesSlotTwo == null && checkedValuesSlotThree == null && checkedValuesSlotFour ==null
        && checkedValuesSlotFive == null){
            check = false;
           
            
        }else{
            LocalDateTime currentDateTime = LocalDateTime.now();
            if(checkedValuesSlotOne != null){
                for(String value : checkedValuesSlotOne){
                    String[] parts = value.split("_");
                    String date = parts[1];
                    int currentYear = LocalDate.now().getYear(); 
                    LocalDate localDate = LocalDate.parse(date + "/" + currentYear, DateTimeFormatter.ofPattern("dd/MM/yyyy"));
                    String formattedDate = localDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                    LocalDate teachingDate = LocalDate.parse(formattedDate);
                    int dayOfWeek = localDate.getDayOfWeek().getValue();
                    
                    int result = scheduleDAO.createNewSchedule(dayOfWeek, account.getAccount_id(), currentDateTime, "1",teachingDate, sessionId);
                    if(result != 1){
                        check = false;
                    }
                }
            }
            if(checkedValuesSlotTwo != null){
                for(String value : checkedValuesSlotTwo){
                    String[] parts = value.split("_");
                    String date = parts[1];
                    int currentYear = LocalDate.now().getYear(); 
                    LocalDate localDate = LocalDate.parse(date + "/" + currentYear, DateTimeFormatter.ofPattern("dd/MM/yyyy"));
                    String formattedDate = localDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                    LocalDate teachingDate = LocalDate.parse(formattedDate);
                    int dayOfWeek = localDate.getDayOfWeek().getValue();
                    
                    int result = scheduleDAO.createNewSchedule(dayOfWeek, account.getAccount_id(), currentDateTime, "2",teachingDate, sessionId);
                    if(result != 1){
                        check = false;
                    }
                }
            }
            if(checkedValuesSlotThree != null){
                for(String value : checkedValuesSlotThree){
                    String[] parts = value.split("_");
                    String date = parts[1];
                    int currentYear = LocalDate.now().getYear(); 
                    LocalDate localDate = LocalDate.parse(date + "/" + currentYear, DateTimeFormatter.ofPattern("dd/MM/yyyy"));
                    String formattedDate = localDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                    LocalDate teachingDate = LocalDate.parse(formattedDate);
                    int dayOfWeek = localDate.getDayOfWeek().getValue();
                    
                    int result = scheduleDAO.createNewSchedule(dayOfWeek, account.getAccount_id(), currentDateTime, "3",teachingDate, sessionId);
                    if(result != 1){
                        check = false;
                    }
                }
            }
            if(checkedValuesSlotFour != null){
                for(String value : checkedValuesSlotFour){
                    String[] parts = value.split("_");
                    String date = parts[1];
                    int currentYear = LocalDate.now().getYear(); 
                    LocalDate localDate = LocalDate.parse(date + "/" + currentYear, DateTimeFormatter.ofPattern("dd/MM/yyyy"));
                    String formattedDate = localDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                    LocalDate teachingDate = LocalDate.parse(formattedDate);
                    int dayOfWeek = localDate.getDayOfWeek().getValue();
                    
                    int result = scheduleDAO.createNewSchedule(dayOfWeek, account.getAccount_id(), currentDateTime, "4",teachingDate, sessionId);
                    if(result != 1){
                        check = false;
                    }
                }
            }
            if(checkedValuesSlotFive != null){
                for(String value : checkedValuesSlotFive){
                    String[] parts = value.split("_");
                    String date = parts[1];
                    int currentYear = LocalDate.now().getYear(); 
                    LocalDate localDate = LocalDate.parse(date + "/" + currentYear, DateTimeFormatter.ofPattern("dd/MM/yyyy"));
                    String formattedDate = localDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                    LocalDate teachingDate = LocalDate.parse(formattedDate);
                    int dayOfWeek = localDate.getDayOfWeek().getValue();
                
                    int result = scheduleDAO.createNewSchedule(dayOfWeek, account.getAccount_id(), currentDateTime, "5",teachingDate, sessionId);
                    if(result != 1){
                        check = false;
                    }
                }
            }
                    
            
            
            
            
        }
        if(check == false){
            message = "<span style=\"color: red;\">Add failed class schedule!</span>";
        }else {
            message = "<span style=\"color: green;\">Add class schedule successfully!</span>";
            
        }
        request.setAttribute("selectWeek", selectWeek);
        request.setAttribute("checkedValuesOne", checkedValuesSlotOne);
        request.setAttribute("checkedValuesTwo", checkedValuesSlotTwo);
        request.setAttribute("checkedValuesThree", checkedValuesSlotThree);
        request.setAttribute("checkedValuesFour", checkedValuesSlotFour);
        request.setAttribute("checkedValuesFive", checkedValuesSlotFive);
        
        request.setAttribute("message", message);
        request.getRequestDispatcher("createScheduleTwo.jsp").forward(request, response);
    }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }

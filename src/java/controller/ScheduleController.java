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
        String startDate = getStartDate(String.valueOf(selectWeek));
        request.setAttribute("startDate", startDate);
        request.setAttribute("selectWeek", selectWeek);
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
        String selectWeek = request.getParameter("selectedWeek");
        String startDate = getStartDate(selectWeek);
        request.setAttribute("startDate", startDate);
        request.setAttribute("selectWeek", selectWeek);
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

    private String getStartDate(String selectWeek) {
        String startDate = "";
        switch (selectWeek) {
            case "1":
                startDate = "01/01"; // Ngày bắt đầu của tuần 1
                break;
            case "2":
                startDate = "08/01"; // Ngày bắt đầu của tuần 2
                break;
            case "3":
                startDate = "15/01"; // Ngày bắt đầu của tuần 3
                break;
            case "4":
                startDate = "22/01"; // Ngày bắt đầu của tuần 4
                break;
            case "5":
                startDate = "29/01"; // Ngày bắt đầu của tuần 4
                break;
            case "6":
                startDate = "05/02"; // Ngày bắt đầu của tuần 4
                break;
            case "7":
                startDate = "12/02"; // Ngày bắt đầu của tuần 4
                break;
            case "8":
                startDate = "19/02"; // Ngày bắt đầu của tuần 4
                break;
            case "9":
                startDate = "26/02"; // Ngày bắt đầu của tuần 4
                break;
            case "10":
                startDate = "04/03"; // Ngày bắt đầu của tuần 4
                break;
            case "11":
                startDate = "11/03"; // Ngày bắt đầu của tuần 4
                break;
            case "12":
                startDate = "18/03"; // Ngày bắt đầu của tuần 4
                break;
            case "13":
                startDate = "25/03"; // Ngày bắt đầu của tuần 4
                break;
            case "14":
                startDate = "01/04"; // Ngày bắt đầu của tuần 4
                break;
            case "15":
                startDate = "08/04"; // Ngày bắt đầu của tuần 4
                break;
            case "16":
                startDate = "15/04"; // Ngày bắt đầu của tuần 4
                break;
            case "17":
                startDate = "22/04"; // Ngày bắt đầu của tuần 4
                break;
            case "18":
                startDate = "29/04"; // Ngày bắt đầu của tuần 4
                break;
            case "19":
                startDate = "06/05"; // Ngày bắt đầu của tuần 4
                break;
            case "20":
                startDate = "13/05"; // Ngày bắt đầu của tuần 4
                break;
            case "21":
                startDate = "20/05"; // Ngày bắt đầu của tuần 4
                break;
            case "22":
                startDate = "27/05"; // Ngày bắt đầu của tuần 4
                break;
            case "23":
                startDate = "03/06"; // Ngày bắt đầu của tuần 4
                break;
            case "24":
                startDate = "10/06"; // Ngày bắt đầu của tuần 4
                break;
            case "25":
                startDate = "17/06"; // Ngày bắt đầu của tuần 4
                break;
            case "26":
                startDate = "24/06"; // Ngày bắt đầu của tuần 4
                break;
            case "27":
                startDate = "01/07"; // Ngày bắt đầu của tuần 4
                break;
            case "28":
                startDate = "08/07"; // Ngày bắt đầu của tuần 4
                break;
            case "29":
                startDate = "15/07"; // Ngày bắt đầu của tuần 4
                break;
            case "30":
                startDate = "22/07"; // Ngày bắt đầu của tuần 4
                break;
            case "31":
                startDate = "29/07"; // Ngày bắt đầu của tuần 4
                break;
                
            default:
                startDate = "";
        }
        return startDate;
    }

}

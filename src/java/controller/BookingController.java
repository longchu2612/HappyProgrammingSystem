/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import static controller.ScheduleController.getFirstDayOfWeek;
import static controller.UpdateScheduleController.getNumberOfISOWeeksInYear;
import dao.*;
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
import java.time.temporal.WeekFields;
import java.util.*;
import model.*;

/**
 *
 * @author catmi
 */
public class BookingController extends HttpServlet {

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
        response.setCharacterEncoding("UTF-8");
        String service = request.getParameter("service");
        HttpSession session = request.getSession();
        if (service == null) {
            service = "all_skill";
        }
        switch (service) {
            case "all_skill" -> {
                String[] selectedSkills = new String[0];
                ArrayList<Mentor> listM = new BookingDAO().getAllMentor(selectedSkills);
                ArrayList<Skill> listSkill = new SkillDAO().getAllSkill();
                request.setAttribute("listSkill", listSkill);
                request.setAttribute("listM", listM);
                request.setAttribute("listSize", listM.size());
                request.getRequestDispatcher("all-course.jsp").forward(request, response);
            }
            case "by_skill" -> {
                String skillId = request.getParameter("skId");
                ArrayList<Mentor> listM = new BookingDAO().getAllMentorBySkillId(skillId);
                request.setAttribute("listM", listM);
                request.setAttribute("listSize", listM.size());
                request.getRequestDispatcher("all-course.jsp").forward(request, response);
            }
            case "filter_skill" -> {
                String[] selectedSkills = request.getParameterValues("select_specialist");
                ArrayList<Mentor> listM = new BookingDAO().getAllMentor(selectedSkills);
                ArrayList<Skill> listSkill = new SkillDAO().getAllSkill();
                request.setAttribute("listSkill", listSkill);
                request.setAttribute("listM", listM);
                request.setAttribute("listSize", listM.size());
                request.setAttribute("selectedSkills", selectedSkills);
                request.getRequestDispatcher("all-course.jsp").forward(request, response);
            }
            default -> {

            }
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
        processRequest(request, response);
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
        processRequest(request, response);
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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
                ArrayList<Mentor> listM = new BookingDAO().getAllMentor();
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
            case "course_details" -> {
                Account acc = new AccountDAO().getAccountByAccId(request.getParameter("mentorId"));
                CV cv = new CVDAO().getCVByAccId(request.getParameter("mentorId"));
                ArrayList<Skill> listS = new SkillDAO().getSkillByCvId(request.getParameter("cvId"));
                List<Slot> slots = new ScheduleDAO().getAllDayOfSlot(Integer.parseInt("2"));

                request.setAttribute("mentor", acc);
                request.setAttribute("mentor_cv", cv);
                request.setAttribute("listS", listS);
                request.setAttribute("slots", slots);
                request.getRequestDispatcher("course_details.jsp").forward(request, response);
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

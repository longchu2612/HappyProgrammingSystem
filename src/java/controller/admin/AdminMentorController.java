/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.*;
import model.*;

/**
 *
 * @author catmi
 */
public class AdminMentorController extends HttpServlet {

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
        AdminMentorDAO amDAO = new AdminMentorDAO();
        String service = request.getParameter("service");
        HttpSession session = request.getSession();

        if (session.getAttribute("ad_acc") != null) {
            String acc = String.valueOf(session.getAttribute("acc"));
            if (null == service) {
                ArrayList<Mentor> list = amDAO.getAllMentor();
                request.setAttribute("mentors", list);
                request.getRequestDispatcher("/admin/mentor-list.jsp").forward(request, response);
            } else {
                switch (service) {
                    case "details" -> {

                    }
                    case "search" -> {
                        String name = request.getParameter("txtSearch").trim();
                        ArrayList<Mentor> listByFullname = amDAO.searchByFullName(name);
                        ArrayList<Mentor> listByUsername = amDAO.searchByUsername(name);
                        if (name == null || name.isEmpty()) {
                            response.sendRedirect(request.getContextPath() + "/admin/MentorList");
                        } else if (listByUsername != null) {
                            request.setAttribute("txtSearch", name);
                            request.setAttribute("mentors", listByUsername);
                            request.getRequestDispatcher("/admin/mentor-list.jsp").forward(request, response);
                        } else {
                            request.setAttribute("txtSearch", name);
                            request.setAttribute("mentors", listByFullname);
                            request.getRequestDispatcher("/admin/mentor-list.jsp").forward(request, response);
                        }
                    }
                    case "setStatus" -> {
                        String id = request.getParameter("id");
                        int status = Integer.parseInt(request.getParameter("status"));
                        if (status == 1) {
                            amDAO.setStatus(id, 0);
                            request.setAttribute("statusUpdate", "Trạng thái đã được cập nhật!");
                            response.sendRedirect(request.getContextPath() + "/admin/MentorList");
                        } else {
                            amDAO.setStatus(id, 1);
                            request.setAttribute("statusUpdate", "Trạng thái đã được cập nhật!");
                            response.sendRedirect(request.getContextPath() + "/admin/MentorList");
                        }
                    }
                    default -> {
                    }
                }
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/home");
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

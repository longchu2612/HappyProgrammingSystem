/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.SkillDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.*;
import model.Skill;

/**
 *
 * @author catmi
 */
public class AdminSkillController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String service = request.getParameter("service");
        SkillDAO dao = new SkillDAO();
        HttpSession session = request.getSession();
        if (session.getAttribute("ad_acc") != null) {
            if (null == service) {
                ArrayList<Skill> list = dao.getAllSkill();
                request.setAttribute("listSkill", list);
                request.getRequestDispatcher("/admin/skill-list.jsp").forward(request, response);
            } else {
                switch (service) {
                    case "detail" -> {
                        String skillId = request.getParameter("skillId");
                        Skill s = dao.getSkillById(skillId);
                        request.setAttribute("skill", s);
                        request.getRequestDispatcher("/admin/update-skill.jsp").forward(request, response);
                    }
                    case "search" -> {
                        String name = request.getParameter("skillName");
                        ArrayList<Skill> list = dao.searchSkillByName(name);
                        request.setAttribute("listSkill", list);
                        request.getRequestDispatcher("/admin/skill-list.jsp").forward(request, response);
                    }
                    case "add" -> {
                        response.sendRedirect(request.getContextPath() + "/admin/add-skill.jsp");
                    }
                    case "add-new" -> {
                        String name = request.getParameter("skillname");
                        String status = request.getParameter("status");
                        boolean check = dao.addNewSkill(name, status);
                        if (check == true) {
                            response.sendRedirect(request.getContextPath() + "/admin/SkillList");
                        } else {
                            request.setAttribute("skillname", name);
                            request.setAttribute("mess", "Skill has already exsisted");
                            request.getRequestDispatcher("/admin/add-skill.jsp").forward(request, response);
                        }
                    }
                    case "update" -> {
                        String id = request.getParameter("skillId");
                        String name = request.getParameter("skillname");
                        String status = request.getParameter("status");
                        boolean check = dao.updateSkill(name, status, id);
                        if (check) {
                            response.sendRedirect(request.getContextPath() + "/admin/SkillList");
                        } else {
                            //request.setAttribute("mess", "Something went wrong!");
                        }
                    }
                    case "setStatus" -> {
                        String id = request.getParameter("id");
                        int status = Integer.parseInt(request.getParameter("status"));
                        if (status == 1) {
                            dao.setStatus("0", id);
                            request.setAttribute("statusUpdate", "Trạng thái đã được cập nhật!");
                            response.sendRedirect(request.getContextPath() + "/admin/SkillList");
                        } else {
                            dao.setStatus("1", id);
                            request.setAttribute("statusUpdate", "Trạng thái đã được cập nhật!");
                            response.sendRedirect(request.getContextPath() + "/admin/SkillList");
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

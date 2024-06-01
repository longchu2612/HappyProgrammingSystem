/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;


import dao.RequestDAO;
import dao.SkillDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import model.Account;
import model.Skill;



/**
 *

 * @author asus
 */
public class RequestController extends HttpServlet{

    

    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SkillDAO skill_dao = new SkillDAO();
        List<Skill> listSkill = skill_dao.getAllSkill();
        request.setAttribute("list_skill", listSkill);
        request.getRequestDispatcher("create-request.jsp").forward(request, response);
    }

    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("account") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Account account = (Account) session.getAttribute("account");
        String title = request.getParameter("title");
        String deadline = request.getParameter("deadline");
        String content = request.getParameter("content");
        String[] listSkills = request.getParameterValues("skill");
        SkillDAO skill_dao = new SkillDAO();
        List<Skill> listSkill = skill_dao.getAllSkill();

        if (listSkills == null) {

            request.setAttribute("list_skill", listSkill);
            request.setAttribute("error", "You must choose at least 1 skill");

        } else if (listSkills.length > 3) {
            request.setAttribute("list_skill", listSkill);
            request.setAttribute("error", "You must choose at max 3 skill");

        } else {
            
            
            RequestDAO requestDAO = new RequestDAO();
            int request_id = requestDAO.insertRequest(title, deadline, content, "1", account.getAccount_id());
            for (String skill : listSkills){ 
                int skill_id = Integer.parseInt(skill);
                requestDAO.insertRequestSkill(request_id, skill_id);
            }
            request.setAttribute("list_skill", listSkill);
            request.setAttribute("error", "You create request successful");
            response.getWriter().println(account.getAccount_id());
            
        }
        request.getRequestDispatcher("create-request.jsp").forward(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

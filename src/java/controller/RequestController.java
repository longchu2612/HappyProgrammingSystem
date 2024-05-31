/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

<<<<<<< HEAD
import dao.RequestDAO;
=======
>>>>>>> dev
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
<<<<<<<< HEAD:src/java/controller/RequestController.java
 * @author asus
 */
public class RequestController extends HttpServlet {
<<<<<<< HEAD

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
=======
========
 * @author catmi
 */
public class AddNewSkill extends HttpServlet {
>>>>>>>> e264cca65e09acb803367da550acde22bd8390c0:src/java/controller/AddNewSkill.java
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
>>>>>>> dev
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
<<<<<<<< HEAD:src/java/controller/RequestController.java
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RequestController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RequestController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
<<<<<<< HEAD
    }
=======
========
        
>>>>>>>> e264cca65e09acb803367da550acde22bd8390c0:src/java/controller/AddNewSkill.java
    } 
>>>>>>> dev

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
        SkillDAO skill_dao = new SkillDAO();
        List<Skill> listSkill = skill_dao.getAllSkill();
        request.setAttribute("list_skill", listSkill);
        request.getRequestDispatcher("create-request.jsp").forward(request, response);
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
<<<<<<< HEAD
            throws ServletException, IOException {
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

=======
    throws ServletException, IOException {
        SkillDAO dao = new SkillDAO();
        String name = request.getParameter("skillname");
        String status = request.getParameter("status");
        boolean check = dao.addNewSkill(name, status);
        if(check){
           response.sendRedirect(request.getContextPath() + "/ListSkill");
        }else{
            request.setAttribute("mess", "Something went wrong!");
        request.getRequestDispatcher("AddNewSkill.jsp").forward(request, response);
        }
        
>>>>>>> dev
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

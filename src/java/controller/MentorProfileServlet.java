/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import dao.CVDAO;
import dao.RNCDAO;
import dao.SkillDAO;
import dao.SkillsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Account;
import model.CV;
import model.CV_skill;
import model.RNC;

/**
 *
 * @author ngoqu
 */
@WebServlet(name = "MentorProfileServlet", urlPatterns = {"/mentorprofile"})
public class MentorProfileServlet extends HttpServlet {

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
        String ID = request.getParameter("id");
        AccountDAO ac = new AccountDAO();
        CVDAO cv = new CVDAO();
        SkillsDAO s = new SkillsDAO();
        RNCDAO r = new RNCDAO();
        ArrayList<RNC> rnc = (ArrayList<RNC>) r.getAllCommentsbyID(ID);
         request.setAttribute("rnc", rnc);
        CV cvmentor = cv.getCVByAccountId(ID);
        Account acc = ac.getUsersById(ID);
        request.setAttribute("acc", acc);
        request.setAttribute("cv", cvmentor);
        String Cvid = cvmentor.getId();
        request.setAttribute("Cvid", Cvid);
        ArrayList<CV_skill> cvs = (ArrayList<CV_skill>) s.getAllByCVId(Cvid);
        SkillDAO sk = new SkillDAO();
        request.setAttribute("Skills", cvs);
        
        request.getRequestDispatcher("profilementor.jsp").forward(request, response);
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

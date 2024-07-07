/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import dao.RatingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Rating;

/**
 *
 * @author Admin
 */
public class RatinngController extends HttpServlet {

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

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RatinngController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RatinngController at " + request.getContextPath() + "</h1>");
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
        
        HttpSession sess = request.getSession();
        AccountDAO a = new AccountDAO();
        int accountID = a.getIdByAccountName(String.valueOf(sess.getAttribute("acc")));
        String id = request.getParameter("id");
        RatingDAO r = new RatingDAO();
        
        if (r.checkRequestExistance(String.valueOf(accountID), id) == true) {
            
            Account ac = a.getUsersById(id);
            Account ac1 = a.getUsersById(String.valueOf(accountID));
            Rating rt = r.getRatingByIds(id, String.valueOf(accountID));
            String check = "checked=\"\"";
            String check0 = "";
            String check05 = "";
            String check1 = "";
            String check15 = "";
            String check2 = "";
            String check25 = "";
            String check3 = "";
            String check35 = "";
            String check4 = "";
            String check45 = "";
            String check5 = "";
            
            switch (String.valueOf(rt.getRatingstar())) {
                case "0.5":
                    check05 = check;
                    break;
                case "1.0":
                    check1 = check;
                    break;
                case "1.5":
                    check15 = check;
                    break;
                case "2.0":
                    check2 = check;
                    break;
                case "2.5":
                    check25 = check;
                    break;
                case "3.0":
                    check3 = check;
                    break;
                case "3.5":
                    check35 = check;
                    break;
                case "4.0":
                    check4 = check;
                    break;
                case "4.5":
                    check45 = check;
                    break;
                case "5.0":
                    check5 = check;
            }
            
            String role = "";
            
            if (a.getRoleById(String.valueOf(accountID)) == 1) {
                role = "mentee";
            } else if (a.getRoleById(String.valueOf(accountID)) == 2) {
                role = "mentor";
            }
            
            request.setAttribute("mentorID", id);
            request.setAttribute("menteeID", accountID);
            request.setAttribute("ac", ac);
            request.setAttribute("ac1", ac1);
            request.setAttribute("role", role);
            request.setAttribute("rt", rt);
            request.setAttribute("check0", check0);
            request.setAttribute("check05", check05);
            request.setAttribute("check1", check1);
            request.setAttribute("check15", check15);
            request.setAttribute("check2", check2);
            request.setAttribute("check25", check25);
            request.setAttribute("check3", check3);
            request.setAttribute("check35", check35);
            request.setAttribute("check4", check4);
            request.setAttribute("check45", check45);
            request.setAttribute("check5", check5);
            request.getRequestDispatcher("rating.jsp").forward(request, response);
        } else {
            response.sendRedirect("/HappyProgrammingSystem/home");
        }
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

        String mentorID = request.getParameter("mentorID");
        String menteeID = request.getParameter("menteeID");
        String rating = request.getParameter("rating");
        String content = request.getParameter("content");
        RatingDAO r = new RatingDAO();
        Rating rt = r.getRatingByIds(mentorID, menteeID);
        
        if (rt.getRatingstar() == 0) {
            r.insertRatingMentor(mentorID, content, rating, menteeID);
        } else {
            r.updateRatingMentor(mentorID, content, rating, menteeID);
        }
        
        response.sendRedirect("rating?id=" + mentorID);
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

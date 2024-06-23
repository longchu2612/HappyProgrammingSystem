/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
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
@WebServlet(name = "AdminRequestController", urlPatterns = {"/admin/ListRequest"})
public class AdminRequestController extends HttpServlet {

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

        CVDAO daoCV = new CVDAO();
        AccountDAO daoAcc = new AccountDAO();
        SkillDAO daoSK = new SkillDAO();
        String service = request.getParameter("service");
        HttpSession session = request.getSession();
        if (session.getAttribute("ad_acc") != null) {
            if (null == service) {
                ArrayList<CV_Request> list = daoCV.displayCVAdmin();
                request.setAttribute("cvList", list);
                request.getRequestDispatcher("/admin/cv-request.jsp").forward(request, response);
            } else {
                switch (service) {
                    case "details" -> {
                        String cvId = request.getParameter("cvId");
                        String accId = request.getParameter("accId");
                        CV cv = daoCV.getCVByAccId(accId);
                        Account acc = daoAcc.getAccountByAccId(accId);
                        ArrayList<String> listS = daoSK.getSkilCV(cvId);
                        request.setAttribute("cv", cv);
                        request.setAttribute("acc", acc);
                        request.setAttribute("listS", listS);
                        request.getRequestDispatcher("/admin/cv-details.jsp").forward(request, response);
                    }
                    case "approve" -> {
                        String cvId = request.getParameter("cvId");
                        String note = request.getParameter("note");
                        daoCV.setCVStatus(cvId, "Approve", note);
                        response.sendRedirect(request.getContextPath() + "/admin/ListRequest");
                    }
                    case "reject" -> {
                        String cvId = request.getParameter("cvId");
                        String note = request.getParameter("note");
                        daoCV.setCVStatus(cvId, "Reject", note);
                        response.sendRedirect(request.getContextPath() + "/admin/ListRequest");
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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.*;
import java.util.*;
import model.*;
import dao.*;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class RequestController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        RequestDAO daoReq = new RequestDAO();
        OrderDAO daoOrder = new OrderDAO();
        if (account != null) {
            Account acc = new AccountDAO().getAccountByAccId(request.getParameter("mentorId"));
            CV cv = new CVDAO().getCVByAccId(request.getParameter("mentorId"));
            ArrayList<Skill> listS = new SkillDAO().getSkillByCvId(request.getParameter("cvId"));
            Request req = daoReq.checkRequestDraft(account.getAccount_id(), acc.getAccount_id());
            if (req == null) {
                request.setAttribute("acc", acc);
                request.setAttribute("cv", cv);
                request.setAttribute("listS", listS);
                request.getRequestDispatcher("request-booking.jsp").forward(request, response);
            } else {
                request.setAttribute("acc", acc);
                request.setAttribute("cv", cv);
                request.setAttribute("listS", listS);
                request.getRequestDispatcher("request-booking.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

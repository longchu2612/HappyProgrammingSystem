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
        String service = request.getParameter("service");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        RequestDAO daoReq = new RequestDAO();
        OrderDAO daoOrder = new OrderDAO();
        if (account != null) {
            switch (service) {
                case "list_request" -> {

                    int roleId = account.getRole().getRole_id();
                    switch (roleId) {
                        case 1 -> {
                            ArrayList<Request> listRq = daoReq.getRequestByCreateBy(account.getAccount_id());
                            request.setAttribute("listRq", listRq);
                            request.getRequestDispatcher("list-request.jsp").forward(request, response);
                        }
                        case 2 -> {
                        }
                        default -> {
                        }
                    }
                }
                case "create_request" -> {
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
                        response.sendRedirect("alert-request.jsp");
                    }

                }
                
                case "update" -> {
                    
                }
                default -> {
                }
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);

          
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

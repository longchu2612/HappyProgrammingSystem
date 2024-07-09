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
                case "add" -> {
                    //Get value
                    String action = request.getParameter("action");
                    String amount = request.getParameter("amount");
                    String title = request.getParameter("title");
                    int skillId = Integer.parseInt(request.getParameter("skills"));
                    String content = request.getParameter("content");
                    int mentorId = Integer.parseInt(request.getParameter("mentorId"));
                    int userId = account.getAccount_id();
                    //Get date
                    Timestamp deadline = Timestamp.valueOf(
                            LocalDateTime.parse(
                                    request.getParameter("deadline"), DateTimeFormatter.ISO_LOCAL_DATE_TIME));
                    //Get number slot
                    String[] slot1Selected = request.getParameterValues("slot_1");
                    String[] slot2Selected = request.getParameterValues("slot_2");
                    String[] slot3Selected = request.getParameterValues("slot_3");
                    String[] slot4Selected = request.getParameterValues("slot_4");
                    String[] slot5Selected = request.getParameterValues("slot_5");
                    int countSlot1 = (slot1Selected == null) ? 0 : slot1Selected.length;
                    int countSlot2 = (slot2Selected == null) ? 0 : slot2Selected.length;
                    int countSlot3 = (slot3Selected == null) ? 0 : slot3Selected.length;
                    int countSlot4 = (slot4Selected == null) ? 0 : slot4Selected.length;
                    int countSlot5 = (slot5Selected == null) ? 0 : slot5Selected.length;
                    int totalSlot = countSlot1 + countSlot2 + countSlot3 + countSlot4 + countSlot5;
                    //
                    Request req = daoReq.checkRequestDraft(userId, mentorId);
                    if (action.equals("draft")) {
                        if (req == null) {
                            daoReq.createRequest(title, deadline, content, "1", String.valueOf(userId), Timestamp.valueOf(LocalDateTime.now()));
                            int reqId = daoReq.getIdNewRequest();
                            daoReq.createRequestCourse(reqId, mentorId, skillId, totalSlot);
                            response.sendRedirect("home");
                        } else {
                            daoReq.updateRequest(String.valueOf(req.getId()), title, deadline, content, "1", Timestamp.valueOf(LocalDateTime.now()));
                            daoReq.updateRequestCourse(req.getId(), skillId, totalSlot);
                            response.sendRedirect("Booking");
                        }
                    } else if (action.equals("submit")) {
                        int total = Integer.parseInt(amount) * 2 * totalSlot;
                        int currentBalance = daoOrder.checkMoney(userId, total);
                        if (req == null) {
                            daoReq.createRequest(title, deadline, content, "2", String.valueOf(userId), Timestamp.valueOf(LocalDateTime.now()));
                            int reqId = daoReq.getIdNewRequest();
                            daoReq.createRequestCourse(reqId, mentorId, skillId, totalSlot);
                            request.setAttribute("mentorId", mentorId);
                            request.setAttribute("total", total);
                            request.getRequestDispatcher("checkout.jsp").forward(request, response);

                        } else {
                            daoReq.updateRequest(String.valueOf(req.getId()), title, deadline, content, "2", Timestamp.valueOf(LocalDateTime.now()));
                            int reqId = daoReq.getIdNewRequest();
                            daoReq.updateRequestCourse(req.getId(), skillId, totalSlot);
                            request.setAttribute("total", total);
                            request.getRequestDispatcher("checkout.jsp").forward(request, response);

                        }

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
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

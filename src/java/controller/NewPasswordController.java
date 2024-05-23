package controller;


import dao.AccountDAO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;


@WebServlet("/newPassword")
public class NewPasswordController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");
        String webemail = (String) session.getAttribute("email");
        RequestDispatcher dispatcher = null;
        try {
            if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {
                AccountDAO ac = new AccountDAO();
                ac.updatePassword(webemail, confPassword);
                dispatcher = request.getRequestDispatcher("login.jsp");
            } else {
               request.setAttribute("message1","New Password And Confirm Password Are Not Match");
			
		   dispatcher=request.getRequestDispatcher("newPassword.jsp");
            }
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}



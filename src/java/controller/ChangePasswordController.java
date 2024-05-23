package controller;

import dao.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import until.PasswordUtil;

/**
 *
 * @author anhdu
 */
@WebServlet(name = "ChangePassController", urlPatterns = {"/ChangePass"})
public class ChangePasswordController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PasswordUtil passwordUtil = new PasswordUtil();
         HttpSession session = request.getSession();
         String Username = (String) session.getAttribute("name");
        
       
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        
        AccountDAO ac = new AccountDAO();
        ac.updatePassword(Username, newPassword);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}


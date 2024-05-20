package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import until.PasswordUtil;

/**
 *
 * @author anhdu
 */
@WebServlet(name = "ChangePassController", urlPatterns = {"/ChangePass"})
public class ChangePasswordController extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangePass</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePass at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("User");
        request.setAttribute("user", new UserDAO().getUserByUsername(user.getName()));
        if(request.getParameter("success")!=null) request.setAttribute("msg", "Update succes!");
        if(request.getParameter("fail")!=null) request.setAttribute("msg", "Update failed!");
        
        request.getRequestDispatcher("changePass.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PasswordUtil passwordUtil = new PasswordUtil();
        
        String username = request.getParameter("username");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserByUsername(username);

        if (user != null && user.getPassword().equals(passwordUtil.hashPasswordMD5(oldPassword)) && newPassword.equals(confirmPassword)) {
            // The user exists, old password is correct, and new password matches the confirmation.

            // Update the password using the DAO method:
            userDAO.updatePassword(username, passwordUtil.hashPasswordMD5(newPassword));

            // Redirect to a success page or do whatever is required.
            response.sendRedirect("ChangePass?success");
        } else {
            // The user doesn't exist or old password is incorrect or new password doesn't match.
            // Handle the error, show a message, or redirect to an error page.
            response.sendRedirect("ChangePass?fail");
        }
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


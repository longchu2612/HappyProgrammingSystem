package controller;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import util.Email;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import jakarta.servlet.http.HttpSession;
import java.util.UUID;
import model.Role;

/**
 *
 * @author asus
 */
@WebServlet(name = "AccountController", urlPatterns = {"/account"})
//@WebServlet("/account")
public class AccountController extends HttpServlet {

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
            throws ServletException, IOException, ParseException, SQLException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action.equals("checkregister")) {

            String account_name = request.getParameter("account_name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String confirm_password = request.getParameter("confirm_password");
            String full_name = request.getParameter("full_name");
            String phone_number = request.getParameter("phone");
            String dob = request.getParameter("birthday");
            Date date = Date.valueOf(dob);

            String gender = request.getParameter("gender");

            String address = request.getParameter("address");
            String role = request.getParameter("role");
            int role_id = Integer.parseInt(role);
            Boolean sex = Boolean.parseBoolean(gender);
            Boolean status = false;
            AccountDAO account_dao = new AccountDAO();
            Account account = account_dao.checkAccount(account_name, email);
            if (account != null) {
                request.setAttribute("account_name", account_name);
                request.setAttribute("email", email);
                request.setAttribute("password", password);
                request.setAttribute("confirm_password", confirm_password);
                request.setAttribute("full_name", full_name);
                request.setAttribute("phone_number", phone_number);
                request.setAttribute("dob", dob);
                request.setAttribute("address", address);
                request.setAttribute("sex", sex);
                request.setAttribute("role_id", role_id);
                request.setAttribute("error", "Email or username already exists on the system!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else {

                account_dao.Register(account_name, email, password, full_name, phone_number, date, sex, address, role_id, false);
                int account_id = account_dao.getAccountIdByEmail(email);
                String activationCode = java.util.Base64.getEncoder().encodeToString(Integer.toString(account_id).getBytes());
                String baseUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
                Email.sendEmail(email, activationCode, baseUrl);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else if (action.equals("login")) {
            String user_name = request.getParameter("user_name");
            String password = request.getParameter("password");
            String remember = request.getParameter("agreeCheckboxUser");

            if (user_name.isEmpty() || password.isEmpty()) {
                request.setAttribute("error", "Bạn chưa nhập tên tài khoản hoặc mật khẩu!");
                request.getRequestDispatcher("login.jsp").forward(request, response);

            } else {
                AccountDAO accountDAO = new AccountDAO();
                Account account = accountDAO.login(user_name, password);
                if (account == null) {
                    request.setAttribute("error", "Tài khoản của bạn không đúng!");

                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else if (account.getStatus() == false) {
                    request.setAttribute("error", "Tài khoản của bạn chưa được kích hoạt!");

                    request.getRequestDispatcher("login.jsp").forward(request, response);

                } else {

//                    HttpSession oldSession = request.getSession(false);
//                    if (oldSession != null) {
//                        oldSession.invalidate();
//                    }
                    HttpSession session = request.getSession(true);
                    session.setAttribute("account", account);
                    session.setMaxInactiveInterval(1800);
                    // add new token
//                    String token = UUID.randomUUID().toString();
//                    session.setAttribute("token", token);

                    session.setAttribute("username", account.getAccount_name());

                    HttpSession sess = request.getSession();
                    sess.setAttribute("acc", user_name);
                    sess.setAttribute("accID", String.valueOf(account.getAccount_id()));
                    System.out.println(sess.getAttribute("accID"));
                    Cookie cuser_name = new Cookie("cookie_username", user_name);
                    Cookie cpassword = new Cookie("cookie_password", password);
                    Cookie cremmember = new Cookie("cookie_remember", remember);
                    AccountDAO ac = new AccountDAO();
                    String fullname = ac.getFullnameByUser(user_name);
                    String address = ac.getAddressByUser(user_name);
                    String email = ac.getEmailByUser(user_name);
                    int id = ac.getIdByAccountName(user_name);
                    String avatar = ac.getAvatarById(String.valueOf(id));
                    int role = ac.getRoleByname(user_name);
                    Date dob = ac.getDOBByUser(user_name);
                    int sex = ac.getSexByUser(user_name);
                    int balance = ac.getBalanceByUser(user_name);
                    String phonenumber = ac.getPhonenumberByUser(user_name);
                    char fln = fullname.charAt(0);
                    session.setAttribute("fullname", fullname);
                    session.setAttribute("address", address);
                    session.setAttribute("email", email);
                    session.setAttribute("phonenumber", phonenumber);
                    session.setAttribute("dob", dob);
                    session.setAttribute("fln", fln);
                    session.setAttribute("sex", sex);
                    session.setAttribute("balance", balance);
                    session.setAttribute("avatar", avatar);
                    session.setAttribute("role", role);
                    if (remember != null) {
                        cuser_name.setMaxAge(60 * 60 * 24 * 7);
                        cpassword.setMaxAge(60 * 60 * 24 * 3);
                        cremmember.setMaxAge(60 * 60 * 24 * 7);
                    } else {
                        cuser_name.setMaxAge(0);
                        cpassword.setMaxAge(0);
                        cremmember.setMaxAge(0);
                    }
                    Role roleid = account.getRole();
                    response.addCookie(cuser_name);
                    response.addCookie(cpassword);
                    response.addCookie(cremmember);
                    response.sendRedirect("home");

                }

            }

        } else if (action.equals("logout")) {
            HttpSession session = request.getSession(false); // Lấy session hiện tại, không tạo mới
            if (session != null) {
                session.invalidate(); // Xóa toàn bộ session
            }
            response.sendRedirect("home");
        } else if (action.equals("logout2")) {
            HttpSession session = request.getSession(false); // Lấy session hiện tại, không tạo mới
            if (session != null) {
                session.invalidate(); // Xóa toàn bộ session
            }
            response.sendRedirect("home");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            processRequest(req, resp);
        } catch (ParseException ex) {
            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            processRequest(req, resp);
        } catch (ParseException ex) {
            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

//        int result = account_dao.Register(account_name, email, password, full_name, phone_number, dateOfBirth, sex, address, role_id, false);
//        if (result == 1) {
//            Email.sendEmail(email, "Hello Long");
//        } else {
//            response.getWriter().println("Thất bại");
//        }
// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
/**
 * Handles the HTTP <code>GET</code> method.
 *
 * @param request servlet request
 * @param response servlet response
 * @throws ServletException if a servlet-specific error occurs
 * @throws IOException if an I/O error occurs
 */
/**
 * Handles the HTTP <code>POST</code> method.
 *
 * @param request servlet request
 * @param response servlet response
 * @throws ServletException if a servlet-specific error occurs
 * @throws IOException if an I/O error occurs
 */
/**
 * Returns a short description of the servlet.
 *
 * @return a String containing servlet description
 */

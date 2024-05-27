package controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.AccountDAO;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/forgotPassword")
public class ForgotPasswordController extends HttpServlet {

    private static final long OTP_VALIDITY_PERIOD = 15 * 60 * 1000;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long generationTime = System.currentTimeMillis();
        String email = request.getParameter("email");
        AccountDAO dao = new AccountDAO();
        if (!email.contains("@")) {

            try {
                email = dao.getEmailByUser(email);
                if (email == null) {
                    throw new Exception();
                }
            } catch (SQLException ex) {
                Logger.getLogger(ForgotPasswordController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                request.setAttribute("message2", "Account name is wrong or not exist");
                RequestDispatcher dispatcher = request.getRequestDispatcher("forgotPassword.jsp");
                dispatcher.forward(request, response);

            }
        }
        try {
            if (!dao.isEmailExist(email)) {
                throw new Exception();
            }
        } catch (SQLException ex) {
            Logger.getLogger(ForgotPasswordController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            request.setAttribute("message2", "EMAIL IS NOT IN DATABASE");
            RequestDispatcher dispatcher = request.getRequestDispatcher("forgotPassword.jsp");
            dispatcher.forward(request, response);
            return;
        }

        RequestDispatcher dispatcher = null;
        int otpvalue = 0;
        HttpSession mySession = request.getSession();

        if (email != null && !email.equals("")) {
            // sending otp
            Random rand = new Random();
            otpvalue = rand.nextInt(999999);

            String to = email; // change accordingly
            // Get the session object
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");
            Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("ngoquochuyvn2004@gmail.com", "neqv kair sjxa ccxb"); // Put your email
                    // id and
                    // password here
                }
            });
            // compose message
            try {
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress("ngoquochuyvn2004@gmail.com")); // change accordingly
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

                message.setSubject("OTP for Password Reset");
                message.setText("\nYour OTP is: " + otpvalue
                        + ". Please note that your OTP will expired in 15 minutes ");
                // send message
                Transport.send(message);
                System.out.println("Message sent successfully");
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
            dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
            request.setAttribute("message", "OTP is sent to your email id");
            mySession.setAttribute("otp", otpvalue);
            mySession.setAttribute("email", email);
            mySession.setAttribute("otpGenerationTime", generationTime);
            dispatcher.forward(request, response);
        }
    }
}

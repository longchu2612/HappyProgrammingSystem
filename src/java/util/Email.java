/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.activation.DataHandler;
import javax.activation.DataSource;

/**
 *
 * @author asus
 */
public class Email {

    private static final String from = "chuhonglong26122000@gmail.com";
    private static final String password = "gkeegyixpnzgtmjm";

    public static boolean sendEmail(String to, String content) {
        // Properties: khai bao cac thuoc tinh
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // Create Authenticator
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }

        };

        // Phien lam viec
        Session session = Session.getInstance(props, auth);

        // Gui email
        MimeMessage msg = new MimeMessage(session);
        try {
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            msg.setFrom(from);
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            //tieu de
            msg.setSubject("Confirm Account");
            //QUy dinh ngay gui
            msg.setSentDate(new Date());
            //Noi dung
           String link = "http://localhost:9999/HappyProgrammingSystem/verify?code="+ content;
           
            msg.setText("Please click the following link to activate your account:\n" + link, "UTF-8");
            // Gui email
            Transport.send(msg);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }
    public static void main(String[] args) {
        Email.sendEmail("minhpche153232@fpt.edu.vn", "minhpche153232@fpt.edu.vn");
    }
    

}

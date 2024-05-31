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
import dao.AccountDAO;
import dao.CVDAO;
import dao.SkillsDAO;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import model.Account;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import static java.nio.file.StandardCopyOption.REPLACE_EXISTING;
import java.util.ArrayList;
import model.CV;
import model.CV_skill;
import model.Skill;
import model.Skill_displayed;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class ProfileController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProfileController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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

        HttpSession sess = request.getSession();

        if (sess.getAttribute("acc") != null) {

            String acc = String.valueOf(sess.getAttribute("acc"));
            AccountDAO a = new AccountDAO();
            int accountID = a.getIdByAccountName(acc);

            if (a.getRoleById(String.valueOf(accountID)) == 2) {

                Account ac = a.getUsersById(String.valueOf(accountID));
                CVDAO c = new CVDAO();
                String checkGender = "checked=\"\"";
                
                if (ac.getSex()) {

                    request.setAttribute("male", checkGender);
                } else {

                    request.setAttribute("female", checkGender);
                }

                request.setAttribute("ac", ac);

                if (c.checkCVExistanceById(String.valueOf(accountID))) {

                    SkillsDAO s = new SkillsDAO();
                    CV cv = c.getCVByAccountId(String.valueOf(accountID));
                    ArrayList<Skill> data1 = s.getSkills();
                    ArrayList<CV_skill> data2 = s.getCVSkillsByCVId(cv.getId());
                    ArrayList<Skill_displayed> data = new ArrayList<Skill_displayed>();

                    if (data2.isEmpty()) {

                        for (int i = 0; i < data1.size(); i++) {
                            Skill sk = data1.get(i);
                            data.add(new Skill_displayed("", sk.getId(), sk.getName()));
                        }
                    } else {

                        for (int i = 0; i < data1.size(); i++) {

                            Skill sk = data1.get(i);

                            for (int j = 0; j < data2.size(); j++) {

                                CV_skill cs = data2.get(j);

                                if (sk.getId().equals(cs.getSkill_id())) {

                                    data.add(new Skill_displayed("checked=\"\"", sk.getId(), sk.getName()));
                                    break;
                                }

                                if (j == (data2.size() - 1)) {
                                    data.add(new Skill_displayed("", sk.getId(), sk.getName()));
                                }
                            }
                        }
                    }

                    request.setAttribute("cv", cv);
                    request.setAttribute("data", data);
                    request.getRequestDispatcher("profile-settings.jsp").forward(request, response);
                } else if (c.checkCVExistanceById(String.valueOf(accountID)) == false) {

                    request.getRequestDispatcher("profile-settings-withoutCV.jsp").forward(request, response);
                }
            } else if (a.getRoleById(String.valueOf(accountID)) == 1) {

                Account ac = a.getUsersById(String.valueOf(accountID));

                if (ac.getSex()) {

                    request.setAttribute("male", "checked=\"checked\"");
                } else {

                    request.setAttribute("female", "checked=\"checked\"");
                }

                request.setAttribute("ac", ac);
                request.getRequestDispatcher("profile-settings-mentee.jsp").forward(request, response);
            }

        } else {

            response.sendRedirect("index.html");
        }
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

        HttpSession sess = request.getSession();
        String acc = String.valueOf(sess.getAttribute("acc"));
        AccountDAO a = new AccountDAO();
        CVDAO c = new CVDAO();
        int accountID = a.getIdByAccountName(acc);

        if (request.getParameter("do").equals("cv")) {

            String avatar = a.getAvatarById(String.valueOf(accountID));
            c.createNewCV(String.valueOf(accountID), avatar);
            response.sendRedirect("/HappyProgrammingSystem/profile");
        } else if (request.getParameter("do").equals("save")) {

            String account_name = request.getParameter("account");
            String name = request.getParameter("fullname");
            String sex = "";

            if (request.getParameter("sex").equals("m")) {

                sex = "1";
            } else if (request.getParameter("sex").equals("f")) {

                sex = "0";
            }

            String dob = request.getParameter("dob");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            Part part = request.getPart("avatar");

            String job = request.getParameter("job");
            String introduction = request.getParameter("introduction");
            String achievements = request.getParameter("achievements");

            String tempPath = request.getServletContext().getRealPath("/temp");
            String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();
            String avatar = "";
            if (filename.equals("")) {

                avatar = a.getAvatarById(String.valueOf(accountID));
            } else {

                part.write(tempPath + "/" + filename);
                Path source = Paths.get(tempPath + "/" + filename);
                String realPath = request.getServletContext().getRealPath("/uploads");
                String fullpath = realPath + "\\" + String.valueOf(accountID) + ".png";
                System.out.println(fullpath);
                avatar = "uploads/" + String.valueOf(accountID) + ".png";
                Files.move(source, source.resolveSibling(fullpath), REPLACE_EXISTING);
            }

            SkillsDAO s = new SkillsDAO();
            String[] arr = new String[s.getNumberOfSkill()];
            ArrayList<Skill> data = s.getSkills();

            for (int i = 0; i < data.size(); i++) {

                Skill sk = data.get(i);
                arr[i] = request.getParameter("skill" + String.valueOf(sk.getId()));
            }

            CV cv = c.getCVByAccountId(String.valueOf(accountID));
            s.deleteAllSelectedSkillById(cv.getId());

            for (int i = 0; i < arr.length; i++) {
                if (arr[i] != null) {
                    s.insertSelectedSkillByCVId(cv.getId(), arr[i]);
                }
            }

            c.updateCVByAccountId(String.valueOf(accountID), avatar, job, introduction, achievements);
            a.updateAccountById(String.valueOf(accountID), account_name, email, name, phone, dob, sex, address, avatar);
            response.sendRedirect("/HappyProgrammingSystem/profile");
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
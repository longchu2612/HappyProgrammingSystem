/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.SQLException;

import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.internet.ParseException;
import model.Account;
import model.Mentor;
import model.Role;

/**
 *
 * @author asus
 */
public class AccountDAO extends DBContext {

    public int Register(String accountName, String email, String password, String fullName, String phoneNumber, java.sql.Date dob, boolean sex, String address, int roleId, boolean status) throws SQLException {

        int result = 0;
        String sql = "Insert into dbo.Account (name, email, password, fullname, phonenumber, dob, sex, address, roleID, status) \n"
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        try {

            ps = conn.prepareStatement(sql);
            ps.setString(1, accountName);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, fullName);
            ps.setString(5, phoneNumber);
            ps.setDate(6, dob);
            ps.setInt(7, (sex) ? 1 : 0);
            ps.setString(8, address);
            ps.setInt(9, roleId);

            ps.setInt(10, (status) ? 1 : 0);
            result = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("An error occurred while inserting the account: " + e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    public Account checkAccount(String username, String email) throws SQLException {
        String sql = "select * from dbo.Account where email = ? or name = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                int role_id = rs.getInt("roleID");
                Role role = new Role(role_id);
                String account_name = rs.getString("name");
                String email_2 = rs.getString("email");
                String password = rs.getString("password");
                String fullname = rs.getString("fullname");
                int phone_number = rs.getInt("phonenumber");
                Date dob = rs.getDate("dob");
                Account account = new Account(account_name, email_2, password, fullname, phone_number, dob, role);
                return account;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int verifyAccount(String email) throws SQLException {

        int result = 0;
        String sql = "UPDATE dbo.Account SET status = 1 WHERE email = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            result = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;

    }

    public Account getAccPf(int id) {
        String sql = "SELECT a.*, r.* FROM Account a INNER JOIN Role r ON a.roleID = r.roleID WHERE a.id = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account acc = new Account();
                acc.setAccount_id(rs.getInt("id"));
                acc.setAvatar(rs.getString("avatar"));
                acc.setAccount_name(rs.getString("name"));
                acc.setPhone(rs.getInt("phonenumber"));
                acc.setFullname(rs.getString("fullname"));
                acc.setEmail(rs.getString("email"));
                acc.setDateOfBirth(rs.getDate("dob"));
                acc.setSex(rs.getBoolean("sex"));
                acc.setBalance(rs.getInt("balance"));
                acc.setAddress(rs.getString("address"));
                Role role = new Role(rs.getInt("roleID"), rs.getString("roleName"));
                acc.setRole(role);
                return acc;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateAccount(Account account) {
        try {
            String sql = "UPDATE [Account] SET name=?, fullname=?, phonenumber=?, dob=?, sex=?, address=?, avatar=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, account.getAccount_name());
            ps.setString(2, account.getFullname());
            ps.setInt(3, account.getPhone());
            ps.setDate(4, account.getDateOfBirth());
            ps.setBoolean(5, account.getSex());
            ps.setString(6, account.getAddress());
            ps.setString(7, account.getAvatar());
            ps.setInt(8, account.getAccount_id());

            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("SQL error: " + e.getMessage());
        }
    }

    public Mentor getMentorPf(int id) {
        String sql = "SELECT account.id, account.name, account.email, account.password, account.fullname, account.sex, account.dob, account.address, account.avatar, account.balance,\n"
                + "cv.id, cv.job, cv.introduction, cv.achievements,\n"
                + "cv_skill.rating_star, skill.name, r.*\n"
                + "FROM account\n"
                + "JOIN cv ON account.id = cv.accountID \n"
                + "JOIN cv_skill ON cv.id = cv_skill.cv_id\n"
                + "JOIN skill ON CV_skill.skill_id = Skill.id\n"
                + "JOIN Role r ON account.roleID = r.roleID\n"
                + "WHERE account.id = 1;";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Mentor mentor = new Mentor();
                mentor.setAccount_id(rs.getInt("id"));
                mentor.setAvatar(rs.getString("avatar"));
                mentor.setAccount_name(rs.getString("name"));
                mentor.setPhone(rs.getInt("phonenumber"));
                mentor.setFullname(rs.getString("fullname"));
                mentor.setEmail(rs.getString("email"));
                mentor.setDateOfBirth(rs.getDate("dob"));
                mentor.setSex(rs.getBoolean("sex"));
                mentor.setBalance(rs.getInt("balance"));
                mentor.setAddress(rs.getString("address"));
                mentor.setCV_id(rs.getInt("cv_id"));
                mentor.setJob(rs.getString("job"));
                mentor.setIntroduction(rs.getString("introduction"));
                mentor.setAchievements(rs.getString("achievements"));
                mentor.setRating_star(rs.getInt("rating_star"));
                mentor.setSkill(rs.getString("skill_name"));
                Role role = new Role(rs.getInt("role_id"), rs.getString("role_name"));
                mentor.setRole(role);
                return mentor;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public Account login(String email, String password) {
        String sql = " SELECT account.*, role.roleID, role.roleName\n"
                + "FROM account\n"
                + "JOIN role ON account.roleID = role.roleID\n"
                + "WHERE email = ? AND password = ?;";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Account acc = new Account();
                    acc.setAccount_id(rs.getInt("id"));
                    acc.setAvatar(rs.getString("avatar"));
                    acc.setAccount_name(rs.getString("name"));
                    acc.setPhone(rs.getInt("phonenumber"));
                    acc.setFullname(rs.getString("fullname"));
                    acc.setEmail(rs.getString("email"));
                    acc.setDateOfBirth(rs.getDate("dob"));
                    acc.setSex(rs.getBoolean("sex"));
                    acc.setBalance(rs.getInt("balance"));
                    acc.setAddress(rs.getString("address"));
                    Role role = new Role(rs.getInt("roleID"), rs.getString("roleName"));
                    acc.setRole(role);
                    return acc;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) throws SQLException, java.text.ParseException {

        AccountDAO acc = new AccountDAO();
        Account a = acc.login("something5@gmail.com", "12345678");
        System.out.println(a);
    }
}

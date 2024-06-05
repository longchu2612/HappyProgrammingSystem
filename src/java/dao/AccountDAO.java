/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dao.DBContext;
import java.io.InputStream;
import java.sql.SQLException;

import java.text.SimpleDateFormat;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.sql.Date;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.internet.ParseException;
import model.Account;
import model.Role;
import java.sql.*;

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

            PreparedStatement ps = conn.prepareStatement(sql);
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

    public int registerAdmin(String account_name, String fullName, String email, String password, int role_id) {
        int result = 0;
        String sql = "Insert into dbo.Account (name, email, password, fullname,roleID) \n"
                + "VALUES (?, ?, ?, ?, ?);";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, account_name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, fullName);
            ps.setInt(5, role_id);
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
            PreparedStatement ps = conn.prepareStatement(sql);
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
                Account account = new Account(account_name, email_2, password, fullname, phone_number, dob, role, rs.getBoolean("status"));
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
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            result = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;

    }

    public Account login(String username, String password) {
        String sql = " select * from dbo.Account where name = ? and  password = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role role = new Role(rs.getInt("roleID"));
                Account account = new Account(rs.getString("name"), rs.getString("email"), rs.getString("password"), rs.getString("fullname"), rs.getInt("phonenumber"), rs.getDate("dob"), role, rs.getBoolean("status"));
                return account;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) throws SQLException, java.text.ParseException {

        String startDateString = "08/05/2024";
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");

//        String dateTimeString = "20/02/2002"; // Chuỗi ngày và giờ
        Date dob = Date.valueOf(sdf2.format(sdf.parse(startDateString)));
//        
//      
        AccountDAO account_dao = new AccountDAO();
        int result = account_dao.Register("KhanhNam", "longchhe153093@fpt.edu.vn", "Chulong123", "Chu Hồng Long", "0585703546", dob, true, "Lao Cai", 0, false);
        System.out.println(result);
    }

    public void updatePasswordbyusername(String name, String newPassword) {
        String sql = "UPDATE Account SET password = ? WHERE name = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, name);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("updatePassword: " + e.getMessage());
        }
    }

    public void updatePassword(String email, String newPassword) {
        String sql = "UPDATE Account SET password = ? WHERE email = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("updatePassword: " + e.getMessage());
        }
    }

    public String getEmailByUser(String user) throws SQLException {
        String sql = "Select email from Account where name = ?";
        String email = "";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, user);
        rs = ps.executeQuery();
        if (rs.next()) {
            email = rs.getString("email");
            return email;
        }
        return null;
    }

    public String getPassByUser(String user) throws SQLException {
        String sql = "Select password from Account where name = ?";
        String password = "";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, user);
        rs = ps.executeQuery();
        if (rs.next()) {
            password = rs.getString("password");
            return password;
        }
        return null;
    }

    public String getFullnameByUser(String user) throws SQLException {
        String sql = "Select fullname from Account where name = ?";
        String fullname = "";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, user);
        rs = ps.executeQuery();
        if (rs.next()) {
            fullname = rs.getString("fullname");
            return fullname;
        }
        return null;
    }

    public Date getDOBByUser(String user) throws SQLException {
        String sql = "SELECT dob FROM Account WHERE name = ?";
        Date dob = null;

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    dob = rs.getDate("dob");
                }
            }
        }

        return dob;
    }

    public String getAddressByUser(String user) throws SQLException {
        String sql = "Select address from Account where name = ?";
        String address = "";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, user);
        rs = ps.executeQuery();
        if (rs.next()) {
            address = rs.getString("address");
            return address;
        }
        return null;
    }

    public String getPhonenumberByUser(String user) throws SQLException {
        String sql = "Select phonenumber from Account where name = ?";
        String phonenumber = "";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, user);
        rs = ps.executeQuery();
        if (rs.next()) {
            phonenumber = rs.getString("phonenumber");
            return phonenumber;
        }
        return null;
    }


    public boolean isEmailExist(String email) throws SQLException {
        String sql = "Select email from Account where email = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, email);
        rs = ps.executeQuery();
        if (rs.next()) {
            return true;
        }
        return false;
    }

    public void updateUsername(String name, String newname) {
        String sql = "UPDATE Account SET name = ? WHERE name = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newname);
            ps.setString(2, name);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public void updateUserfullname(String name, String newfullname) {
        String sql = "UPDATE Account SET fullname = ? WHERE name = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newfullname);
            ps.setString(2, name);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public void updateAddress(String name, String newAddress) {
        String sql = "UPDATE Account SET address = ? WHERE name = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newAddress);
            ps.setString(2, name);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public void updatePhonenumber(String name, String newPhonenumber) {
        String sql = "UPDATE Account SET phonenumber = ? WHERE name = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newPhonenumber);
            ps.setString(2, name);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }
    public int getSexByUser(String name) throws SQLException {
        String sql = "Select sex from Account where name = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, name);
        rs = ps.executeQuery();
        boolean sex = false;
        if (rs.next()) {
            sex = rs.getBoolean("sex");
        }
        int sex1 = sex ? 1 : 0;
        return sex1;
    }
    public void updateSex(String name, int sex) {
        String sql = "UPDATE Account SET sex = ? WHERE name = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, sex);
            ps.setString(2, name);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void updateDOB(String name, Date date) {
        String sql = "UPDATE Account SET dob = ? WHERE name = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setDate(1, date);
            ps.setString(2, name);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
     public int getBalanceByUser(String name) throws SQLException {
        String sql = "Select balance from Account where name = ?";
        int balance = 0;
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, name);
        rs = ps.executeQuery();
        if (rs.next()) {
            balance = rs.getInt("balance");
            return balance;
        } 
        return 0;
}
         public boolean saveImage(String fileName, byte[] imageData, String name) {
       
        String sql = "INSERT INTO avatar (file_name, image) VALUES (?, ?) where name = ?";

        try {
             PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, fileName);
            ps.setBytes(2, imageData);
              ps.setString(3,name);

            int row = ps.executeUpdate();
            return row > 0;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        } 
}
}


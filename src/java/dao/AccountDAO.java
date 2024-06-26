/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

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
    
    public int registerAdmin(String account_name, String fullName,String email, String password, int role_id ){
        int result =0;
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
                Account account = new Account(account_name, email_2, password, fullname, phone_number, dob, role,rs.getBoolean("status"));
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
    
    public Account login(String username, String password) {
        String sql = " select * from dbo.Account where name = ? and  password = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while(rs.next()){ 
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
}

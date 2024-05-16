/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.SQLException;
import java.sql.Date;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.ArrayList;

import java.util.List;

/**
 *
 * @author asus
 */
public class AccountDAO extends DBContext {

    public void Register(String accountName, String email, String password, String fullName, String phoneNumber, LocalDate dob, boolean sex, String address, int roleId, boolean status) throws SQLException {

        String sql = "Insert into dbo.Account (name, email, password, fullname, phonenumber, dob, sex, address, roleID, status) \n"
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        try {

            ps = conn.prepareStatement(sql);
            ps.setString(1, accountName);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, fullName);
            ps.setString(5, phoneNumber);
            Date dobDate = Date.valueOf(dob);
            ps.setDate(6, dobDate);
            ps.setInt(7, (sex) ? 1 : 0);
            ps.setString(8, address);
            ps.setInt(9, roleId);
            ps.setInt(10, (status) ? 1 : 0);
            ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
    }
    
    public static void main(String[] args) throws SQLException {
        AccountDAO accountDAO = new AccountDAO();
        accountDAO.Register("longchhe", "ieieee", "345555", "Chu long", "0912345612",LocalDate.MIN, true, "Phu tho", 1, true);
    }
}

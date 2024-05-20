/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import model.User;

public class UserDAO extends DBContext{
    
     public User getUserByUsername(String username) {
        String sql = "SELECT * FROM USERS WHERE name = ? or email = ?";
        User user = new User();
        try {
            PreparedStatement ps =  connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user.setName(rs.getString("name"));
                user.setPassword(rs.getString("password"));
                user.setFullname(rs.getString("fullname"));
                user.setSex(rs.getInt("sex"));
                user.setDob(rs.getDate("dob"));
                user.setAvatar(rs.getString("avatar"));
                user.setEmail(rs.getString("email"));
                user.setCreated_at(rs.getDate("created_at"));
                user.setModified_at(rs.getDate("modified_at"));
                user.setRoleID(rs.getInt("roleID"));
                user.setBalance(rs.getDouble("balance"));
            }
        } catch (Exception e) {
            System.out.println("getUserByUsername: " + e.getMessage());
        }
        return user;
    }
         public boolean checkExistedUserWithUsernameAndPassword(String name, String password) {
        String sql = "SELECT * FROM USERS WHERE (name = ? or email = ?) AND password = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, name);
            ps.setString(3, password);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            System.out.println("checkExistedUserWithUsernameAndPassword: " + e.getMessage());
        }
        return false;
    }
public boolean checkExistedUserWithUsername(String name) {
        String sql = "SELECT * FROM USERS WHERE name = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            System.out.println("checkExistedUserWithUsername: " + e.getMessage());
        }
        return false;
    }
    public void updatePassword(String name, String newPassword) {
        String sql = "UPDATE Users SET password = ? WHERE name = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, name);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("updatePassword: " + e.getMessage());
        }
    }

}

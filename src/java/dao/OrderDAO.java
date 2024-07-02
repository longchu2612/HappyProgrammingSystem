/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.*;
import model.*;

/**
 *
 * @author catmi
 */
public class OrderDAO extends DBContext{
    public ArrayList<Order> getAllOrders(String txtStatus) {
        ArrayList<Order> list = new ArrayList<>();
        String query = """
                       INSERT INTO [dbo].[Order]([menteeId],[mentorId],[total],[createDate],[courseId])
                       VALUES(42, 41, 10000, GETDATE(),1) """;
        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setString(1, txtStatus);
            rs = ps.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String fullname = rs.getString("fullname");
                String accountID = rs.getString("accountID");
                String job = rs.getString("job");
                String status = rs.getString("status");
                String note = rs.getString("note");
                
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
        return null;
    }
    public boolean insertOrder(String menteeId, String mentorId, String total, String courseId) {
        String query = """
                       INSERT INTO [dbo].[Order]([menteeId],[mentorId],[total],[createDate],[courseId])
                       VALUES(?, ?, ?, GETDATE(), ?) """;
        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setString(1, menteeId);
            ps.setString(2, mentorId);
            ps.setString(3, total);
            ps.setString(4, courseId);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
        return false;
    }
    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        boolean check = dao.insertOrder("42", "42", "10000", "2");
        System.out.println(check);
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
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
                       VALUES(?, ?, ?, GETDATE(),1) """;
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
    public boolean insertOrder(String menteeId, String mentorId, String total, String date) {
        String query = """
                       INSERT INTO [dbo].[Order]([menteeId],[mentorId],[total],[createDate])
                       VALUES(?, ?, ?, ?) """;
        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setString(1, menteeId);
            ps.setString(2, mentorId);
            ps.setString(3, total);
            ps.setString(4, date);
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
    public boolean updateMoney(int menteeId, int total){
        String query = """
                       update Account set balance = ?
                       where id = ? """;
        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setInt(1, total);
            ps.setInt(2, menteeId);
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
    public boolean updateHold(int userId, int hold){
        String query = """
                       update Account set hold = ?
                       where id = ? """;
        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setInt(1, hold);
            ps.setInt(2, userId);
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
    public boolean insertBalanceChange(int acc_id, String content, Timestamp change_date){
        String query = """
                       insert into Balance_Change(acc_id,content,change_date) 
                       values(?,?,?)""";
        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setInt(1, acc_id);
            ps.setString(2, content);
            ps.setTimestamp(3, change_date);
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
    public int checkMoney(int id,int amount){
        String query = """
                       select (balance - hold) as CurrentBalance
                       from Account
                       where id = ?""";
        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int balance = rs.getInt("CurrentBalance");
                return balance - amount;
                
            }
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
        return 0;
    }
    public ArrayList<Balance_Change> getAllBalanceChange(int txtacc_id){
        ArrayList<Balance_Change> list = new ArrayList<>();
        String query = """
                       select *
                       from Balance_Change
                       where acc_id = ?""";
        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setInt(1, txtacc_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int acc_id = rs.getInt("acc_id");
                String content = rs.getString("content");
                LocalDateTime change_date = Timestamp.valueOf(rs.getString("change_date")).toLocalDateTime();
                list.add(new Balance_Change(id, acc_id, content,change_date));
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
    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        boolean check = dao.insertOrder("42", "42", "10000", "2");
        System.out.println(check);
    }
}

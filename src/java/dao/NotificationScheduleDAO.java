/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Date;
import java.time.LocalDate;
import model.Notification_Schedule;

/**
 *
 * @author asus
 */
public class NotificationScheduleDAO extends DBContext {

    public int createNotificationSchedule(int mentor_id, int manager_id, String message, LocalDate created_at, int schedule_id) {
        int result = 0;
        String sql = "INSERT INTO [happy_programming_system].[dbo].[Notification_Schedule]\n"
                + "      ([mentor_id], [manager_id], [message], [created_at], [schedule_id])\n"
                + "VALUES (?, ?, ?, ?, ?);";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, mentor_id);
            ps.setInt(2, manager_id);
            ps.setString(3, message);
            ps.setDate(4, Date.valueOf(created_at));
            ps.setInt(5, schedule_id);
            result = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return result;
    }

    public Notification_Schedule checkNotificationScheduleExist(int mentor_id, int manager_id, int schedule_id) {
        Notification_Schedule notificationSchedule = null;
        String sql = "select * from dbo.Notification_Schedule where mentor_id = ? and manager_id = ? and schedule_id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, mentor_id);
            ps.setInt(2, manager_id);
            ps.setInt(3, schedule_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                notificationSchedule = new Notification_Schedule();
                notificationSchedule.setId(rs.getInt("id"));
                notificationSchedule.setMentor_id(rs.getInt("mentor_id"));
                notificationSchedule.setManager_id(rs.getInt("manager_id"));
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return notificationSchedule;
    }

    public int updateNotificationSchedule(int mentor_id, int manager_id, int schedule_id, String note, LocalDate created_at) {
        int result = 0;
        String sql = "UPDATE dbo.Notification_Schedule \n"
                + "SET message = ? , created_at = ? \n"
                + "WHERE mentor_id = ? AND manager_id = ? AND schedule_id = ?;";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, note);
            ps.setDate(2, Date.valueOf(created_at));
            ps.setInt(3, mentor_id);
            ps.setInt(4, manager_id);
            ps.setInt(5, schedule_id);
            result = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return result;
    }
    
    public String getNoteSchedule(int schedule_id){ 
        String message = null;
        String sql = "select [message] from dbo.Notification_Schedule where schedule_id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, schedule_id);
            rs = ps.executeQuery();
            while(rs.next()){ 
                message = rs.getString("message");
            }
        } catch (Exception ex) {
             System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return message;
    }

    public static void main(String[] args) {
        NotificationScheduleDAO notificationScheduleDAO = new NotificationScheduleDAO();

        String message = notificationScheduleDAO.getNoteSchedule(5);
        System.out.println(message);
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Time;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author asus
 */
public class ScheduleDAO extends DBContext {

    public int createNewSchedule(String startTime, String endTime, int dayOfWeek, int mentor_id) {
        int result = 0;
        
        String sql = "Insert into dbo.Schedules(start_time, end_time, day_of_week, mentor_id) VALUES (?,?,?,?);";
        try {
            ps = conn.prepareStatement(sql);
            ps.setTime(1, Time.valueOf(LocalTime.parse(startTime)));
            ps.setTime(2, Time.valueOf(LocalTime.parse(endTime)));
            ps.setInt(3, dayOfWeek);
            ps.setInt(4,mentor_id);
            result = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return result;
    }
    

}

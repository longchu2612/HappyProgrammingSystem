/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;
import java.time.temporal.WeekFields;

/**
 *
 * @author asus
 */
public class SlotDAO extends DBContext{
    
    public int deleteSchedule(int schedule_id, String startDate, String endDate) {
        int result = 0;
        String sql = "Delete from dbo.Slot where schedule_id = ? and teach_date between ? and ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, schedule_id);
            ps.setString(2, startDate);
            ps.setString(3, endDate);
            result = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return result;
    }
    
    public static void main(String[] args) {
        int year = 2024;
        int weekNumber = 18;
        int month = 5;

        LocalDate firstDayOfMonth = LocalDate.of(year, month, 1);
        LocalDate lastDayOfMonth = firstDayOfMonth.with(TemporalAdjusters.lastDayOfMonth());

        // Xác định ngày bắt đầu của tuần theo chuẩn ISO-8601
        LocalDate startOfWeek = LocalDate.of(year, 1, 1)
                .with(WeekFields.ISO.weekOfWeekBasedYear(), weekNumber)
                .with(DayOfWeek.MONDAY);

        // Xác định ngày kết thúc của tuần theo chuẩn ISO-8601
        LocalDate endOfWeek = startOfWeek.plusDays(6);

        System.out.println("Ngày đầu tiên của tháng: " + firstDayOfMonth);
        System.out.println("Ngày cuối cùng của tháng: " + lastDayOfMonth);
        System.out.println("Ngày bắt đầu của tuần " + weekNumber + ": " + startOfWeek);
        System.out.println("Ngày kết thúc của tuần " + weekNumber + ": " + endOfWeek);
    }
    
}
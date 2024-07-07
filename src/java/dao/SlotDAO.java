/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;
import java.time.temporal.WeekFields;
import java.util.ArrayList;
import java.util.List;
import model.Schedule;
import model.Slot;

/**
 *
 * @author asus
 */
public class SlotDAO extends DBContext {

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

    public int deleteSchedule(int schedule_id) {
        int result = 0;
        String sql = "Delete from dbo.Slot where schedule_id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, schedule_id);
            result = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return result;
    }
    
    public void deleteScheduleByDateAndScheduleId(int schedule_id, LocalDate teach_date){ 
        String sql = "Delete from dbo.Slot where schedule_id = ? and teach_date = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, schedule_id);
            ps.setString(2, teach_date.toString());
            ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
    }
    
    public List<Slot> getAllSlotByDateAndScheduleId(int schedule_id, LocalDate teach_date) {
        List<Slot> slots = new ArrayList<>();
        String sql = "Select * from dbo.Slot where schedule_id = ? and teach_date = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, schedule_id);
            ps.setString(2, teach_date.toString());
            rs = ps.executeQuery();
            while (rs.next()) {
                Slot slot = new Slot();
                slot.setId(rs.getInt("id"));
                slot.setSlot(rs.getInt("slot"));
                slot.setDayOfWeek(rs.getInt("dayOfWeek"));
                slot.setTeach_date(rs.getDate("teach_date").toLocalDate());
                Schedule schedule = new Schedule();
                schedule.setId(rs.getInt("schedule_id"));
                slot.setSchedule(schedule);
                slots.add(slot);
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return slots;
    }
    
    public List<Slot> getAllSlotByScheduleDarft(int schedule_draft, LocalDate startOfWeek, LocalDate endOfWeek){ 
        List<Slot> slots = new ArrayList<>();
        String sql = "select * from dbo.Slot where schedule_id = ? and teach_date between ? and ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, schedule_draft);
            ps.setString(2, startOfWeek.toString());
            ps.setString(3, endOfWeek.toString());
            rs = ps.executeQuery();
            while(rs.next()){ 
                Slot slot = new Slot();
                slot.setSlot(rs.getInt("slot"));
                slot.setDayOfWeek(rs.getInt("dayOfWeek"));
                slot.setTeach_date(rs.getDate("teach_date").toLocalDate());
                slots.add(slot);
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return slots;
    }

    public static void main(String[] args) {
        int year = 2024;
        int weekNumber = 18;
        int month = 5;

//        LocalDate firstDayOfMonth = LocalDate.of(year, month, 1);
//        LocalDate lastDayOfMonth = firstDayOfMonth.with(TemporalAdjusters.lastDayOfMonth());

        // Xác định ngày bắt đầu của tuần theo chuẩn ISO-8601
//        LocalDate startOfWeek = LocalDate.of(year, 1, 1)
//                .with(WeekFields.ISO.weekOfWeekBasedYear(), weekNumber)
//                .with(DayOfWeek.MONDAY);
//
//        // Xác định ngày kết thúc của tuần theo chuẩn ISO-8601
//        LocalDate endOfWeek = startOfWeek.plusDays(6);
//
//        System.out.println("Ngày đầu tiên của tháng: " + firstDayOfMonth);
//        System.out.println("Ngày cuối cùng của tháng: " + lastDayOfMonth);
//        System.out.println("Ngày bắt đầu của tuần " + weekNumber + ": " + startOfWeek);
//        System.out.println("Ngày kết thúc của tuần " + weekNumber + ": " + endOfWeek);
//
//        SlotDAO slotDao = new SlotDAO();
//        LocalDate localDate = LocalDate.of(2024, 5, 9);
//        List<Slot> slots = slotDao.getAllSlotByDateAndScheduleId(3, localDate);
//        for (Slot slot : slots) {
//            System.out.println(slot.toString());
//        }
//        LocalDate monthStart = LocalDate.of(2024, 5, 1);
//        LocalDate monthEnd = monthStart.withDayOfMonth(monthStart.lengthOfMonth());
//        System.out.println(monthStart.toString());
//        System.out.println(monthEnd.toString());
          LocalDate startDate = LocalDate.of(2024,6,1);
          LocalDate endDate = LocalDate.of(2024,6,21);
          SlotDAO slot_dao = new SlotDAO();
//          List<Slot> slots = slot_dao.getAllSlotByScheduleDarft(2, startDate, endDate);
//          for(Slot slot : slots){ 
//              System.out.println(slot.toString());
//          }
          slot_dao.deleteSchedule(2, startDate.toString(), endDate.toString());
    }

}

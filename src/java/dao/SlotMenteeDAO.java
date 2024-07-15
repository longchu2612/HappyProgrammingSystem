/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.time.LocalDate;
import java.sql.Date;

/**
 *
 * @author asus
 */
public class SlotMenteeDAO extends DBContext {

    public int createSlotOfScheduleMentee(int slot, int dayOfWeek, int schedule_id, LocalDate learning_date, int skillID, boolean isAttend) {
        int result = 0;
        String sql = "INSERT INTO [happy_programming_system].[dbo].[Slot_Mentee]\n"
                + "    ([slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend])\n"
                + "VALUES\n"
                + "    (?,?,?,?,?,?);";
        
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, slot);
            ps.setInt(2, dayOfWeek);
            ps.setInt(3, schedule_id);
            ps.setDate(4, Date.valueOf(learning_date));
            ps.setInt(5, skillID);
            ps.setBoolean(6, isAttend);
            result = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return result;
    }
    
    public int deleteSchedule(int schedule_id, String startDate, String endDate) {
        int result = 0;
        String sql = "DELETE FROM dbo.Slot_Mentee WHERE schedule_id = ? and learning_date between ? and ? ";
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
        SlotMenteeDAO slot_mentee = new SlotMenteeDAO();
        int result = slot_mentee.createSlotOfScheduleMentee(1, 3, 23, LocalDate.now(), 21, false);
        System.out.println(result);
    }
}

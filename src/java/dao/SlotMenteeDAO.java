/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.time.LocalDate;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import model.Skill;
import model.SlotMentee;
import org.apache.tomcat.util.digester.ArrayStack;

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

    public void deleteSlotsOutsideDateRange(int schedule_id, String startDate, String endDate) {
        String sql = "DELETE FROM dbo.Slot_Mentee \n"
                + "  WHERE schedule_id = ? \n"
                + "  AND (learning_date < ? OR learning_date > ?);";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, schedule_id);
            ps.setDate(2, Date.valueOf(startDate));
            ps.setDate(3, Date.valueOf(endDate));
            ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
    }

    public List<SlotMentee> getAllSlotMenteeByDates(int schedule_id, String startDate, String endDate) {
        List<SlotMentee> slotMentees = new ArrayList<>();
        String sql = " select * from dbo.Slot_Mentee where schedule_id = ? and learning_date between ? and ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, schedule_id);
            ps.setString(2, startDate);
            ps.setString(3, endDate);
            rs = ps.executeQuery();
            while (rs.next()) {
                SlotMentee slotMentee = new SlotMentee();
                slotMentee.setSlot(rs.getInt("slot"));
                slotMentee.setDayOfWeek(rs.getInt("dayOfWeek"));
                slotMentee.setLearning_date(rs.getDate("learning_date").toLocalDate());
                Skill skill = new Skill();
                skill.setSkillId(rs.getInt("skillId"));
                slotMentee.setSkill(skill);
                slotMentee.setIsAttend(rs.getBoolean("isAttend"));
                slotMentees.add(slotMentee);
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return slotMentees;
    }

    public static void main(String[] args) {
        SlotMenteeDAO slot_mentee = new SlotMenteeDAO();
        slot_mentee.deleteSlotsOutsideDateRange(36, "2024-09-04", "2024-09-06");
        
    }
}

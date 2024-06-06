/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Time;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Account;
import model.Schedule;

/**
 *
 * @author asus
 */
public class ScheduleDAO extends DBContext {

    public int createNewSchedule(String startTime, String endTime, int dayOfWeek, int mentor_id, int month) {
        int result = 0;

        String sql = "Insert into dbo.Schedules(start_time, end_time, day_of_week, mentor_id, month) VALUES (?,?,?,?,?);";
        try {
            ps = conn.prepareStatement(sql);
            ps.setTime(1, Time.valueOf(LocalTime.parse(startTime)));
            ps.setTime(2, Time.valueOf(LocalTime.parse(endTime)));
            ps.setInt(3, dayOfWeek);
            ps.setInt(4, mentor_id);
            ps.setInt(5, month);
            result = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return result;
    }

    public List<Account> getAllAccountWithSchedule() {
        Map<Integer, Account> accountMap = new HashMap<>();
        String sql = "select account.id,account.fullname,schedule.day_of_week ,schedule.month, schedule.start_time, schedule.end_time,schedule.id \n"
                + "from dbo.Schedules as schedule inner join dbo.Account as account on schedule.mentor_id = account.id";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int account_id = rs.getInt("id");
                Account account = accountMap.get(account_id);

                if (account == null) {
                    account = new Account();
                    account.setAccount_id(account_id);
                    account.setFullname(rs.getString("fullname"));
                    account.setSchedules(new ArrayList<>());
                    accountMap.put(account_id, account);
                }
                Schedule schedule = new Schedule();
                schedule.setId(rs.getInt(7));
                schedule.setDayOfWeek(rs.getInt("day_of_week"));
                schedule.setMonth(rs.getInt("month"));
                schedule.setStartTime(rs.getTime("start_time").toLocalTime());
                schedule.setEndTime(rs.getTime("end_time").toLocalTime());
                account.getSchedules().add(schedule);
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return new ArrayList<>(accountMap.values());
    }

    public static void main(String[] args) {
        ScheduleDAO scheduleDAO = new ScheduleDAO();
        List<Account> accounts = scheduleDAO.getAllAccountWithSchedule();
        for (Account account : accounts) {
            System.out.println("Account ID: " + account.getAccount_id());
            System.out.println("Fullname: " + account.getFullname());
               
            System.out.println("Schedules:");
            for (Schedule schedule : account.getSchedules()) {
                System.out.println("  Day of Week: " + schedule.getDayOfWeek());
                System.out.println("  Month: " + schedule.getMonth());
                System.out.println("  Start Time: " + schedule.getStartTime());
                System.out.println("  End Time: " + schedule.getEndTime());
            }
            System.out.println("--------------------------------------------------");
        }
    }

}

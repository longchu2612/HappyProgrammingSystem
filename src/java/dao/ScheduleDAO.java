/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Time;
import java.time.LocalTime;
import java.time.LocalDateTime;
import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Account;
import model.Role;
import model.Schedule;

/**
 *
 * @author asus
 */
public class ScheduleDAO extends DBContext {

    public int createNewSchedule(String startTime, String endTime, int dayOfWeek, int mentor_id, int month, LocalDateTime currentTime) {
        int result = 0;

        String sql = "Insert into dbo.Schedules(start_time, end_time, day_of_week, mentor_id, month,status,create_time) VALUES (?,?,?,?,?,?,?);";
        try {
            ps = conn.prepareStatement(sql);
            ps.setTime(1, Time.valueOf(LocalTime.parse(startTime)));
            ps.setTime(2, Time.valueOf(LocalTime.parse(endTime)));
            ps.setInt(3, dayOfWeek);
            ps.setInt(4, mentor_id);
            ps.setInt(5, month);
            ps.setString(6, "1");
            ps.setObject(7, currentTime);
            result = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return result;
    }

    public List<Account> getAllAccountWithSchedule() {
        Map<Integer, Account> accountMap = new HashMap<>();
        String sql = "select account.id,account.fullname,schedule.day_of_week ,schedule.month, schedule.start_time, schedule.end_time,schedule.id from dbo.Schedules as schedule inner join dbo.Account as account on schedule.mentor_id = account.id "
                + "where schedule.status = 1";

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

    public int updateScheduleAcceptByMentorId(int mentor_id) {
        String sql = "Update dbo.Schedules set status = 2 where mentor_id = ?";
        int result = 0;
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, mentor_id);
            result = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return result;
    }

    public int updateScheduleRejectByMentorId(int mentor_id) {
        String sql = "Update dbo.Schedules set status = 3 where mentor_id = ?";
        int result = 0;
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, mentor_id);
            result = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return result;
    }

    public List<Account> getAllScheduleOfMentor(int mentor_id) {
        Map<Integer, Account> accountMap = new HashMap<>();
        String sql = "select account.id,account.fullname,account.phonenumber,role.roleName,schedule.day_of_week ,schedule.month, schedule.start_time, schedule.end_time,schedule.id,schedule.status from dbo.Schedules as schedule inner join dbo.Account as account on "
                + "schedule.mentor_id = account.id inner join dbo.Role as role on account.roleID = role.roleID where account.id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, mentor_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account account = accountMap.get(mentor_id);
                if (account == null) {
                    account = new Account();
                    account.setAccount_id(mentor_id);
                    account.setFullname(rs.getString("fullname"));
                    account.setPhone(Integer.parseInt(rs.getString("phonenumber")));
                    Role role = new Role();
                    role.setRoleName(rs.getString("roleName"));
                    account.setRole(role);
                    account.setSchedules(new ArrayList<>());
                    accountMap.put(mentor_id, account);
                }
                Schedule schedule = new Schedule();
                schedule.setId(rs.getInt(9));
                schedule.setDayOfWeek(rs.getInt("day_of_week"));
                schedule.setMonth(rs.getInt("month"));
                schedule.setStartTime(rs.getTime("start_time").toLocalTime());
                schedule.setEndTime(rs.getTime("end_time").toLocalTime());
                schedule.setStatus(rs.getString("status"));
                account.getSchedules().add(schedule);
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return new ArrayList<>(accountMap.values());
    }

    public static void main(String[] args) {
//        ScheduleDAO scheduleDAO = new ScheduleDAO();
//        List<Account> accounts = scheduleDAO.getAllScheduleOfMentor(41);
//        for (Account account : accounts) {
//            System.out.println("Account ID: " + account.getAccount_id());
//            System.out.println("Fullname: " + account.getFullname());
//            System.out.println("PhoneNumber: " + account.getPhone());
//            System.out.println("Role: " + account.getRole().getRoleName());
//            System.out.println("Schedules:");
//            for (Schedule schedule : account.getSchedules()) {
//                System.out.println("  Day of Week: " + schedule.getDayOfWeek());
//                System.out.println("  Month: " + schedule.getMonth());
//                System.out.println("  Start Time: " + schedule.getStartTime());
//                System.out.println("  End Time: " + schedule.getEndTime());
//                System.out.println("  Status: " + schedule.getStatus());
//            }
//            System.out.println("--------------------------------------------------");
//        }

    }

}

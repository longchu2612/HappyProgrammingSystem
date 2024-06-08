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
import java.util.Comparator;
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

        Map<String, Account> accountMap = new HashMap<>();
        String sql = "select account.id,account.fullname,schedule.day_of_week ,schedule.month, schedule.start_time, schedule.end_time,schedule.id,schedule.create_time, schedule.status\n"
                + "  from dbo.Schedules as schedule inner join dbo.Account as account on schedule.mentor_id = account.id \n"
                + "  where schedule.status = 1 order by schedule.create_time";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int account_id = rs.getInt(1);
                String fullName = rs.getString("fullname");

                LocalDateTime creatTime = rs.getTimestamp("create_time").toLocalDateTime();
                String key = creatTime.toString() + account_id;
                Account account = accountMap.get(key);

                if (account == null) {
                    account = new Account();
                    account.setAccount_id(account_id);
                    account.setFullname(rs.getString("fullname"));
                    account.setSchedules(new ArrayList<>());
                    accountMap.put(key, account);
                }
                Schedule schedule = new Schedule();
                schedule.setId(rs.getInt(7));
                schedule.setDayOfWeek(rs.getInt("day_of_week"));
                schedule.setMonth(rs.getInt("month"));
                schedule.setStartTime(rs.getTime("start_time").toLocalTime());
                schedule.setEndTime(rs.getTime("end_time").toLocalTime());
                schedule.setCreateTime(creatTime);
                account.getSchedules().add(schedule);
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        List<Account> accounts = new ArrayList<>(accountMap.values());
        accounts.sort(Comparator.comparing(account -> {
            List<Schedule> schedules = account.getSchedules();
            if (schedules != null && !schedules.isEmpty()) {
                return schedules.get(0).getCreateTime();
            } else {
                return LocalDateTime.MAX; // Để những account không có schedule sẽ đứng cuối danh sách
            }
        }));
        return accounts;
    }

    public int updateScheduleAcceptByMentorId(int mentor_id, LocalDateTime create_time) {
        String sql = "Update dbo.Schedules set status = 2 where mentor_id = ? and create_time = ?";
        int result = 0;
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, mentor_id);
            ps.setString(2, create_time.toString());
            result = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return result;
    }

    public int updateScheduleRejectByMentorId(int mentor_id, LocalDateTime create_time) {
        String sql = "Update dbo.Schedules set status = 3 where mentor_id = ? and create_time = ?";
        int result = 0;
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, mentor_id);
            ps.setString(2, create_time.toString());
            result = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return result;
    }

    public List<Account> getAllScheduleOfMentor(int mentor_id) {
        Map<LocalDateTime, Account> accountMap = new HashMap<>();
        String sql = "select account.id,account.fullname,schedule.day_of_week ,schedule.month, schedule.start_time, schedule.end_time,schedule.id,schedule.create_time, schedule.status from dbo.Schedules as schedule inner join "
                + "dbo.Account as account on schedule.mentor_id = account.id where account.id = ? order by schedule.create_time";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, mentor_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                
                String account_name = rs.getString("fullname");
                LocalDateTime createTime = rs.getTimestamp("create_time").toLocalDateTime();
                Account account = accountMap.get(createTime);
                if (account == null) {
                    account = new Account();
                    account.setAccount_id(mentor_id);
                    account.setFullname(account_name);
                    
                    
                  
                    account.setSchedules(new ArrayList<>());
                    accountMap.put(createTime, account);
                }
                Schedule schedule = new Schedule();
                schedule.setId(rs.getInt(7));
                schedule.setDayOfWeek(rs.getInt("day_of_week"));
                schedule.setMonth(rs.getInt("month"));
                schedule.setStartTime(rs.getTime("start_time").toLocalTime());
                schedule.setCreateTime(createTime);
                schedule.setEndTime(rs.getTime("end_time").toLocalTime());
                schedule.setStatus(rs.getString("status"));
                account.getSchedules().add(schedule);
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        List<Account> accounts = new ArrayList<>(accountMap.values());
        accounts.sort(Comparator.comparing(account -> {
            List<Schedule> schedules = account.getSchedules();
            if (schedules != null && !schedules.isEmpty()) {
                return schedules.get(0).getCreateTime();
            } else {
                return LocalDateTime.MAX; // Để những account không có schedule sẽ đứng cuối danh sách
            }
        }));
        return accounts;
    }

    public List<Account> getAllAccountWithSchedule_2() {
        Map<LocalDateTime, Account> accountMap = new HashMap<>();
        String sql = "select account.id,account.fullname,schedule.day_of_week ,schedule.month, schedule.start_time, schedule.end_time,schedule.id,schedule.create_time from dbo.Schedules as schedule inner join dbo.Account as "
                + "account on schedule.mentor_id = account.id where schedule.status = 1 order by schedule.create_time";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int account_id = rs.getInt("id");
                String fullname = rs.getString("fullname");
                LocalDateTime creatTime = rs.getTimestamp("create_time").toLocalDateTime();
                Account account = accountMap.get(creatTime);

                if (account == null) {
                    account = new Account();
                    account.setAccount_id(account_id);
                    account.setFullname(fullname);
                    account.setSchedules(new ArrayList<>());
                    accountMap.put(creatTime, account);

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
//        ScheduleDAO scheduleDAO = new ScheduleDAO();
//        List<Account> accounts = scheduleDAO.getAllAccountWithSchedule_2();
//        for (Account account : accounts) {
//            System.out.println("Account ID: " + account.getAccount_id());
//            System.out.println("Fullname: " + account.getFullname());
//            System.out.println("PhoneNumber: " + account.getPhone());
//
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

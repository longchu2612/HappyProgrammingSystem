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
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import model.Role;
import java.time.temporal.WeekFields;
import java.util.HashSet;
import java.util.Set;
import model.Schedule;

/**
 *
 * @author asus
 */
public class ScheduleDAO extends DBContext {

    public int createNewSchedule(int dayOfWeek, int mentor_id, LocalDateTime currentTime, String slot, LocalDate teachingDate, String sessionId) {
        int result = 0;

        String sql = "INSERT INTO dbo.Schedules(day_of_week,mentor_id,status,create_time,slot,teach_date,sessionId) \n"
                + "VALUES (?,?,?,?,?,?,?);";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, dayOfWeek);
            ps.setInt(2, mentor_id);
            ps.setString(3, "1");
            ps.setObject(4, currentTime);
            ps.setString(5, slot);
            ps.setObject(6, teachingDate);
            ps.setString(7, sessionId);
            result = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return result;
    }

    public List<Account> getAllAccountWithSchedule() {

        List<Account> accounts = new ArrayList<>();
        String sql = "select account.id , account.fullname, MAX(schedule.create_time) AS last_create_time , schedule.status , schedule.sessionId\n"
                + "  from dbo.Schedules as schedule inner join dbo.Account as account on schedule.mentor_id = account.id where schedule.status = 1 \n"
                + "  group by account.id , account.fullname , schedule.status, schedule.sessionId order by last_create_time asc";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account account = new Account();
                account.setAccount_id(rs.getInt("id"));
                account.setFullname(rs.getString("fullname"));
                ArrayList<Schedule> schedules = new ArrayList<>();
                Schedule schedule = new Schedule();
                schedule.setCreateTime(rs.getTimestamp("last_create_time").toLocalDateTime());
                schedule.setStatus(rs.getString("status"));
                schedule.setSessionId(rs.getString("sessionId"));
                schedules.add(schedule);
                account.setSchedules(schedules);
                accounts.add(account);

            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }

        return accounts;
    }

    public List<String> getAllSlotsOfDay(int account_id, String sessionId, int dayOfWeek) {
        List<String> slots = new ArrayList<>();
        String sql = " select Distinct schedule.slot from dbo.Schedules as schedule inner join dbo.Account as account on schedule.mentor_id = account.id where account.id = ? \n"
                + "  and schedule.sessionId = ? and schedule.day_of_week = ?";
        try{
            ps = conn.prepareStatement(sql);
            ps.setInt(1, account_id);
            ps.setString(2, sessionId);
            ps.setInt(3, dayOfWeek);
            rs = ps.executeQuery();
            while(rs.next()){
                String slot = new String();
                slot = rs.getString("slot");
                slots.add(slot);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return slots;
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

//    public List<Account> getAllScheduleOfMentor(int mentor_id) {
//        Map<LocalDateTime, Account> accountMap = new HashMap<>();
//        String sql = "select account.id,account.fullname,schedule.day_of_week ,schedule.month, schedule.start_time, schedule.end_time,schedule.id,schedule.create_time, schedule.status from dbo.Schedules as schedule inner join "
//                + "dbo.Account as account on schedule.mentor_id = account.id where account.id = ? order by schedule.create_time";
//        try {
//            ps = conn.prepareStatement(sql);
//            ps.setInt(1, mentor_id);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//
//                String account_name = rs.getString("fullname");
//                LocalDateTime createTime = rs.getTimestamp("create_time").toLocalDateTime();
//                Account account = accountMap.get(createTime);
//                if (account == null) {
//                    account = new Account();
//                    account.setAccount_id(mentor_id);
//                    account.setFullname(account_name);
//
//                    account.setSchedules(new ArrayList<>());
//                    accountMap.put(createTime, account);
//                }
//                Schedule schedule = new Schedule();
//                schedule.setId(rs.getInt(7));
//                schedule.setDayOfWeek(rs.getInt("day_of_week"));
//                schedule.setMonth(rs.getInt("month"));
//                schedule.setStartTime(rs.getTime("start_time").toLocalTime());
//                schedule.setCreateTime(createTime);
//                schedule.setEndTime(rs.getTime("end_time").toLocalTime());
//                schedule.setStatus(rs.getString("status"));
//                account.getSchedules().add(schedule);
//            }
//        } catch (Exception ex) {
//            System.out.println(ex.getMessage());
//            ex.printStackTrace();
//        }
//        List<Account> accounts = new ArrayList<>(accountMap.values());
//        accounts.sort(Comparator.comparing(account -> {
//            List<Schedule> schedules = account.getSchedules();
//            if (schedules != null && !schedules.isEmpty()) {
//                return schedules.get(0).getCreateTime();
//            } else {
//                return LocalDateTime.MAX; // Để những account không có schedule sẽ đứng cuối danh sách
//            }
//        }));
//        return accounts;
//    }
//    public List<Account> getAllAccountWithSchedule_2() {
//        Map<LocalDateTime, Account> accountMap = new HashMap<>();
//        String sql = "select account.id,account.fullname,schedule.day_of_week ,schedule.month, schedule.start_time, schedule.end_time,schedule.id,schedule.create_time from dbo.Schedules as schedule inner join dbo.Account as "
//                + "account on schedule.mentor_id = account.id where schedule.status = 1 order by schedule.create_time";
//        try {
//            ps = conn.prepareStatement(sql);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                int account_id = rs.getInt("id");
//                String fullname = rs.getString("fullname");
//                LocalDateTime creatTime = rs.getTimestamp("create_time").toLocalDateTime();
//                Account account = accountMap.get(creatTime);
//
//                if (account == null) {
//                    account = new Account();
//                    account.setAccount_id(account_id);
//                    account.setFullname(fullname);
//                    account.setSchedules(new ArrayList<>());
//                    accountMap.put(creatTime, account);
//
//                }
//                Schedule schedule = new Schedule();
//                schedule.setId(rs.getInt(7));
//                schedule.setDayOfWeek(rs.getInt("day_of_week"));
//                schedule.setMonth(rs.getInt("month"));
//                schedule.setStartTime(rs.getTime("start_time").toLocalTime());
//                schedule.setEndTime(rs.getTime("end_time").toLocalTime());
//
//                account.getSchedules().add(schedule);
//
//            }
//
//        } catch (Exception ex) {
//            System.out.println(ex.getMessage());
//            ex.printStackTrace();
//        }
//
//        return new ArrayList<>(accountMap.values());
//    }
    public static void main(String[] args) {
        

    }

}

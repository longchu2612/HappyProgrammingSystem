/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Time;
import java.sql.Date;
import java.time.LocalTime;
import java.time.LocalDateTime;
import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;
import java.util.Comparator;
import java.time.DayOfWeek;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Account;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.Year;
import java.time.temporal.ChronoUnit;
import java.time.temporal.TemporalAdjusters;
import model.Role;
import java.time.temporal.WeekFields;
import java.util.Calendar;
//import java.util.Date;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;
import java.util.UUID;
import model.Schedule;
import model.Slot;

/**
 *
 * @author asus
 */
public class ScheduleDAO extends DBContext {

    public int createNewSchedule(int mentor_id, String status, LocalDateTime createTime, int month, String sessionId) {
        int result = 0;
        String sql = "INSERT INTO dbo.Schedules \n"
                + "(mentor_id, status, create_time, month, sessionId)\n"
                + "VALUES\n"
                + "(?, ?, ?, ?, ?);";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, mentor_id);
            ps.setString(2, status);
            ps.setObject(3, createTime);
            ps.setInt(4, month);
            ps.setString(5, sessionId);
            result = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return result;
    }

    public int getScheduleId(int mentor_id, String sessionId) {
        int schedule_id = 0;
        String sql = "select id from dbo.Schedules where mentor_id = ? and sessionId = ? ";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, mentor_id);
            ps.setString(2, sessionId);
            rs = ps.executeQuery();
            while (rs.next()) {
                schedule_id = rs.getInt("id");
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return schedule_id;
    }

    public int createSlotOfSchedule(int slot, int dayOfWeek, int schedule_id, LocalDate teach_date) {
        int result = 0;
        String sql = "INSERT INTO [happy_programming_system].[dbo].[Slot] ([slot], [dayOfWeek], [schedule_id], [teach_date])\n"
                + "VALUES (?, ?, ?, ?);";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, slot);
            ps.setInt(2, dayOfWeek);
            ps.setInt(3, schedule_id);
            ps.setDate(4, Date.valueOf(teach_date));
            result = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return result;
    }

    public List<Account> getAllAccountWithSchedule(String status) {

        List<Account> accounts = new ArrayList<>();
        String sql = "select account.id, account.fullname, schedule.id,schedule.create_time,schedule.month,schedule.status, schedule.sessionId\n"
                + "from dbo.Account as account inner join dbo.Schedules as schedule on account.id = schedule.mentor_id where schedule.status = ?\n"
                + "order by schedule.create_time asc";

        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, status);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account account = new Account();
                account.setAccount_id(rs.getInt(1));
                account.setFullname(rs.getString("fullname"));
                Schedule schedule = new Schedule();
                schedule.setId(rs.getInt(3));
                schedule.setCreateTime(rs.getTimestamp("create_time").toLocalDateTime());
                schedule.setMonth(rs.getInt("month"));
                schedule.setStatus(rs.getString("status"));
                schedule.setSessionId(rs.getString("sessionId"));
                account.setSchedules(schedule);

                accounts.add(account);

            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }

        return accounts;
    }

    public List<Slot> getAllDayOfSlot(int schedule_id) {
        List<Slot> slots = new ArrayList<>();
        String sql = "SELECT slot.slot, slot.dayOfWeek \n"
                + "FROM dbo.Schedules AS schedules \n"
                + "INNER JOIN dbo.Slot AS slot ON schedules.id = slot.schedule_id \n"
                + "WHERE schedule_id = ?\n"
                + "GROUP BY slot.slot, slot.dayOfWeek;";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, schedule_id);
            rs = ps.executeQuery();

            while (rs.next()) {
                Slot slot = new Slot();
                slot.setSlot(rs.getInt("slot"));
                slot.setDayOfWeek(rs.getInt("dayOfWeek"));
                slots.add(slot);
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return slots;
    }

    public List<Slot> getAllSlotByScheduleId(int scheduleId) {
        List<Slot> slots = new ArrayList<>();
        String sql = "select * from dbo.Slot where schedule_id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, scheduleId);
            rs = ps.executeQuery();
            while (rs.next()) {
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

    public LocalDate getLastDateByScheduleId(int scheduleId) {
        LocalDate lastTeachDate = null;
        String sql = "SELECT TOP 1 teach_date\n"
                + "FROM dbo.Slot\n"
                + "WHERE schedule_id = ?\n"
                + "ORDER BY teach_date DESC;";

        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, scheduleId);
            rs = ps.executeQuery();
            while (rs.next()) {
               lastTeachDate = rs.getDate("teach_date").toLocalDate();
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return lastTeachDate;
    }

    public List<Slot> getAllSlotByDates(int schedule_id, String startDate, String endDate) {
        List<Slot> slots = new ArrayList<>();
        String sql = "select * from dbo.Slot where schedule_id = ? and teach_date between ? and ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, schedule_id);
            ps.setString(2, startDate);
            ps.setString(3, endDate);
            rs = ps.executeQuery();
            while (rs.next()) {
                Slot slot = new Slot();
                slot.setId(rs.getInt("id"));
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

    public int getMentorIdByScheduleId(int schedule_id) {
        int result = 0;
        String sql = "SELECT mentor_id\n"
                + "FROM [happy_programming_system].[dbo].[Schedules]\n"
                + "WHERE id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, schedule_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                result = rs.getInt("mentor_id");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

//    public Date getTeachDateStart(int account_id, String sessionId) {
//        String sql = "SELECT MIN(schedule.teach_date) AS start_date\n"
//                + "FROM dbo.Schedules AS schedule\n"
//                + "INNER JOIN dbo.Account AS account ON schedule.mentor_id = account.id\n"
//                + "WHERE account.id = ? \n"
//                + "  AND schedule.sessionId = ? ;";
//        Date startDate = new Date();
//
//        try {
//            ps = conn.prepareStatement(sql);
//            ps.setInt(1, account_id);
//            ps.setString(2, sessionId);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                startDate = rs.getDate("start_date");
//            }
//
//        } catch (Exception ex) {
//            System.out.println(ex.getMessage());
//            ex.printStackTrace();
//        }
//        return startDate;
//    }
//    public Date getTeachDateEnd(int account_id, String sessionId) {
//        String sql = "SELECT MAX(schedule.teach_date) AS end_date\n"
//                + "FROM dbo.Schedules AS schedule\n"
//                + "INNER JOIN dbo.Account AS account ON schedule.mentor_id = account.id\n"
//                + "WHERE account.id = ? \n"
//                + "  AND schedule.sessionId = ? ;";
//        Date endDate = new Date();
//
//        try {
//            ps = conn.prepareStatement(sql);
//            ps.setInt(1, account_id);
//            ps.setString(2, sessionId);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                endDate = rs.getDate("end_date");
//            }
//
//        } catch (Exception ex) {
//            System.out.println(ex.getMessage());
//            ex.printStackTrace();
//        }
//        return endDate;
//    }
    public int updateScheduleAcceptByMentorId(int schedule_id) {
        String sql = "Update dbo.Schedules set status = 2 where id = ?";
        int result = 0;
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

    public int updateScheduleRejectByMentorId(int schedule_id) {
        String sql = "Update dbo.Schedules set status = 3 where id = ?";
        int result = 0;
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

    public List<Account> getScheduleOfMentor(int mentor_id) {
        List<Account> accounts = new ArrayList<>();
        String sql = "select account.id , account.fullname, schedule.create_time, schedule.month, schedule.status , schedule.sessionId, schedule.id\n"
                + " from dbo.Schedules as schedule inner join dbo.Account as account on schedule.mentor_id = account.id where account.id = ?\n"
                + " group by account.id , account.fullname , schedule.status,schedule.month ,schedule.sessionId, schedule.create_time,schedule.id order by schedule.create_time asc";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, mentor_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account account = new Account();
                account.setAccount_id(rs.getInt("id"));
                account.setFullname(rs.getString("fullname"));
                Schedule schedule = new Schedule();
                schedule.setId(rs.getInt(7));
                schedule.setCreateTime(rs.getTimestamp("create_time").toLocalDateTime());
                schedule.setMonth(rs.getInt("month"));
                schedule.setStatus(rs.getString("status"));
                schedule.setSessionId(rs.getString("sessionId"));
                account.setSchedules(schedule);
                accounts.add(account);
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return accounts;
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
        ScheduleDAO scheduleDAO = new ScheduleDAO();
        LocalDate localDate = scheduleDAO.getLastDateByScheduleId(4);
        System.out.println(localDate.toString());

    }

}

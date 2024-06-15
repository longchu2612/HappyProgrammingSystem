/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalTime;
import java.util.List;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

/**
 *
 * @author asus
 */
public class Schedule {
    private int id;
    private String sessionId;
    private int dayOfWeek;
    private Account account;
    private Date teach_date;
    private List<String> slots;
    private String status;
    private LocalDateTime createTime;

    public Schedule(int id, String sessionId, int dayOfWeek, Account account, Date teach_date, List<String> slots, String status, LocalDateTime createTime) {
        this.id = id;
        this.sessionId = sessionId;
        this.dayOfWeek = dayOfWeek;
        this.account = account;
        this.teach_date = teach_date;
        this.slots = slots;
        this.status = status;
        this.createTime = createTime;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    public int getDayOfWeek() {
        return dayOfWeek;
    }

    public void setDayOfWeek(int dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Date getTeach_date() {
        return teach_date;
    }

    public void setTeach_date(Date teach_date) {
        this.teach_date = teach_date;
    }

    public List<String> getSlots() {
        return slots;
    }

    public void setSlots(List<String> slots) {
        this.slots = slots;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }
    
    public Schedule() {
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Schedule{" + "id=" + id + ", sessionId=" + sessionId + ", dayOfWeek=" + dayOfWeek + ", account=" + account + ", teach_date=" + teach_date + ", slots=" + slots + ", status=" + status + ", createTime=" + createTime + '}';
    }

    
}

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
    private Account account;
    private LocalDateTime createTime;
    private List<Slot> slots;
    private String status;
    private Date startDate;
    private Date endDate;
    private int month;
    private String sessionId;

    public Schedule() {
    }

    public Schedule(int id, Account account, List<Slot> slots, String status, int month, String sessionId) {
        this.id = id;
        this.account = account;
        this.slots = slots;
        this.status = status;
        this.month = month;
        this.sessionId = sessionId;
    }
    
    
     
    
    public Schedule(int id, Account account, LocalDateTime createTime, List<Slot> slots, String status, Date startDate, Date endDate, String sessionId) {
        this.id = id;
        this.account = account;
        this.createTime = createTime;
        this.slots = slots;
        this.status = status;
        this.startDate = startDate;
        this.endDate = endDate;
        this.sessionId = sessionId;
    }

    
    
    public Schedule(int id, Account account, LocalDateTime createTime, List<Slot> slots, String status, Date startDate, Date endDate) {
        this.id = id;
        this.account = account;
        this.createTime = createTime;
        this.slots = slots;
        this.status = status;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    
    
    public List<Slot> getSlots() {
        return slots;
    }

    public void setSlots(List<Slot> slots) {
        this.slots = slots;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }
    
    

    @Override
    public String toString() {
        return "Schedule{" + "id=" + id + ", account=" + account + ", createTime=" + createTime + ", slots=" + slots + ", status=" + status + ", startDate=" + startDate + ", endDate=" + endDate + '}';
    }
    
    
    

    

    

    

    

   
    
    

    

    
}

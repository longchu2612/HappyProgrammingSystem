/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalTime;
import java.util.List;
import java.sql.Timestamp;

/**
 *
 * @author asus
 */
public class Schedule {
    private int id;
    private int month;
    private LocalTime startTime;
    private LocalTime endTime;
    private int dayOfWeek;
    private Account account;
    private String status;
    private Timestamp createTime;

    public Schedule() {
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Schedule(int id, int month, LocalTime startTime, LocalTime endTime, int dayOfWeek, Account account, String status, Timestamp createTime) {
        this.id = id;
        this.month = month;
        this.startTime = startTime;
        this.endTime = endTime;
        this.dayOfWeek = dayOfWeek;
        this.account = account;
        this.status = status;
        this.createTime = createTime;
    }
    
    
    

    public Schedule(int id, int month, LocalTime startTime, LocalTime endTime, int dayOfWeek, Account account, String status) {
        this.id = id;
        this.month = month;
        this.startTime = startTime;
        this.endTime = endTime;
        this.dayOfWeek = dayOfWeek;
        this.account = account;
        this.status = status;
    }
    
    
    

    public Schedule(int id, int month, LocalTime startTime, LocalTime endTime, int dayOfWeek, Account account) {
        this.id = id;
        this.month = month;
        this.startTime = startTime;
        this.endTime = endTime;
        this.dayOfWeek = dayOfWeek;
        this.account = account;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }
    
    

    public int getId() {
        return id;
    }

    public int getMonth() {
        return month;
    }

    public LocalTime getStartTime() {
        return startTime;
    }

    public LocalTime getEndTime() {
        return endTime;
    }

    public int getDayOfWeek() {
        return dayOfWeek;
    }

    public Account getAccount() {
        return account;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public void setStartTime(LocalTime startTime) {
        this.startTime = startTime;
    }

    public void setEndTime(LocalTime endTime) {
        this.endTime = endTime;
    }

    public void setDayOfWeek(int dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    @Override
    public String toString() {
        return "Schedule{" + "id=" + id + ", month=" + month + ", startTime=" + startTime + ", endTime=" + endTime + ", dayOfWeek=" + dayOfWeek + ", account=" + account + '}';
    }
    
    
}

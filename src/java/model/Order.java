/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author catmi
 */
public class Order {
    private int orderId;
    private int menteeId;
    private int mentorId;
    private int courseId;
    private double total;
    private Date createDate;
    private boolean status;

    public Order() {
    }

    public Order(int orderId, int menteeId, int mentorId, int courseId, double total, Date createDate, boolean status) {
        this.orderId = orderId;
        this.menteeId = menteeId;
        this.mentorId = mentorId;
        this.courseId = courseId;
        this.total = total;
        this.createDate = createDate;
        this.status = status;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getMenteeId() {
        return menteeId;
    }

    public void setMenteeId(int menteeId) {
        this.menteeId = menteeId;
    }

    public int getMentorId() {
        return mentorId;
    }

    public void setMentorId(int mentorId) {
        this.mentorId = mentorId;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Order{" + "orderId=" + orderId + ", menteeId=" + menteeId + ", mentorId=" + mentorId + ", courseId=" + courseId + ", total=" + total + ", createDate=" + createDate + ", status=" + status + '}';
    }
    
}

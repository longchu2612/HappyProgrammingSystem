/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author asus
 */
public class Notification_Schedule {
    private int id;
    private int mentor_id;
    private int manager_id;
    private String message;
    private Date created_at;
    private int schedule_id;

    public Notification_Schedule(int id, int mentor_id, int manager_id, String message, Date created_at, int schedule_id) {
        this.id = id;
        this.mentor_id = mentor_id;
        this.manager_id = manager_id;
        this.message = message;
        this.created_at = created_at;
        this.schedule_id = schedule_id;
    }

    public Notification_Schedule() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMentor_id() {
        return mentor_id;
    }

    public void setMentor_id(int mentor_id) {
        this.mentor_id = mentor_id;
    }

    public int getManager_id() {
        return manager_id;
    }

    public void setManager_id(int manager_id) {
        this.manager_id = manager_id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public int getSchedule_id() {
        return schedule_id;
    }

    public void setSchedule_id(int schedule_id) {
        this.schedule_id = schedule_id;
    }

    @Override
    public String toString() {
        return "Notification_Schedule{" + "id=" + id + ", mentor_id=" + mentor_id + ", manager_id=" + manager_id + ", message=" + message + ", created_at=" + created_at + ", schedule_id=" + schedule_id + '}';
    }
    
    
}

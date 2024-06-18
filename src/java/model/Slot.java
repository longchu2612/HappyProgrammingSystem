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
public class Slot {
    private int id;
    private int slot;
    private int dayOfWeek;
    private Schedule schedule;
    private Date teach_date;
    
    
    

    public Slot(int id, int slot, int dayOfWeek, Schedule schedule, Date teach_date) {
        this.id = id;
        this.slot = slot;
        this.dayOfWeek = dayOfWeek;
        this.schedule = schedule;
        this.teach_date = teach_date;
    }

    public Slot() {
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSlot() {
        return slot;
    }

    public void setSlot(int slot) {
        this.slot = slot;
    }

    public int getDayOfWeek() {
        return dayOfWeek;
    }

    public void setDayOfWeek(int dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public Schedule getSchedule() {
        return schedule;
    }

    public void setSchedule(Schedule schedule) {
        this.schedule = schedule;
    }

    public Date getTeach_date() {
        return teach_date;
    }

    public void setTeach_date(Date teach_date) {
        this.teach_date = teach_date;
    }

    @Override
    public String toString() {
        return "Slot{" + "id=" + id + ", slot=" + slot + ", dayOfWeek=" + dayOfWeek + ", schedule=" + schedule + ", teach_date=" + teach_date + '}';
    }
    
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDate;

/**
 *
 * @author asus
 */
public class SlotMentee {
    private int id;
    private int slot;
    private int dayOfWeek;
    private Schedule schedule;
    private LocalDate teach_date;
    private Skill skill;
    private Boolean isAttend;

    public SlotMentee(int id, int slot, int dayOfWeek, Schedule schedule, LocalDate teach_date, Skill skill, Boolean isAttend) {
        this.id = id;
        this.slot = slot;
        this.dayOfWeek = dayOfWeek;
        this.schedule = schedule;
        this.teach_date = teach_date;
        this.skill = skill;
        this.isAttend = isAttend;
    }

    public int getId() {
        return id;
    }

    public int getSlot() {
        return slot;
    }

    public int getDayOfWeek() {
        return dayOfWeek;
    }

    public Schedule getSchedule() {
        return schedule;
    }

    public LocalDate getTeach_date() {
        return teach_date;
    }

    public Skill getSkill() {
        return skill;
    }

    public Boolean getIsAttend() {
        return isAttend;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setSlot(int slot) {
        this.slot = slot;
    }

    public void setDayOfWeek(int dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public void setSchedule(Schedule schedule) {
        this.schedule = schedule;
    }

    public void setTeach_date(LocalDate teach_date) {
        this.teach_date = teach_date;
    }

    public void setSkill(Skill skill) {
        this.skill = skill;
    }

    public void setIsAttend(Boolean isAttend) {
        this.isAttend = isAttend;
    }

    @Override
    public String toString() {
        return "SlotMentee{" + "id=" + id + ", slot=" + slot + ", dayOfWeek=" + dayOfWeek + ", schedule=" + schedule + ", teach_date=" + teach_date + ", skill=" + skill + ", isAttend=" + isAttend + '}';
    }
    
    
    
}

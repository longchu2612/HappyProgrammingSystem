/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDate;

/**
 *
 * @author catmi
 */
public class Slot_Mentee {
    private int id;
    private int slot;
    private int dayOfWeek;
    private Schedule schedule;
    private LocalDate teach_date;
    private int skill_id;
    private boolean isAttend;
    private int mentor_id;

    public Slot_Mentee() {
    }

    public Slot_Mentee(int id, int slot, int dayOfWeek, Schedule schedule, LocalDate teach_date, int skill_id, boolean isAttend, int mentor_id) {
        this.id = id;
        this.slot = slot;
        this.dayOfWeek = dayOfWeek;
        this.schedule = schedule;
        this.teach_date = teach_date;
        this.skill_id = skill_id;
        this.isAttend = isAttend;
        this.mentor_id = mentor_id;
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

    public LocalDate getTeach_date() {
        return teach_date;
    }

    public void setTeach_date(LocalDate teach_date) {
        this.teach_date = teach_date;
    }

    public int getSkill_id() {
        return skill_id;
    }

    public void setSkill_id(int skill_id) {
        this.skill_id = skill_id;
    }

    public boolean isIsAttend() {
        return isAttend;
    }

    public void setIsAttend(boolean isAttend) {
        this.isAttend = isAttend;
    }

    public int getMentor_id() {
        return mentor_id;
    }

    public void setMentor_id(int mentor_id) {
        this.mentor_id = mentor_id;
    }
    
}

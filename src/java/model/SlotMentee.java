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
    private LocalDate learning_date;
    private Skill skill;
    private Boolean isAttend;

    public SlotMentee() {
    }

    public SlotMentee(int id, int slot, int dayOfWeek, Schedule schedule, LocalDate learning_date, Skill skill, Boolean isAttend) {
        this.id = id;
        this.slot = slot;
        this.dayOfWeek = dayOfWeek;
        this.schedule = schedule;
        this.learning_date = learning_date;
        this.skill = skill;
        this.isAttend = isAttend;
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

    public LocalDate getLearning_date() {
        return learning_date;
    }

    public void setLearning_date(LocalDate learning_date) {
        this.learning_date = learning_date;
    }

    public Skill getSkill() {
        return skill;
    }

    public void setSkill(Skill skill) {
        this.skill = skill;
    }

    public Boolean getIsAttend() {
        return isAttend;
    }

    public void setIsAttend(Boolean isAttend) {
        this.isAttend = isAttend;
    }

    @Override
    public String toString() {
        return "SlotMentee{" + "id=" + id + ", slot=" + slot + ", dayOfWeek=" + dayOfWeek + ", schedule=" + schedule + ", learning_date=" + learning_date + ", skill=" + skill + ", isAttend=" + isAttend + '}';
    }
    
}

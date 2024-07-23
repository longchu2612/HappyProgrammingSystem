/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author asus
 */
public class Request_Course {
    private int repc_id;
    private Request request;
    private Account mentor;
    private Skill skill;
    private int numOfSlot;
    private Schedule schedule;
    private String status;
    private Account mentee;
    private String note;

    public Request_Course(int repc_id, Request request, Account mentor, Skill skill, int numOfSlot, Schedule schedule, String status, Account mentee, String note) {
        this.repc_id = repc_id;
        this.request = request;
        this.mentor = mentor;
        this.skill = skill;
        this.numOfSlot = numOfSlot;
        this.schedule = schedule;
        this.status = status;
        this.mentee = mentee;
        this.note = note;
    }
    
    
    

    public Request_Course(int repc_id, Request request, Account mentor, Skill skill, int numOfSlot, Schedule schedule, String status, Account mentee) {
        this.repc_id = repc_id;
        this.request = request;
        this.mentor = mentor;
        this.skill = skill;
        this.numOfSlot = numOfSlot;
        this.schedule = schedule;
        this.status = status;
        this.mentee = mentee;
    }

    public Request_Course() {
    }

    public int getRepc_id() {
        return repc_id;
    }

    public void setRepc_id(int repc_id) {
        this.repc_id = repc_id;
    }

    public Request getRequest() {
        return request;
    }

    public void setRequest(Request request) {
        this.request = request;
    }

    public Account getMentor() {
        return mentor;
    }

    public void setMentor(Account mentor) {
        this.mentor = mentor;
    }

    public Skill getSkill() {
        return skill;
    }

    public void setSkill(Skill skill) {
        this.skill = skill;
    }

    public int getNumOfSlot() {
        return numOfSlot;
    }

    public void setNumOfSlot(int numOfSlot) {
        this.numOfSlot = numOfSlot;
    }

    public Schedule getSchedule() {
        return schedule;
    }

    public void setSchedule(Schedule schedule) {
        this.schedule = schedule;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Account getMentee() {
        return mentee;
    }

    public void setMentee(Account mentee) {
        this.mentee = mentee;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Override
    public String toString() {
        return "Request_Course{" + "repc_id=" + repc_id + ", request=" + request + ", mentor=" + mentor + ", skill=" + skill + ", numOfSlot=" + numOfSlot + ", schedule=" + schedule + ", status=" + status + ", mentee=" + mentee + ", note=" + note + '}';
    }
    
    
    
    
    
}

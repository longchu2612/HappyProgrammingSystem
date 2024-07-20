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
    private Account account;
    private Skill skill;
    private int numOfSlot;
    private Schedule schedule;
    private String status;

    public Request_Course(int repc_id, Request request, Account account, Skill skill, int numOfSlot, Schedule schedule, String status) {
        this.repc_id = repc_id;
        this.request = request;
        this.account = account;
        this.skill = skill;
        this.numOfSlot = numOfSlot;
        this.schedule = schedule;
        this.status = status;
    }

    public Request_Course() {
    }

    public int getRepc_id() {
        return repc_id;
    }

    public Request getRequest() {
        return request;
    }

    public Account getAccount() {
        return account;
    }

    public Skill getSkill() {
        return skill;
    }

    public int getNumOfSlot() {
        return numOfSlot;
    }

    public Schedule getSchedule() {
        return schedule;
    }

    public String getStatus() {
        return status;
    }

    public void setRepc_id(int repc_id) {
        this.repc_id = repc_id;
    }

    public void setRequest(Request request) {
        this.request = request;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public void setSkill(Skill skill) {
        this.skill = skill;
    }

    public void setNumOfSlot(int numOfSlot) {
        this.numOfSlot = numOfSlot;
    }

    public void setSchedule(Schedule schedule) {
        this.schedule = schedule;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Request_Course{" + "repc_id=" + repc_id + ", request=" + request + ", account=" + account + ", skill=" + skill + ", numOfSlot=" + numOfSlot + ", schedule=" + schedule + ", status=" + status + '}';
    }
    
    
    
}

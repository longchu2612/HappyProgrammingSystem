/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author catmi
 */
public class Mentor {
    private int id;
    private String fullname;
    private String username;
    private String job;
    private int status;
    private int numOfReq;
    private float rating;
    private int cvId;
    private String address;
    private String avatar;
    private ArrayList<Skill> listSkill;
            
    public Mentor() {
    }

    public Mentor(int id, String fullname, String job, int cvId, String address, ArrayList<Skill> listSkill, String avatar) {
        this.id = id;
        this.fullname = fullname;
        this.job = job;
        this.cvId = cvId;
        this.address = address;
        this.listSkill = listSkill;
        this.avatar = avatar;
    }

    public Mentor(int id, String fullname, String username, String job, int status, int numOfReq, float rating) {
        this.id = id;
        this.fullname = fullname;
        this.username = username;
        this.job = job;
        this.status = status;
        this.numOfReq = numOfReq;
        this.rating = rating;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getNumOfReq() {
        return numOfReq;
    }

    public void setNumOfReq(int numOfReq) {
        this.numOfReq = numOfReq;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public int getCvId() {
        return cvId;
    }

    public void setCvId(int cvId) {
        this.cvId = cvId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public ArrayList<Skill> getListSkill() {
        return listSkill;
    }

    public void setListSkill(ArrayList<Skill> listSkill) {
        this.listSkill = listSkill;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Override
    public String toString() {
        return "Mentor{" + "id=" + id + ", fullname=" + fullname + ", username=" + username + ", job=" + job + ", status=" + status + ", numOfReq=" + numOfReq + ", rating=" + rating + ", cvId=" + cvId + ", address=" + address + ", avatar=" + avatar + ", listSkill=" + listSkill + '}';
    }

    
    
}

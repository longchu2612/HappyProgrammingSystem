/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class CV {
    String id;
    String accountID;
    String avatar;
    String job;
    String introduction;
    Date created_at;
    Date modified_at;
    String achievements;
    String status;
    String note;
    String rate;
    
    
    public CV() {
    }

    public CV(String id, String accountID ,String job, String status, String note, String rate) {
        this.id = id;
        this.accountID = accountID;
        this.job = job;
        this.status = status;
        this.note = note;
        this.rate = rate;
    }

    public CV(String id, String accountID, String avatar, String job, String introduction, Date created_at, Date modified_at, String achievements, String status, String note, String rate) {
        this.id = id;
        this.accountID = accountID;
        this.avatar = avatar;
        this.job = job;
        this.introduction = introduction;
        this.created_at = created_at;
        this.modified_at = modified_at;
        this.achievements = achievements;
        this.status = status;
        this.note = note;
        this.rate = rate;
    }

    public CV(String id, String accountID, String avatar, String job, String introduction, Date created_at, Date modified_at, String achievements) {
        this.id = id;
        this.accountID = accountID;
        this.avatar = avatar;
        this.job = job;
        this.introduction = introduction;
        this.created_at = created_at;
        this.modified_at = modified_at;
        this.achievements = achievements;
    }

    public String getRate() {
        return rate;
    }

    public void setRate(String rate) {
        this.rate = rate;
    }
    
    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getModified_at() {
        return modified_at;
    }

    public void setModified_at(Date modified_at) {
        this.modified_at = modified_at;
    }

    public String getAchievements() {
        return achievements;
    }

    public void setAchievements(String achievements) {
        this.achievements = achievements;
    }
    
    
}

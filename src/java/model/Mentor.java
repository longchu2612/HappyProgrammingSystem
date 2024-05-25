/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author luutu
 */
public class Mentor extends Account{
    private int CV_id;
    private String CV_avatar;
    private String job;
    private String introduction;
    private String achievements;
    private double rating_star;
    private String skill;

    public Mentor() {
    }

    public Mentor(int CV_id, String CV_avatar, String job, String introduction, String achievements, double rating_star, String skill, int account_id, String account_name, String email, String password, String fullname, int phone, java.sql.Date dateOfBirth, Boolean sex, String address, String avatar, Role role, Boolean status) {
        super(account_id, account_name, email, password, fullname, phone, dateOfBirth, sex, address, avatar, role, status);
        this.CV_id = CV_id;
        this.CV_avatar = CV_avatar;
        this.job = job;
        this.introduction = introduction;
        this.achievements = achievements;
        this.rating_star = rating_star;
        this.skill = skill;
    }

    

    public int getCV_id() {
        return CV_id;
    }

    public void setCV_id(int CV_id) {
        this.CV_id = CV_id;
    }

    public String getCV_avatar() {
        return CV_avatar;
    }

    public void setCV_avatar(String CV_avatar) {
        this.CV_avatar = CV_avatar;
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

    public String getAchievements() {
        return achievements;
    }

    public void setAchievements(String achievements) {
        this.achievements = achievements;
    }

    public double getRating_star() {
        return rating_star;
    }

    public void setRating_star(double rating_star) {
        this.rating_star = rating_star;
    }

    public String getSkill() {
        return skill;
    }

    public void setSkill(String skill) {
        this.skill = skill;
    }

    @Override
    public String toString() {
        return "Account{" + "account_id=" + account_id + ", account_name=" + account_name + ", email=" + email + ", password=" + password + ", fullname=" + fullname + ", phone=" + phone + ", dateOfBirth=" + dateOfBirth + ", sex=" + sex + ", address=" + address + ", avatar=" + avatar + ", role=" + role + ", status=" + status + '}' + "Mentor{" + "CV_id=" + CV_id + ", CV_avatar=" + CV_avatar + ", job=" + job + ", introduction=" + introduction + ", achievements=" + achievements + ", rating_start=" + rating_star + ", skill=" + skill + '}';
    }
    
}


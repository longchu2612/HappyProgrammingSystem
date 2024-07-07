/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class CV_skill {

    private String cv_id;
    private String skill_id;
    private String rating_star;

    public CV_skill() {
    }

    public CV_skill(String cv_id, String skill_id) {
        this.cv_id = cv_id;
        this.skill_id = skill_id;
    }

    
    public CV_skill(String cv_id, String skill_id, String rating_star) {
        this.cv_id = cv_id;
        this.skill_id = skill_id;
        this.rating_star = rating_star;
    }

    
 

    public String getRating_star() {
        return rating_star;
    }

    public void setRating_star(String rating_star) {
        this.rating_star = rating_star;
    }

    public String getCv_id() {
        return cv_id;
    }

    public void setCv_id(String cv_id) {
        this.cv_id = cv_id;
    }

    public String getSkill_id() {
        return skill_id;
    }

    public void setSkill_id(String skill_id) {
        this.skill_id = skill_id;
    }
    
}

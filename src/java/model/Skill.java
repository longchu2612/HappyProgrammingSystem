/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author catmi
 */
public class Skill {
    private int skillId;
    private String skillName;
    private int status;
    private String image;

    public Skill() {
    }

    public Skill(int skillId, String skillName, int status, String image) {
        this.skillId = skillId;
        this.skillName = skillName;
        this.status = status;
        this.image = image;
    }

    public int getSkillId() {
        return skillId;
    }

    public void setSkillId(int skillId) {
        this.skillId = skillId;
    }

    public String getSkillName() {
        return skillName;
    }

    public void setSkillName(String skillName) {
        this.skillName = skillName;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Skill{" + "skillId=" + skillId + ", skillName=" + skillName + ", status=" + status + ", image=" + image + '}';
    }

    

    
}
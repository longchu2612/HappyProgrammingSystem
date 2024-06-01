/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Skill_displayed extends Skill{
    
    String is_checked;

    public Skill_displayed() {
    }

    public Skill_displayed(String is_checked, int skillId, String name) {
        super(skillId, name);
        this.is_checked = is_checked;
    }

    public String getIs_checked() {
        return is_checked;
    }

    public void setIs_checked(String is_checked) {
        this.is_checked = is_checked;
    }
    
}

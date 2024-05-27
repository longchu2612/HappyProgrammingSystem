/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author asus
 */
public class Skill {
    private int id;
    private String skill_name;
    private List<Request> requets;

    public Skill(int id, String skill_name, List<Request> requets) {
        this.id = id;
        this.skill_name = skill_name;
        this.requets = requets;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSkill_name() {
        return skill_name;
    }

    public void setSkill_name(String skill_name) {
        this.skill_name = skill_name;
    }

    public List<Request> getRequets() {
        return requets;
    }

    public void setRequets(List<Request> requets) {
        this.requets = requets;
    }

    @Override
    public String toString() {
        return "Skill{" + "id=" + id + ", skill_name=" + skill_name + ", requets=" + requets + '}';
    }
    
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author asus
 */
public class Request_Skill {
    private int id;
    private int request_id;
    private int skill_id;

    public Request_Skill(int id, int request_id, int skill_id) {
        this.id = id;
        this.request_id = request_id;
        this.skill_id = skill_id;
    }

    public int getId() {
        return id;
    }

    public int getRequest_id() {
        return request_id;
    }

    public int getSkill_id() {
        return skill_id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setRequest_id(int request_id) {
        this.request_id = request_id;
    }

    public void setSkill_id(int skill_id) {
        this.skill_id = skill_id;
    }

    @Override
    public String toString() {
        return "Request_Skill{" + "id=" + id + ", request_id=" + request_id + ", skill_id=" + skill_id + '}';
    }
    
    
    
}

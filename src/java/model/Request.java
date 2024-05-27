/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

/**
 *
 * @author asus
 */
public class Request {
    private int id;
    private String title;
    private LocalDateTime date_dealine;
    private String content;
    private List<Skill> skills;

    public Request(int id, String title, LocalDateTime date_dealine, String content, List<Skill> skills) {
        this.id = id;
        this.title = title;
        this.date_dealine = date_dealine;
        this.content = content;
        this.skills = skills;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public LocalDateTime getDate_dealine() {
        return date_dealine;
    }

    public void setDate_dealine(LocalDateTime date_dealine) {
        this.date_dealine = date_dealine;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public List<Skill> getSkills() {
        return skills;
    }

    public void setSkills(List<Skill> skills) {
        this.skills = skills;
    }

    @Override
    public String toString() {
        return "Request{" + "id=" + id + ", title=" + title + ", date_dealine=" + date_dealine + ", content=" + content + ", skills=" + skills + '}';
    }
    
    
}

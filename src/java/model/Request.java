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
    private List<Request_Skill> requestSkills;

    public Request(int id, String title, String content, List<Request_Skill> requestSkills) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.requestSkills = requestSkills;
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

    public List<Request_Skill> getRequestSkills() {
        return requestSkills;
    }

    public void setRequestSkills(List<Request_Skill> requestSkills) {
        this.requestSkills = requestSkills;
    }

    @Override
    public String toString() {
        return "Request{" + "id=" + id + ", title=" + title + ", date_dealine=" + date_dealine + ", content=" + content + ", requestSkills=" + requestSkills + '}';
    }

    

    
    
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

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
    private LocalDateTime deadline;
    private String content;
    private String status;
    private int createdBy;
    private LocalDateTime createdDate;

    public Request() {
    }

    public Request(int id, String title, LocalDateTime deadline, String content, String status, int createdBy, LocalDateTime createdDate) {
        this.id = id;
        this.title = title;
        this.deadline = deadline;
        this.content = content;
        this.status = status;
        this.createdBy = createdBy;
        this.createdDate = createdDate;
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

    public LocalDateTime getDeadline() {
        return deadline;
    }

    public void setDeadline(LocalDateTime deadline) {
        this.deadline = deadline;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }

    @Override
    public String toString() {
        return "Request{" + "id=" + id + ", title=" + title + ", deadline=" + deadline + ", content=" + content + ", status=" + status + ", createdBy=" + createdBy + ", createdDate=" + createdDate + '}';
    }
    
}


/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.*;

/**
 *
 * @author catmi
 */
public class Balance_Change {
    private int id;
    private int acc_id;
    private String content;
    private LocalDateTime change_date;

    public Balance_Change() {
    }

    public Balance_Change(int id, int acc_id, String content, LocalDateTime change_date) {
        this.id = id;
        this.acc_id = acc_id;
        this.content = content;
        this.change_date = change_date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAcc_id() {
        return acc_id;
    }

    public void setAcc_id(int acc_id) {
        this.acc_id = acc_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDateTime getChange_date() {
        return change_date;
    }

    public void setChange_date(LocalDateTime change_date) {
        this.change_date = change_date;
    }
    
    
}

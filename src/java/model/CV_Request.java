/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author catmi
 */
public class CV_Request extends CV {

    private String fullname;

    public CV_Request() {
    }

    public CV_Request(String id, String accountID, String job, String status, String note, String fullname, String rate) {
        super(id, accountID, job, status, note, rate);
        this.fullname = fullname;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    @Override
    public String getId() {
        return id;
    }

    @Override
    public void setId(String id) {
        this.id = id;
    }

    @Override
    public String getJob() {
        return job;
    }

    @Override
    public void setJob(String job) {
        this.job = job;
    }

    @Override
    public String getStatus() {
        return status;
    }

    @Override
    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String getRate() {
        return rate;
    }

    @Override
    public void setRate(String rate) {
        this.rate = rate;
    }

    
}

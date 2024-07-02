/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author catmi
 */
public class Rating {
    private int id;
    private int mentorId;
    private int rateStar;
    int mentorID;
    String content;
    float ratingstar;
    int createdBy;

    public Rating() {
    }

    public Rating(int id, int mentorId, int rateStar) {
        this.id = id;
        this.mentorId = mentorId;
        this.rateStar = rateStar;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMentorId() {
        return mentorId;
    }

    public void setMentorId(int mentorId) {
        this.mentorId = mentorId;
    }

    public int getRateStar() {
        return rateStar;
    }

    public void setRateStar(int rateStar) {
        this.rateStar = rateStar;
    }
    public Rating(String content, float ratingstar) {
        this.content = content;
        this.ratingstar = ratingstar;
    }
    
    public Rating(int mentorID, String content, float ratingstar, int createdBy) {
        this.mentorID = mentorID;
        this.content = content;
        this.ratingstar = ratingstar;
        this.createdBy = createdBy;
    }

    public int getMentorID() {
        return mentorID;
    }

    public void setMentorID(int mentorID) {
        this.mentorID = mentorID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public float getRatingstar() {
        return ratingstar;
    }

    public void setRatingstar(float ratingstar) {
        this.ratingstar = ratingstar;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author ngoqu
 */
public class RNC {
   private String Rating;
   private String Comment;
      private String CreatedBy;
      private Date  CreatedDate;

    public RNC() {
    }

    

    public RNC(String Rating, String Comment, String CreatedBy, Date CreatedDate) {
        this.Rating = Rating;
        this.Comment = Comment;
        this.CreatedBy = CreatedBy;
        this.CreatedDate = CreatedDate;
    }

    public Date getCreatedDate() {
        return CreatedDate;
    }

    public void setCreatedDate(Date CreatedDate) {
        this.CreatedDate = CreatedDate;
    }

    public String getCreatedBy() {
        return CreatedBy;
    }

    public void setCreatedBy(String CreatedBy) {
        this.CreatedBy = CreatedBy;
    }

    public RNC(String Rating, String Comment) {
        this.Rating = Rating;
        this.Comment = Comment;
    }

    public String getRating() {
        return Rating;
    }

    public void setRating(String Rating) {
        this.Rating = Rating;
    }

    public String getComment() {
        return Comment;
    }

    public void setComment(String Comment) {
        this.Comment = Comment;
    }
   
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author catmi
 */
public class Mentor {
    private int id;
    private String fullname;
    private String username;
    private int status;
    private int numOfReq;
    private float rating;

    public Mentor() {
    }

    public Mentor(int id, String fullname, String username, int status, int numOfReq, float rating) {
        this.id = id;
        this.fullname = fullname;
        this.username = username;
        this.status = status;
        this.numOfReq = numOfReq;
        this.rating = rating;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getNumOfReq() {
        return numOfReq;
    }

    public void setNumOfReq(int numOfReq) {
        this.numOfReq = numOfReq;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    @Override
    public String toString() {
        return "Mentor{" + "id=" + id + ", fullname=" + fullname + ", username=" + username + ", status=" + status + ", numOfReq=" + numOfReq + ", rating=" + rating + '}';
    }
    
}

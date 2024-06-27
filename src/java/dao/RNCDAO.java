/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.RNC;

/**
 *
 * @author ngoqu
 */
public class RNCDAO extends DBContext{
    public List<RNC> getAllCommentsbyID(String mentorID) {
         RNC r = new RNC();
        List<RNC> comments = new ArrayList<>();
        String sql = "SELECT * FROM RateComment WHERE mentorID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, mentorID);
            rs = ps.executeQuery();
            while (rs.next()) {
            
                String Content = rs.getString(3);
                String Rating = rs.getString(4);
                
                 
                r = new RNC(Rating, Content);
                comments.add(r);
            }
        } catch (SQLException e) {
            System.out.println("getUsersByAccount:" + e.getMessage());
        }
        return comments;
    }
    public static void main(String[] args) {
         RNCDAO r = new RNCDAO();
        List<RNC> comments = new ArrayList<>();
        comments = r.getAllCommentsbyID("41");
        for(RNC a : comments){
            System.out.println(a);
        }
    }
}

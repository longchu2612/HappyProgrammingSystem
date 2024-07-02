/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.SQLException;
import model.Rating;

/**
 *
 * @author Admin
 */
public class RatingDAO extends DBContext {

    public boolean checkRequestExistance(String menteeID, String mentorID) {
        String sql = """
                     SELECT * 
                     FROM Request r left join Request_Account ra 
                     ON r.id = ra.requestID join Account a
                     ON r.createdBy = a.id
                     WHERE r.createdBy = ? AND ra.accountID = ?""";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(menteeID));
            ps.setInt(2, Integer.parseInt(mentorID));
            rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (NumberFormatException | SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void insertRatingMentor(String mentorID, String content, String ratingstar, String createby) {
        String sql = """
                     INSERT INTO RateComment (mentorID, content, ratingstar, createdBy, createdDate)
                     VALUES
                     (?, ?, ?, ?, GETDATE())""";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(mentorID));
            ps.setString(2, content);
            ps.setFloat(3, Float.parseFloat(ratingstar));
            ps.setInt(4, Integer.parseInt(createby));
            ps.executeUpdate();
        } catch (NumberFormatException | SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateRatingMentor(String mentorID, String content, String ratingstar, String createby) {
        String sql = """
                     UPDATE RateComment
                     SET content = ?, ratingstar = ?
                     WHERE mentorID = ? AND createdBy = ?
                     """;
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, content);
            ps.setFloat(2, Float.parseFloat(ratingstar));
            ps.setInt(3, Integer.parseInt(mentorID));
            ps.setInt(4, Integer.parseInt(createby));
            ps.executeUpdate();
        } catch (NumberFormatException | SQLException e) {
            e.printStackTrace();
        }
    }

    public Rating getRatingByIds(String mentorID, String menteeID) {
        String sql = """
                     SELECT content, ratingstar FROM RateComment
                     WHERE mentorID = ? AND createdBy = ?""";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(mentorID));
            ps.setInt(2, Integer.parseInt(menteeID));
            rs = ps.executeQuery();
            while (rs.next()) {
                String content = rs.getString(1);
                float ratingstar = rs.getFloat(2);
                return new Rating(content, ratingstar);
            }
        } catch (NumberFormatException | SQLException e) {
            e.printStackTrace();
        }
        return new Rating("", 0);
    }
}

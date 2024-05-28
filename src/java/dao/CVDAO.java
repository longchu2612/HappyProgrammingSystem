/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Date;
import java.sql.SQLException;
import model.CV;

public class CVDAO extends DBContext {

    /**
     *
     * @author Admin
     */

    public boolean checkCVExistanceById(String id) {
        String sql = "SELECT ISNULL((SELECT count(id) FROM CV WHERE accountID = ? Group by accountID), 0)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getInt(1) == 1) {
                    return true;
                } else if (rs.getInt(1) > 1) {
                    throw new Exception("Tồn tại 2 CV của cùng 1 người trong DB");
                } else {
                    return false;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void createNewCV(String accountID, String avatar) {
        String sql = """
                     INSERT INTO CV (accountID, avatar, job, introduction, created_at, modified_at, achievements)
                     VALUES
                     (?, ?, null, null, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, null)""";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, accountID);
            ps.setString(2, avatar);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public CV getCVByAccountId(String AccountID) {
        CV c = new CV();
        String sql = "SELECT * FROM CV WHERE accountID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, AccountID);
            rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String avatar = rs.getString(3);
                String job = rs.getString(4);
                String introduction = rs.getString(5);
                Date created_at = rs.getDate(6);
                Date modified_at = rs.getDate(7);
                String achievements = rs.getString(8);
                c = new CV(id, AccountID, avatar, job, introduction, created_at, modified_at, achievements);
            }
        } catch (SQLException e) {
            System.out.println("getCVByAccountId:" + e.getMessage());
        }
        return c;
    }
    
    public void updateCVByAccountId(String accountID, String avatar, String job, String introduction, String achievements) {
        String sql = """
                     UPDATE CV
                     SET avatar = ?, job = ?, introduction = ?, modified_at = CURRENT_TIMESTAMP, achievements = ?
                     WHERE accountID = ?""";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, avatar);
            ps.setString(2, job);
            ps.setString(3, introduction);
            ps.setString(4, achievements);
            ps.setString(5, accountID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import java.sql.SQLException;
import model.CV_skill;
import model.Skill;

/**
 *
 * @author Admin
 */
public class SkillsDAO extends DBContext {

    public ArrayList<Skill> getSkills() {
        ArrayList<Skill> data = new ArrayList<Skill>();
        String sql = "SELECT id, [name] FROM Skill ORDER BY [name]";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt(1));
                String name = rs.getString(2);
                Skill s = new Skill(id, name);
                data.add(s);
            }
        } catch (SQLException e) {
            System.out.println("getSkills:" + e.getMessage());
        }
        return data;
    }

    public ArrayList<CV_skill> getCVSkillsByCVId(String id) {
        ArrayList<CV_skill> data = new ArrayList<CV_skill>();
        String sql = "SELECT * FROM CV_Skill WHERE cv_id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                String cvId = String.valueOf(rs.getInt(1));
                String skillId = rs.getString(2);
                CV_skill cvs = new CV_skill(cvId, skillId);
                data.add(cvs);
            }
        } catch (SQLException e) {
            System.out.println("getCVSkillsByCVId:" + e.getMessage());
        }
        return data;
    }

    public int getNumberOfSkill() {
        String sql = "SELECT COUNT(*) FROM Skill";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getNumberOfSkill:" + e.getMessage());
        }
        return -1;
    }

    public void deleteAllSelectedSkillById(String id) {
        String sql = "DELETE FROM CV_Skill WHERE cv_id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("deleteAllSelectedSkillById:" + e.getMessage());
        }
    }

    public float getAvgRatingByMentorId(String mentorId) {
        String sql = """
                     SELECT (ROUND(AVG(ratingstar) * 2, 0) / 2) AS rating FROM RateComment
                     WHERE mentorID = ?""";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, mentorId);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getFloat(1);
            }
        } catch (SQLException e) {
            System.out.println("getAvgRatingByMentorId:" + e.getMessage());
        }
        return 0;
    }

    public void insertSelectedSkillByCVId(String mentorId, String cvId, String skillId) {
        String sql = """
                     INSERT CV_Skill
                     VALUES
                     (?, ?, """ + getAvgRatingByMentorId(mentorId) + ")";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, cvId);
            ps.setString(2, skillId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("insertSelectedSkillByCVId:" + e.getMessage());
        }
    }
}

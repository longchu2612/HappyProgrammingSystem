/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.*;
import model.*;

/**
 *
 * @author catmi
 */
public class BookingDAO extends DBContext {

    public ArrayList<Mentor> getAllMentor(String[] selectedSkills) {
        ArrayList<Mentor> list = new ArrayList<>();
        List<Integer> skillIds = new ArrayList<>();
        if (selectedSkills != null) {
            for (String skillId : selectedSkills) {
                skillIds.add(Integer.parseInt(skillId));
            }
        }
        StringBuilder query1 = new StringBuilder("""
        Select acc.id as AccId, cv.id as cvId, acc.fullname, cv.job, acc.address, cv.avatar
               from Account acc
               join CV cv on acc.id = cv.accountID
               join CV_Skill cv_s on cv.id = cv_s.cv_id
               where 1=1 and acc.roleID = 2 and cv.status = 'Approve'
        """);
        if (!skillIds.isEmpty()) {
            query1.append(" and cv_s.skill_id in (");
            for (int i = 0; i < skillIds.size(); i++) {
                query1.append("?");
                if (i < skillIds.size() - 1) {
                    query1.append(",");
                }
            }
            query1.append(")");
        }
        query1.append("group by acc.id, acc.fullname, cv.job, acc.address, cv.id, cv.avatar");
        String query2 = """
                       select s.id, s.name
                       from Skill s
                       join CV_Skill cv_sk on s.id = cv_sk.skill_id
                       join CV cv on cv.id = cv_sk.cv_id
                       where cv.id = ?""";
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        ResultSet rs1 = null;
        ResultSet rs2 = null;

        try {
            conn = new DBContext().conn;
            ps1 = conn.prepareStatement(query1.toString());
            int paramIndex = 1;
            for (Integer skillId : skillIds) {
                ps1.setInt(paramIndex++, skillId);
            }
            rs1 = ps1.executeQuery();
            while (rs1.next()) {
                int AccId = rs1.getInt("AccId");
                int cvId = rs1.getInt("cvId");
                String fullname = rs1.getString("fullname");
                String job = rs1.getString("job");
                String address = rs1.getString("address");
                String avatar = rs1.getString("avatar");

                ArrayList<Skill> listS = new ArrayList<>();
                ps2 = conn.prepareStatement(query2);
                ps2.setInt(1, cvId);
                rs2 = ps2.executeQuery();
                while (rs2.next()) {
                    Skill s = new Skill();
                    s.setSkillId(rs2.getInt("id"));
                    s.setSkillName(rs2.getString("name"));
                    listS.add(s);
                }
                list.add(new Mentor(AccId, fullname, job, cvId, address, listS, avatar));
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (rs1 != null) {
                    rs1.close();
                }
                if (ps1 != null) {
                    ps1.close();
                }
                if (rs2 != null) {
                    rs2.close();
                }
                if (ps2 != null) {
                    ps2.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
        return null;
    }

    public ArrayList<Mentor> getAllMentorBySkillId(String skillId) {
        ArrayList<Mentor> list = new ArrayList<>();
        String query1 = """
                       Select acc.id as AccId, cv.id as cvId, acc.fullname, cv.job, acc.address, cv.avatar
                       from Account acc
                       join CV cv on acc.id = cv.accountID
                       join CV_Skill cv_s on cv.id = cv_s.cv_id
                       where acc.roleID = 2 and cv.status = 'Approve' and cv_s.skill_id = ?
                       group by acc.id ,acc.fullname, cv.job, acc.address, cv.id, cv.avatar
                       """;
        String query2 = """
                       select s.*
                       from Skill s
                       join CV_Skill cv_sk on s.id = cv_sk.skill_id
                       join CV cv on cv.id = cv_sk.cv_id
                       where cv.id = ?""";
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        ResultSet rs1 = null;
        ResultSet rs2 = null;

        try {
            conn = new DBContext().conn;
            ps1 = conn.prepareStatement(query1);
            ps1.setString(1, skillId);
            rs1 = ps1.executeQuery();
            while (rs1.next()) {
                int AccId = rs1.getInt("AccId");
                int cvId = rs1.getInt("cvId");
                String fullname = rs1.getString("fullname");
                String job = rs1.getString("job");
                String address = rs1.getString("address");
                String avatar = rs1.getString("avatar");

                ArrayList<Skill> listS = new ArrayList<>();
                ps2 = conn.prepareStatement(query2);
                ps2.setInt(1, cvId);
                rs2 = ps2.executeQuery();
                while (rs2.next()) {
                    Skill s = new Skill();
                    s.setSkillId(rs2.getInt("id"));
                    s.setSkillName(rs2.getString("name"));
                    listS.add(s);
                }
                list.add(new Mentor(AccId, fullname, job, cvId, address, listS, avatar));
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (rs1 != null) {
                    rs1.close();
                }
                if (ps1 != null) {
                    ps1.close();
                }
                if (rs2 != null) {
                    rs2.close();
                }
                if (ps2 != null) {
                    ps2.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
        return null;
    }

    public static void main(String[] args) {
        BookingDAO dao = new BookingDAO();
//        ArrayList<Mentor> list = dao.getAllMentor();
//        for (Mentor m : list) {
//            System.out.println(m);
//        }
    }
}

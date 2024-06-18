/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.*;
import model.Skill;

/**
 *
 * @author catmi
 */
public class SkillDAO extends DBContext {

    public ArrayList<Skill> getAllSkill() {

        ArrayList<Skill> listSkill = new ArrayList<>();
        String query = "SELECT * FROM happy_programming_system.dbo.Skill";
        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int skillId = rs.getInt("id");
                String skillName = rs.getString("name");
                int status = rs.getInt("status");
                String image = rs.getString("image");
                listSkill.add(new Skill(skillId, skillName, status, image));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
        return listSkill;
    }

    public Skill getSkillById(String id) {
        String query = "SELECT * from happy_programming_system.dbo.Skill where id = ?";
        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int skillId = rs.getInt("id");
                String skillName = rs.getString("name");
                int status = rs.getInt("status");
                String image = rs.getString("image");
                return new Skill(skillId, skillName, status, image);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
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

    public boolean addNewSkill(String name, String status) {
        if (getSkillByName(name) != null) {
            return false;
        }
        String query = "Insert into [dbo].[Skill]([name], [status]) values(?,?)";
        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, status);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
        return false;
    }

    public boolean updateSkill(String skillName, String status, String id) {
        String query = "update dbo.Skill set [name] = ?, [status] = ? where id = ?";
        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setString(1, skillName);
            ps.setString(2, status);
            ps.setString(3, id);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
        return false;
    }

    public boolean setStatus(String status, String id) {
        String query = "update dbo.Skill set [status] = ? where id = ?";
        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setString(1, status);
            ps.setString(2, id);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
        return false;
    }

    public Skill getSkillByName(String name) {
        String query = "select * from Skill where name = ?";
        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                int skillId = rs.getInt("id");
                String skillName = rs.getString("name");
                int status = rs.getInt("status");
                String image = rs.getString("image");
                return new Skill(skillId, skillName, status, image);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
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
    public ArrayList<String> getSkilCV(String id){
        ArrayList<String> list = new ArrayList<>();
        String query = """
                       select s.name
                       from Skill s
                       join CV_Skill cv_sk on s.id = cv_sk.skill_id
                       join CV cv on cv.id = cv_sk.cv_id
                       where cv.id = ?""";
        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
               list.add(rs.getString("name"));
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
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
        SkillDAO dao = new SkillDAO();
        ArrayList<String> list = dao.getSkilCV("2002");
        for(Object o : list){
            System.out.println(o);
        }
    }
}

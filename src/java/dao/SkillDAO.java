/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Skill;

/**
 *
 * @author catmi
 */
public class SkillDAO extends DBContext {

    public ArrayList<Skill> getAllSkill() {

//<<<<<<< HEAD
//        ArrayList listSkill = new ArrayList<Skill>();
//        String query = "select * from dbo.Skill";
//=======
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
        } catch (Exception e) {
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
            } catch (Exception e) {
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
        } catch (Exception e) {
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
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
        return null;
    }

    public boolean addNewSkill(String name, String status) {
        String query = "Insert into [dbo].[Skill]([name], [status]) values(?,?)";
        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, status);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
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
            } catch (Exception e) {
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
        } catch (Exception e) {
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
            } catch (Exception e) {
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
        } catch (Exception e) {
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
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
        return false;
    }


    public static void main(String[] args) {
        SkillDAO dao = new SkillDAO();
        // ArrayList list = dao.getAllSkill();
        //Skill s = dao.getSkillById("2");
        //boolean check = dao.addNewSkill("PhP", "1");
//        for (Object skill : list) {
//            System.out.println(skill);
//        }
        //System.out.println(s);
    }
}




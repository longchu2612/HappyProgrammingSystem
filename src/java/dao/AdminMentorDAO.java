/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.*;
import java.sql.*;
import model.Account;
import model.Mentor;

/**
 *
 * @author catmi
 */
public class AdminMentorDAO extends DBContext {

    public ArrayList<Mentor> getAllMentor() {
        ArrayList<Mentor> list = new ArrayList<>();
        String query = "WITH AccountFiltered AS (\n"
                + "    SELECT id, fullname, name,job, status\n"
                + "    FROM Account \n"
                + "    WHERE roleID = 2\n"
                + "),\n"
                + "RequestCounts AS (\n"
                + "    SELECT req.createdBy, COUNT(req.id) AS NOR\n"
                + "    FROM Request req\n"
                + "    JOIN Account acc ON acc.id = req.createdBy\n"
                + "    GROUP BY req.createdBy\n"
                + "    HAVING COUNT(req.id) > 1\n"
                + "),\n"
                + "AverageRatings AS (\n"
                + "    SELECT ra.mentorID, ROUND(AVG(ra.ratingstar),1) AS Rating\n"
                + "    FROM RateComment ra\n"
                + "    JOIN Account acc ON acc.id = ra.mentorID\n"
                + "    GROUP BY ra.mentorID\n"
                + "    HAVING COUNT(ra.id) > 1\n"
                + ")\n"
                + "SELECT af.*, rc.NOR, ar.Rating\n"
                + "FROM AccountFiltered af\n"
                + "LEFT JOIN RequestCounts rc ON af.id = rc.createdBy\n"
                + "LEFT JOIN AverageRatings ar ON af.id = ar.mentorID";
        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String fullname = rs.getString("fullname");
                String username = rs.getString("name");
                String job = rs.getString("job");
                int status = rs.getInt("status");
                int nOR = rs.getInt("NOR");
                float rating = rs.getFloat("Rating");
                list.add(new Mentor(id, fullname, username, job, status, nOR, rating));
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
        return list;
    }

    public ArrayList<Mentor> searchByFullName(String name) {
        ArrayList<Mentor> list = new ArrayList<>();
        String query = "WITH AccountFiltered AS (\n"
                + "    SELECT id, fullname, name,job, status\n"
                + "    FROM Account \n"
                + "    WHERE roleID = 2 and fullname like ?\n"
                + "),\n"
                + "RequestCounts AS (\n"
                + "    SELECT req.createdBy, COUNT(req.id) AS NOR\n"
                + "    FROM Request req\n"
                + "    JOIN Account acc ON acc.id = req.createdBy\n"
                + "    GROUP BY req.createdBy\n"
                + "    HAVING COUNT(req.id) > 1\n"
                + "),\n"
                + "AverageRatings AS (\n"
                + "    SELECT ra.mentorID, ROUND(AVG(ra.ratingstar),1) AS Rating\n"
                + "    FROM RateComment ra\n"
                + "    JOIN Account acc ON acc.id = ra.mentorID\n"
                + "    GROUP BY ra.mentorID\n"
                + "    HAVING COUNT(ra.id) > 1\n"
                + ")\n"
                + "SELECT af.*, rc.NOR, ar.Rating\n"
                + "FROM AccountFiltered af\n"
                + "LEFT JOIN RequestCounts rc ON af.id = rc.createdBy\n"
                + "LEFT JOIN AverageRatings ar ON af.id = ar.mentorID";
        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String fullname = rs.getString("fullname");
                String username = rs.getString("name");
                String job = rs.getString("job");
                int status = rs.getInt("status");
                int nOR = rs.getInt("NOR");
                float rating = rs.getFloat("Rating");
               list.add(new Mentor(id, fullname, username, job, status, nOR, rating));
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
        return list;
    }

    public ArrayList<Mentor> searchByUsername(String name) {
        ArrayList<Mentor> list = new ArrayList<>();
        String query = "DECLARE @name NVARCHAR(100) = ?;\n"
                + "if @name <> ''\n"
                + "begin\n"
                + "WITH AccountFiltered AS (\n"
                + "    SELECT id, fullname, name,job, status\n"
                + "    FROM Account \n"
                + "    WHERE roleID = 2 AND [name] LIKE '%' + @name + '%'\n"
                + "),\n"
                + "RequestCounts AS (\n"
                + "    SELECT req.createdBy, COUNT(req.id) AS NOR\n"
                + "    FROM Request req\n"
                + "    JOIN Account acc ON acc.id = req.createdBy\n"
                + "    GROUP BY req.createdBy\n"
                + "    HAVING COUNT(req.id) > 1\n"
                + "),\n"
                + "AverageRatings AS (\n"
                + "    SELECT ra.mentorID, ROUND(AVG(ra.ratingstar),1) AS Rating\n"
                + "    FROM RateComment ra\n"
                + "    JOIN Account acc ON acc.id = ra.mentorID\n"
                + "    GROUP BY ra.mentorID\n"
                + "    HAVING COUNT(ra.id) > 1\n"
                + ")\n"
                + "SELECT af.*, rc.NOR, ar.Rating\n"
                + "FROM AccountFiltered af\n"
                + "LEFT JOIN RequestCounts rc ON af.id = rc.createdBy\n"
                + "LEFT JOIN AverageRatings ar ON af.id = ar.mentorID;\n"
                + "END\n"
                + "ELSE\n"
                + "BEGIN\n"
                + "    SELECT CAST(NULL AS INT) AS id, \n"
                + "           CAST(NULL AS NVARCHAR(255)) AS fullname, \n"
                + "           CAST(NULL AS NVARCHAR(255)) AS name, \n"
                + "           CAST(NULL AS NVARCHAR(255)) AS status, \n"
                + "           CAST(NULL AS INT) AS NOR, \n"
                + "           CAST(NULL AS DECIMAL(3,1)) AS Rating\n"
                + "    WHERE 1 = 0;\n"
                + "END";
        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String fullname = rs.getString("fullname");
                String username = rs.getString("name");
                String job = rs.getString("job");
                int status = rs.getInt("status");
                int nOR = rs.getInt("NOR");
                float rating = rs.getFloat("Rating");
               list.add(new Mentor(id, fullname, username, job, status, nOR, rating));
            }
            return list;
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

    public boolean setStatus(String id, int status) {
        String query = "update Account set [status] = ? where id = ?";
        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setInt(1, status);
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
        AdminMentorDAO dao = new AdminMentorDAO();
//        ArrayList<Mentor> list = dao.searchByUsername("minh");
//        for (Mentor m : list) {
//            System.out.println(m);
//        }
        boolean check = dao.setStatus("46", 1);
        System.out.println(check);
    }
}

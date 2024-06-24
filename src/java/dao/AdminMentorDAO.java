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
        String query = """
                       WITH AccountFiltered AS (
                           SELECT acc.id, acc.fullname, acc.name, cv.job, acc.status
                           FROM Account acc    
                           JOIN CV cv on acc.id = cv.accountID
                           WHERE roleID = 2
                       ),
                       RequestCounts AS (
                           SELECT req.createdBy, COUNT(req.id) AS NOR
                           FROM Request req
                           JOIN Account acc ON acc.id = req.createdBy
                           GROUP BY req.createdBy
                           HAVING COUNT(req.id) > 1
                       ),
                       AverageRatings AS (
                           SELECT ra.mentorID, ROUND(AVG(ra.ratingstar),1) AS Rating
                           FROM RateComment ra
                           JOIN Account acc ON acc.id = ra.mentorID
                           GROUP BY ra.mentorID
                           HAVING COUNT(ra.id) >= 1
                       )
                       SELECT af.*, rc.NOR, ar.Rating
                       FROM AccountFiltered af
                       LEFT JOIN RequestCounts rc ON af.id = rc.createdBy
                       LEFT JOIN AverageRatings ar ON af.id = ar.mentorID""";
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
        return list;
    }

    public ArrayList<Mentor> searchByFullName(String name) {
        ArrayList<Mentor> list = new ArrayList<>();
        String query = """
                       WITH AccountFiltered AS (
                           SELECT acc.id, acc.fullname, acc.name, cv.job, acc.status
                           FROM Account acc     
                           JOIN CV cv on acc.id = cv.accountID
                           WHERE roleID = 2 and fullname like ?
                       ),
                       RequestCounts AS (
                           SELECT req.createdBy, COUNT(req.id) AS NOR
                           FROM Request req
                           JOIN Account acc ON acc.id = req.createdBy
                           GROUP BY req.createdBy
                           HAVING COUNT(req.id) >= 1
                       ),
                       AverageRatings AS (
                           SELECT ra.mentorID, ROUND(AVG(ra.ratingstar),1) AS Rating
                           FROM RateComment ra
                           JOIN Account acc ON acc.id = ra.mentorID
                           GROUP BY ra.mentorID
                           HAVING COUNT(ra.id) >= 1
                       )
                       SELECT af.*, rc.NOR, ar.Rating
                       FROM AccountFiltered af
                       LEFT JOIN RequestCounts rc ON af.id = rc.createdBy
                       LEFT JOIN AverageRatings ar ON af.id = ar.mentorID""";
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
        return list;
    }

    public ArrayList<Mentor> searchByUsername(String name) {
        ArrayList<Mentor> list = new ArrayList<>();
        String query = """
                       WITH AccountFiltered AS (
                                                  SELECT acc.id, acc.fullname, acc.name, cv.job, acc.status
                                                  FROM Account acc
                                                  JOIN CV cv on acc.id = cv.accountID
                                                  WHERE roleID = 2 AND [name] = ?
                                              ),
                                              RequestCounts AS (
                                                  SELECT req.createdBy, COUNT(req.id) AS NOR
                                                  FROM Request req
                                                  JOIN Account acc ON acc.id = req.createdBy
                                                  GROUP BY req.createdBy
                                                  HAVING COUNT(req.id) >= 1
                                              ),
                                              AverageRatings AS (
                                                  SELECT ra.mentorID, ROUND(AVG(ra.ratingstar),1) AS Rating
                                                  FROM RateComment ra
                                                  JOIN Account acc ON acc.id = ra.mentorID
                                                  GROUP BY ra.mentorID
                                                  HAVING COUNT(ra.id) >= 1
                                              )
                                              SELECT af.*, rc.NOR, ar.Rating
                                              FROM AccountFiltered af
                                              LEFT JOIN RequestCounts rc ON af.id = rc.createdBy
                                              LEFT JOIN AverageRatings ar ON af.id = ar.mentorID;""";
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

    public boolean setStatus(String id, int status) {
        String query = "update Account set [status] = ? where id = ?";
        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setInt(1, status);
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

    public static void main(String[] args) {
        AdminMentorDAO dao = new AdminMentorDAO();
        ArrayList<Mentor> list = dao.searchByUsername("Khánh");
        for (Mentor m : list) {
            System.out.println(m);
        }
        System.out.println(list.size());

    }
}

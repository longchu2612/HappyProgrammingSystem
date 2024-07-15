/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Date;
import java.sql.SQLException;
import java.util.*;
import model.*;

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
                     INSERT INTO CV (accountID, avatar, job, introduction, created_at, modified_at, achievements, status)
                     VALUES
                     (?, ?, null, null, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, null, 'Draft')""";
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
                String id = String.valueOf(rs.getInt(1));
                String avatar = rs.getString(3);
                String job = rs.getString(4);
                String introduction = rs.getString(5);
                Date created_at = rs.getDate(6);
                Date modified_at = rs.getDate(7);
                String achievements = rs.getString(8);
                String status = rs.getString(9);
                String note = rs.getString(10);
                String rate = String.valueOf(rs.getInt(11));
                c = new CV(id, AccountID, avatar, job, introduction, created_at, modified_at, achievements, status, note, rate);
            }
        } catch (SQLException e) {
            System.out.println("getCVByAccountId:" + e.getMessage());
        }
        return c;
    }

    public void updateCVByAccountId(String accountID, String avatar, String job, String introduction, String achievements, String rate) {
        String sql = """
                     UPDATE CV
                     SET avatar = ?, job = ?, introduction = ?, modified_at = CURRENT_TIMESTAMP, achievements = ?, status = ?, note = ?, rate = ?
                     WHERE accountID = ?""";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, avatar);
            ps.setString(2, job);
            ps.setString(3, introduction);
            ps.setString(4, achievements);
            ps.setString(5, "Pending");
            ps.setString(6, null);
            ps.setString(7, rate);
            ps.setString(8, accountID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<CV_Request> displayCVAdmin() {
        ArrayList<CV_Request> list = new ArrayList<>();
        String query = """
                       SELECT cv.id, cv.accountID, acc.fullname , cv.job, cv.status, cv.note, cv.rate
                       FROM CV cv
                       join Account acc on cv.accountID = acc.id""";
        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String fullname = rs.getString("fullname");
                String accountID = rs.getString("accountID");
                String job = rs.getString("job");
                String status = rs.getString("status");
                String note = rs.getString("note");
                String rate = String.valueOf(rs.getInt("rate"));
                list.add(new CV_Request(id, accountID, job, status, note, fullname, rate));
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

    public ArrayList<CV> displayCVAdminByStatus(String txtStatus) {
        ArrayList<CV> list = new ArrayList<>();
        String query = """
                       SELECT cv.id, cv.accountID, acc.fullname , cv.job, cv.status, cv.note, cv.rate
                       FROM CV cv
                       join Account acc on cv.accountID = acc.id
                       where cv.status = ? """;
        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setString(1, txtStatus);
            rs = ps.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String fullname = rs.getString("fullname");
                String accountID = rs.getString("accountID");
                String job = rs.getString("job");
                String status = rs.getString("status");
                String note = rs.getString("note");
                String rate = String.valueOf(rs.getInt("rate"));
                list.add(new CV_Request(id, accountID, job, status, note, fullname, rate));
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

    public boolean setCVStatus(String id, String status, String note) {
        String query = "update CV set [status] = ?, note =? where id = ?";
        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setString(1, status);
            ps.setString(2, note);
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

    public CV getCVByAccId(String txtId) {
        String query = """
                       select *
                       from CV
                       where accountID = ?""";
        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setString(1, txtId);
            rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String accId = rs.getString("accountID");
                String avatar = rs.getString("avatar");
                String job = rs.getString("job");
                String introduction = rs.getString("introduction");
                Date created_at = rs.getDate("created_at");
                Date modified_at = rs.getDate("modified_at");
                String achievements = rs.getString("achievements");
                String status = rs.getString("status");
                String note = rs.getString("note");
                String rate = String.valueOf(rs.getInt("rate"));
                return new CV(id, accId, avatar, job, introduction, created_at, modified_at, achievements, status, note, rate);
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
}

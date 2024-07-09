/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.util.*;
import model.*;

public class RequestDAO extends DBContext {

    public boolean createRequest(String title, Timestamp deadline, String content, String status, String createdBy, Timestamp createdDate) {
        String query = """
                       INSERT INTO Request (title, deadline,content,status,createdBy,createdDate)
                       values(?,?,?,?,?,?)""";

        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setString(1, title);
            ps.setTimestamp(2, deadline);
            ps.setString(3, content);
            ps.setString(4, status);
            ps.setString(5, createdBy);
            ps.setTimestamp(6, createdDate);
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

    public boolean updateRequest(String id, String title, Timestamp deadline, String content, String status, Timestamp createdDate) {
        String query = """
                       Update Request set title = ?, deadline = ?,content = ?,status = ?,createdDate = ?
                       where id = ?
                       """;

        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setString(1, title);
            ps.setTimestamp(2, deadline);
            ps.setString(3, content);
            ps.setString(4, status);
            ps.setTimestamp(5, createdDate);
            ps.setString(6, id);
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

    public int getIdNewRequest() {
        String query = """
                       select top 1 id from Request order by id desc""";

        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt("id");
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
        return 0;
    }

    public ArrayList<Request> getRequestByCreateBy(int txtId) {
        ArrayList<Request> list = new ArrayList<>();
        String query = """
                       select *
                       from Request
                       where createdBy = ?""";

        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setInt(1, txtId);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                LocalDateTime deadline = Timestamp.valueOf(rs.getString("deadline")).toLocalDateTime();
                String content = rs.getString("content");
                String status = rs.getString("status");
                int createdBy = rs.getInt("createdBy");
                LocalDateTime createdDate = Timestamp.valueOf(rs.getString("createdDate")).toLocalDateTime();
                list.add(new Request(id, title, deadline, content, status, createdBy, createdDate));
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

    public boolean createRequestCourse(int req_id, int toUser_id, int skill_id, int numOfSlot) {
        String query = """
                       Insert into Request_Course(req_id, toUser_id, skill_id, numOfSlot)
                       values(?,?,?,?)
                       """;

        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setInt(1, req_id);
            ps.setInt(2, toUser_id);
            ps.setInt(3, skill_id);
            ps.setInt(4, numOfSlot);
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
    public boolean updateRequestCourse(int reqId, int skillId, int numOfSlot){
        String query = """
                       update Request_Course
                       set skill_id = ?, numOfSlot = ?
                       where req_id = ? 
                       """;

        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setInt(3, reqId);
            ps.setInt(1, skillId);
            ps.setInt(2, numOfSlot);
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
    public Request getRequestByReqId(int txtId) {
        String query = """
                       select *
                       from Request
                       where id = ?""";

        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setInt(1, txtId);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                LocalDateTime deadline = Timestamp.valueOf(rs.getString("deadline")).toLocalDateTime();
                String content = rs.getString("content");
                String status = rs.getString("status");
                int createdBy = rs.getInt("createdBy");
                LocalDateTime createdDate = Timestamp.valueOf(rs.getString("createdDate")).toLocalDateTime();
                return new Request(id, title, deadline, content, status, createdBy, createdDate);
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

    public Request checkRequestDraft(int menteeId, int mentorId) {
        String query = """
                       select req.* 
                       from Request req
                       join Request_Course reqc on req.id = reqc.req_id
                       join Account acc on acc.id = reqc.toUser_id 
                       Where req.createdBy = ? and req.status = 1 and acc.id = ?""";

        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setInt(1, menteeId);
            ps.setInt(2, mentorId);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                LocalDateTime deadline = Timestamp.valueOf(rs.getString("deadline")).toLocalDateTime();
                String content = rs.getString("content");
                String status = rs.getString("status");
                int createdBy = rs.getInt("createdBy");
                LocalDateTime createdDate = Timestamp.valueOf(rs.getString("createdDate")).toLocalDateTime();
                return new Request(id, title, deadline, content, status, createdBy, createdDate);
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

    public static void main(String[] args) {
        RequestDAO dao = new RequestDAO();
        //ArrayList<Request> list = dao.getRequestByCreateBy("2068");
        LocalDateTime test = LocalDateTime.now();
        Timestamp convert = Timestamp.valueOf(test);
        //boolean check1 = dao.createRequest("abc", convert, "abc", "1", "2086", convert);
        //boolean check2 = dao.createRequestCourse(dao.getIdNewRequest(), 2078, 6, 4);
        //System.out.println("Id request:" + dao.getIdNewRequest() + ", Request: " + check1 + ", Request course: " + check2);
        Request req = dao.checkRequestDraft(2086, 2078);
        System.out.println(req);
    }
}

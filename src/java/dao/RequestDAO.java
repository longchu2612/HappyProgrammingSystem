/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.SQLException;
import java.time.LocalDateTime;
import java.sql.Timestamp;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.Year;
import java.time.temporal.TemporalAdjusters;
import java.time.temporal.WeekFields;
import java.util.Locale;

/**
 *
 * @author asus
 */
public class RequestDAO extends DBContext {

    public int insertRequest(String title, String deadline, String content, String status, int createdBy) {

        int result = -1;
        String sql = "Insert into Request (title, deadline, content, status, createdBy, createdDate) \n"
                + "Values (?,?,?,?,?,?)";
        LocalDateTime localDateTime = LocalDateTime.parse(deadline);
        Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
        try {

            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, title);
            Timestamp timestamp = Timestamp.valueOf(localDateTime);
            ps.setTimestamp(2, timestamp);
            ps.setString(3, content);
            ps.setString(4, status);
            ps.setInt(5, createdBy);
            ps.setTimestamp(6, currentTimestamp);
            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        result = rs.getInt(1);
                    }
                }
            }
        } catch (SQLException ex) {
            System.out.println("An error occurred while inserting the account: " + ex.getMessage());
            ex.printStackTrace();
        } catch (Exception ex) {
            System.out.println("An error occurred while inserting the account: " + ex.getMessage());
            ex.printStackTrace();
        }
        return result;
    }

    public int insertRequestSkill(int requestId, int skillId) {

        int result = 0;
        String sql = "  Insert into dbo.Request_skill (requestID, skillID) Values (?, ?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, requestId);
            ps.setInt(2, skillId);
            result = ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("An error occurred while inserting the account: " + e.getMessage());
            e.printStackTrace();
        }
        return result;

    }
       
    
    
    public static void main(String[] args) throws SQLException {
        

    }

    

}

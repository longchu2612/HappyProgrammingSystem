/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Request;
import model.Request_Course;
import model.Schedule;
import model.Skill;

/**
 *
 * @author asus
 */
public class RequestCourseDAO extends DBContext {

    public List<Request_Course> getAllRequestCourseOfMentor(int mentorId) {
        List<Request_Course> list = new ArrayList<>();
        String sql = "select req_course.reqc_id, req.id as requestId, schedule.id as scheduleId ,mentee.fullname,skill.id as skill_id,skill.name, req.createdDate, req_course.status from dbo.Request_Course as req_course \n"
                + "inner join Request as req on req_course.req_id = req.id\n"
                + "inner join Account as mentor on req_course.toUser_id = mentor.id\n"
                + "inner join Skill as skill on req_course.skill_id = skill.id\n"
                + "inner join Schedules as schedule on req_course.schedule_id = schedule.id\n"
                + "inner join Account as mentee on req_course.mentee_id = mentee.id \n"
                + "where toUser_id = ?";

        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, mentorId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Request_Course request_course = new Request_Course();
                request_course.setRepc_id(rs.getInt("reqc_id"));
                Request request = new Request();
                request.setId(rs.getInt("requestId"));
                request.setCreatedDate(rs.getTimestamp("createdDate").toLocalDateTime());
                request_course.setRequest(request);
                Schedule schedule = new Schedule();
                schedule.setId(rs.getInt("scheduleId"));
                request_course.setSchedule(schedule);
                Account mentee = new Account();
                mentee.setAccount_name(rs.getString("fullname"));
                request_course.setMentee(mentee);
                Skill skill = new Skill();
                skill.setSkillId(rs.getInt("skill_id"));
                skill.setName(rs.getString("name"));
                request_course.setSkill(skill);
                request_course.setStatus(rs.getString("status"));
                list.add(request_course);
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

}

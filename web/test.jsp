<%@ page import="java.util.ArrayList" %>
<%@ page import="model.CV_skill" %>
<%@ page import="dao.SkillDAO" %>
<%@ page import="dao.SkillsDAO" %>

<%
    // Assuming Cvid is passed as a parameter, replace with actual retrieval method if different
    String Cvid = "2004"; 
    SkillsDAO s = new SkillsDAO(); // Assuming you have a service to get the skills
    ArrayList<CV_skill> cvs = (ArrayList<CV_skill>) s.getAllByCVId(Cvid);
    SkillDAO sk = new SkillDAO();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Skills</title>
</head>
<body>
    <h1>Skills</h1>
    <ul>
        <%
            for (CV_skill cvSkill : cvs) {
                String skillId = cvSkill.getSkill_id();
                String skill = sk.getskillbySkillID(skillId);
                String rating = cvSkill.getRating_star(); // Correctly retrieving the rating from cvSkill
        %>
            <li><%= skill %>: <%= rating %></li>
        <%
            }
        %>
    </ul>
</body>
</html>

<%-- 
    Document   : request-booking
    Created on : Jul 3, 2024, 7:31:58 PM
    Author     : catmi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="helper.ScheduleHelper" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.List" %>
<%@page import="model.Slot" %>
<%@page import="model.Request" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.temporal.WeekFields" %>
<%@ page import="java.time.DayOfWeek" %>
<%@ page import="java.time.temporal.ChronoUnit" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Create request</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">

    </head>
    <body>

        <div class="main-wrapper">

            <jsp:include page="header.jsp"/>
            <div class="breadcrumb-bar">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-12 col-12">
                            <nav aria-label="breadcrumb" class="page-breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Profile Settings</li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">Create Request</h2>
                        </div>
                    </div>
                </div>
            </div>



            <div class="content">
                <div class="container-fluid">

                    <div class="row">

                        <div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">

                            <div class="profile-sidebar">
                                <div class="user-widget">
                                    <div class="pro-avatar">JD</div>
                                    <div class="rating">
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star"></i>
                                    </div>
                                    <div class="user-info-cont">
                                        <h4 class="usr-name">Jonathan Doe</h4>
                                        <p class="mentor-type">English Literature (M.A)</p>
                                    </div>
                                </div>
                                <div class="progress-bar-custom">
                                    <h6>Complete your profiles ></h6>
                                    <div class="pro-progress">
                                        <div class="tooltip-toggle" tabindex="0"></div>
                                        <div class="tooltip">80%</div>
                                    </div>
                                </div>
                                <div class="custom-sidebar-nav">
                                    <ul>
                                        <li><a href="dashboard.html"><i class="fas fa-home"></i>Dashboard <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="bookings.html"><i class="fas fa-clock"></i>Bookings <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="schedule-timings.html"><i class="fas fa-hourglass-start"></i>Schedule Timings <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="chat.html"><i class="fas fa-comments"></i>Messages <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="profile.html"><i class="fas fa-user-cog"></i>Profile <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="login.html"><i class="fas fa-sign-out-alt"></i>Logout <span><i class="fas fa-chevron-right"></i></span></a></li>
                                    </ul>
                                </div>
                            </div>

                        </div>

                        <% Boolean isFormFilled = (Boolean) request.getAttribute("isFormFilled"); %>
                        <% if (isFormFilled == null || !isFormFilled) {%>
                        <div class="col-md-7 col-lg-8 col-xl-9">


                            <div class="card">
                                <div class="card-body">
                                    <form action="request" method="post">
                                        <input type="hidden" name="action" value="create_request"/>
                                        <input type="hidden" name="cvId_form_createRequest" value="${requestScope.cvId}"/>
                                        <input type="hidden" name="mentorId_form_createRequest" value="${requestScope.accountId}"/>
                                        <h3 class="text-center text-black">Create Request</h3>
                                        <h4 style="color: red; align-content: center;">
                                            ${requestScope.errorMessage}
                                        </h4>
                                        <div class="form-group">
                                            <label for="title" class="form-label">Title:</label>
                                            <input type="text" class="form-control" id="title" name="title" value="${requestScope.title}" >

                                        </div>
                                        <div class="form-group">
                                            <label for="skills" class="form-label">Skill:</label>
                                            <div class="d-flex">
                                                <c:forEach items="${listS}" var="s" varStatus="loop">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" id="skill-${s.skillId}" name="skills" value="${s.skillId}"  ${loop.index == 0 ? 'checked' : ''} <c:if test="${s.skillId == skill}">checked</c:if>>
                                                        <label class="form-check-label" for="skill-${s.skillId}">${s.skillName}</label>
                                                    </div>
                                                </c:forEach>
                                            </div>

                                        </div>
                                        <div class="form-group">
                                            <label for="deadline" class="form-label">Deadline</label>
                                            <input type="datetime-local" class="form-control" id="deadline" name="deadline" value="${requestScope.deadline}">
                                        </div>
                                        <div class="form-group">
                                            <label for="content" class="form-label">Content</label>
                                            <textarea class="form-control" id="content" name="content" rows="5" >${requestScope.content}</textarea>

                                        </div>
                                        <div class="form-group">
                                            <button type="submit" name="button_action" value="save" class="btn btn-primary">Save</button>
                                            <button type="submit" name="button_action" value="create_schedule" class="btn btn-primary">Create Schedule</button>
                                        </div>
                                    </form>




                                </div>
                            </div>

                        </div>
                        <% } else { %>
                        <div class="col-md-7 col-lg-8 col-xl-9">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row form-row">
                                        <div class="col-12 col-md-12">
                                            <%
                                                Request req = (Request) session.getAttribute("request");
                                                String skill = (String) session.getAttribute("skill"); 
                                                if (req != null) {
                                                String title = req.getTitle();
                                                String content = req.getContent();
                                                String deadline = req.getDeadline().toString();
                                                
                                                String link = "request?title=" + title + "&content=" + content + "&deadline=" + deadline + "&skill=" + skill;

                                            %>

                                            <div>
                                                <a class="btn btn-secondary mb-3" href="<%= link %>">Back</a>
                                            </div>
                                            <%
                                                }
                                            %>

                                            <div class="form-group">
                                                <h4>Add Schedule</h4>
                                            </div>
                                        </div>
                                        <div class="row">   


                                            <div class="col-12 col-md-2 mb-3"> 
                                                <label>Year:</label>

                                                <form id="updateYear" action="request" method="Post">

                                                    <input type="hidden" name="action" value="update_year"/>
                                                    <input type="hidden" name="month_form_updateyear" value="${requestScope.month}"/>
                                                    <select style="margin-bottom: 5px;" id="yearForm" class="form-select" name="selectYear">
                                                        <option value="2023" ${requestScope.currentYear == 2023 ? 'selected' : ''}>2023</option>
                                                        <option value="2024" ${requestScope.currentYear == 2024 ? 'selected' : ''}>2024</option>
                                                        <option value="2025" ${requestScope.currentYear == 2025 ? 'selected' : ''}>2025</option>
                                                        <option value="2026" ${requestScope.currentYear == 2026 ? 'selected' : ''}>2026</option>
                                                    </select><br>

                                                    <input type="hidden"  name="scheduleId" value="${requestScope.scheduleId}"/>
                                                </form>
                                            </div>


                                            <div class="col-12 col-md-2 mb-3">

                                                <label>Month:</label>

                                                <select class="form-select" name="selectMonth" aria-label="Default select example" disabled>
                                                    <option value="1" ${requestScope.month == 1 ? 'selected' : ''}>January </option>
                                                    <option value="2" ${requestScope.month == 2 ? 'selected' : ''}>February</option>
                                                    <option value="3" ${requestScope.month == 3 ? 'selected' : ''}>March</option>
                                                    <option value="4" ${requestScope.month == 4 ? 'selected' : ''}>April</option>
                                                    <option value="5" ${requestScope.month == 5 ? 'selected' : ''}>May</option>
                                                    <option value="6" ${requestScope.month == 6 ? 'selected' : ''}>June</option>
                                                    <option value="7" ${requestScope.month == 7 ? 'selected' : ''}>July</option>
                                                    <option value="8" ${requestScope.month == 8 ? 'selected' : ''}>August</option>
                                                    <option value="9" ${requestScope.month == 9 ? 'selected' : ''}>September</option>
                                                    <option value="10" ${requestScope.month == 10 ? 'selected' : ''} >October</option>
                                                    <option value="11" ${requestScope.month == 11 ? 'selected' : ''}>November</option>
                                                    <option value="12" ${requestScope.month == 12 ? 'selected' : ''}>December</option>
                                                </select>
                                            </div>

                                            <div class="col-12 col-md-3 mb-3">
                                                <label>Week:</label>
                                                <form id="updateWeek" action="request" method="Post">
                                                    <input type="hidden"  name="action" value="update_week"/>
                                                    <input type="hidden"  name="month_form_updateweek" value="${requestScope.month}"/>
                                                    <input type="hidden"  name="schedule_id" value="${requestScope.scheduleId}"/>
                                                    <input type="hidden" name="value_year" value="${requestScope.currentYear}"/>

                                                    <select id="weekSelect" name="selectedWeek" class="form-select" onchange="submitForm()">
                                                        <%                                                            List<String> weeks = (List<String>) request.getAttribute("weeks");
                                                            Integer currentIsoWeek = (Integer) request.getAttribute("isoWeek");
                                                            int weekIndex = 1;

                                                            if (weeks != null && !weeks.isEmpty()) {
                                                                for (String week : weeks) {
                                                        %>
                                                        <option value="<%= weekIndex%>" <% if (weekIndex == currentIsoWeek) { %>selected<% }%>><%= week%></option>
                                                        <%
                                                                weekIndex++;
                                                            }
                                                        } else {
                                                        %>
                                                        <option value="">No weeks available</option>
                                                        <%
                                                            }
                                                        %>
                                                    </select>

                                                </form>
                                            </div>


                                        </div>         
                                        <form action="request" method="Post">

                                            <input type="hidden"  name="action" value="update_schedule_week"/>
                                            <input type="hidden" name="year_update_schedule" value="${requestScope.currentYear}"/>
                                            <input type="hidden"  name="week_update_schedule" value="${requestScope.isoWeek}"/>
                                            <input type="hidden" name="month_update_schedule" value="${requestScope.month}"/>
                                            <input type="hidden" name="schedule_id_schedule" value="${requestScope.scheduleId}"/>
                                            <input type="hidden" name="accountId" value="${requestScope.accountId}"/>
                                            <div class="col-12 col-md-12">

                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>

                                                            <th rowspan="2"> 






                                                            </th>
                                                            <th>Monday</th>
                                                            <th>Tuesday</th>
                                                            <th>Wednesday</th>
                                                            <th>Thursday</th>
                                                            <th>Friday</th>
                                                            <th>Saturday</th>
                                                            <th>Sunday</th>
                                                        </tr>



                                                        <tr id="weekDays">
                                                            <%
                                                                // Lấy mảng weekDates từ model attribute
                                                                String[] weekDates = (String[]) request.getAttribute("weekDates");

                                                                // Kiểm tra nếu weekDates không null và có phần tử
                                                                if (weekDates != null && weekDates.length > 0) {
                                                                    for (String date : weekDates) {
                                                            %>
                                                            <td><%= date%></td>
                                                            <%
                                                                }
                                                            } else {
                                                            %>
                                                            <td colspan="7">No data available</td>
                                                            <% }%>
                                                        </tr>

                                                    </thead>

                                                    <tbody>

                                                    <h5>${requestScope.message}</h5>

                                                    <%
                                                        List<Slot> slots = (List<Slot>) request.getAttribute("slots");
                                                    %>
                                                    <%
                                                        int currentMonth = Integer.parseInt(String.valueOf(request.getAttribute("month")));
                                                    %>



                                                    <tr>
                                                        <td>Slot 1 (7h30 --> 9h30)</td>
                                                        <td><input type="checkbox" id="mon1" name="slot_1" value="1" data-slot="1" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 1, weekDates[0])%> <% if (!weekDates[0].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="0" ></td>
                                                        <td><input type="checkbox" id="tue1" name="slot_1" value="2" data-slot="1" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 1, weekDates[1])%> <% if (!weekDates[1].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="1" ></td>
                                                        <td><input type="checkbox" id="wed1" name="slot_1" value="3" data-slot="1" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 1, weekDates[2])%> <% if (!weekDates[2].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="2" ></td>
                                                        <td><input type="checkbox" id="thu1" name="slot_1" value="4" data-slot="1" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 1, weekDates[3])%> <% if (!weekDates[3].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="3" ></td>
                                                        <td><input type="checkbox" id="fri1" name="slot_1" value="5" data-slot="1" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 1, weekDates[4])%> <% if (!weekDates[4].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="4" ></td>
                                                        <td><input type="checkbox" id="sat1" name="slot_1" value="6" data-slot="1" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 1, weekDates[5])%> <% if (!weekDates[5].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="5" ></td>
                                                        <td><input type="checkbox" id="sun1" name="slot_1" value="7" data-slot="1" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 1, weekDates[6])%> <% if (!weekDates[6].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="6" ></td>
                                                    </tr>

                                                    <tr>
                                                        <td>Slot 2 (9h45 --> 11h45)</td>
                                                        <td><input type="checkbox" id="mon2" name="slot_2" value ="1" data-slot="2" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 2, weekDates[0])%> <% if (!weekDates[0].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="0"  ></td>
                                                        <td><input type="checkbox" id="tue2" name="slot_2" value ="2"  data-slot="2" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 2, weekDates[1])%> <% if (!weekDates[1].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="1"  ></td>
                                                        <td><input type="checkbox" id="wed2" name="slot_2" value ="3" data-slot="2" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 2, weekDates[2])%> <% if (!weekDates[2].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="2"  ></td>
                                                        <td><input type="checkbox" id="thu2" name="slot_2" value ="4" data-slot="2" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 2, weekDates[3])%> <% if (!weekDates[3].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="3"  ></td>
                                                        <td><input type="checkbox" id="fri2" name="slot_2" value ="5"  data-slot="2" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 2, weekDates[4])%> <% if (!weekDates[4].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="4"  ></td>
                                                        <td><input type="checkbox" id="sat2" name="slot_2" value ="6" data-slot="2" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 2, weekDates[5])%> <% if (!weekDates[5].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="5"  ></td>
                                                        <td><input type="checkbox" id="sun2" name="slot_2" value ="7" data-slot="2" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 2, weekDates[6])%> <% if (!weekDates[6].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="6" ></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Slot 3 (13h30 --> 15h30)</td>
                                                        <td><input type="checkbox" id="mon3" name="slot_3" value ="1" data-slot="3" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 3, weekDates[0])%> <% if (!weekDates[0].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="0"  ></td>
                                                        <td><input type="checkbox" id="tue3" name="slot_3" value ="2" data-slot="3" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 3, weekDates[1])%> <% if (!weekDates[1].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="1" ></td>
                                                        <td><input type="checkbox" id="wed3" name="slot_3" value ="3" data-slot="3" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 3, weekDates[2])%> <% if (!weekDates[2].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="2" ></td>
                                                        <td><input type="checkbox" id="thu3" name="slot_3" value ="4" data-slot="3" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 3, weekDates[3])%> <% if (!weekDates[3].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="3" ></td>
                                                        <td><input type="checkbox" id="fri3" name="slot_3" value ="5" data-slot="3" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 3, weekDates[4])%> <% if (!weekDates[4].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="4" ></td>
                                                        <td><input type="checkbox" id="sat3" name="slot_3" value ="6" data-slot="3" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 3, weekDates[5])%> <% if (!weekDates[5].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="5" ></td>
                                                        <td><input type="checkbox" id="sun3" name="slot_3" value ="7" data-slot="3" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 3, weekDates[6])%> <% if (!weekDates[6].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="6" ></td>
                                                    </tr>


                                                    <tr>
                                                        <td>Slot 4 (16h --> 18h)</td>
                                                        <td><input type="checkbox" id="mon4" name="slot_4" value ="1" data-slot="4" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 4, weekDates[0])%> <% if (!weekDates[0].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%>  data-day-index="0" ></td>
                                                        <td><input type="checkbox" id="tue4" name="slot_4" value ="2" data-slot="4" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 4, weekDates[1])%> <% if (!weekDates[1].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="1" ></td>
                                                        <td><input type="checkbox" id="wed4" name="slot_4" value ="3" data-slot="4" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 4, weekDates[2])%> <% if (!weekDates[2].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="2" ></td>
                                                        <td><input type="checkbox" id="thu4" name="slot_4" value ="4" data-slot="4" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 4, weekDates[3])%> <% if (!weekDates[3].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="3" ></td>
                                                        <td><input type="checkbox" id="fri4" name="slot_4" value ="5" data-slot="4" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 4, weekDates[4])%> <% if (!weekDates[4].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="4" ></td>
                                                        <td><input type="checkbox" id="sat4" name="slot_4" value ="6" data-slot="4" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 4, weekDates[5])%> <% if (!weekDates[5].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="5" ></td>
                                                        <td><input type="checkbox" id="sun4" name="slot_4" value ="7" data-slot="4" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 4, weekDates[6])%> <% if (!weekDates[6].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="6" ></td>
                                                    </tr>

                                                    <tr>
                                                        <td>Slot 5 (19h --> 21h)</td>
                                                        <td><input type="checkbox" id="mon5" name="slot_5" value="1" data-slot="5" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 5, weekDates[0])%> <% if (!weekDates[0].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="0" ></td>
                                                        <td><input type="checkbox" id="tue5" name="slot_5" value="2" data-slot="5" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 5, weekDates[1])%> <% if (!weekDates[1].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%>  data-day-index="1" ></td>
                                                        <td><input type="checkbox" id="wed5" name="slot_5" value ="3" data-slot="5" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 5, weekDates[2])%> <% if (!weekDates[2].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="2" ></td>
                                                        <td><input type="checkbox" id="thu5" name="slot_5" value ="4" data-slot="5" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 5, weekDates[3])%> <% if (!weekDates[3].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="3" ></td>
                                                        <td><input type="checkbox" id="fri5" name="slot_5" value ="5" data-slot="5" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 5, weekDates[4])%> <% if (!weekDates[4].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="4" ></td>
                                                        <td><input type="checkbox" id="sat5" name="slot_5" value ="6" data-slot="5" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 5, weekDates[5])%> <% if (!weekDates[5].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="5" ></td>
                                                        <td><input type="checkbox" id="sun5" name="slot_5" value ="7" data-slot="5" <%= ScheduleHelper.isCheckedSlotByDateDisable(slots, 5, weekDates[6])%> <% if (!weekDates[6].substring(5, 7).equals(String.format("%02d", currentMonth))) { %> disabled <% }%> data-day-index="6" ></td>
                                                    </tr>
                                                    <!--                                                    <tr>
                                                                                                            <td>Slot 6</td>
                                                                                                            <td><input type="checkbox" id="mon6"></td>
                                                                                                            <td><input type="checkbox" id="tue6"></td>
                                                                                                            <td><input type="checkbox" id="wed6"></td>
                                                                                                            <td><input type="checkbox" id="thu6"></td>
                                                                                                            <td><input type="checkbox" id="fri6"></td>
                                                                                                            <td><input type="checkbox" id="sat6"></td>
                                                                                                            <td><input type="checkbox" id="sun6"></td>
                                                                                                        </tr>-->
                                                    </tbody>

                                                </table>

                                                <div class="row mt-3">
                                                    <div class="col-12 col-md-9 ">
                                                        <button type="submit" class="btn btn-primary">Repeat Schedule</button>
                                                        <button type="submit" class="btn btn-primary">Save</button>
                                                        <button type="submit" class="btn btn-primary ">Submit</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>




                                </div>

                            </div>

                        </div>

                        <% }%>

                    </div>

                </div>
            </div>
            <footer class="footer">

                <div class="footer-top">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-3 col-md-6">

                                <div class="footer-widget footer-about">
                                    <div class="footer-logo">
                                        <img src="assets/img/logo.png" alt="logo">
                                    </div>
                                    <div class="footer-about-content">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                        <div class="social-icon">
                                            <ul>
                                                <li>
                                                    <a href="#" target="_blank"><i class="fab fa-facebook-f"></i> </a>
                                                </li>
                                                <li>
                                                    <a href="#" target="_blank"><i class="fab fa-twitter"></i> </a>
                                                </li>
                                                <li>
                                                    <a href="#" target="_blank"><i class="fab fa-linkedin-in"></i></a>
                                                </li>
                                                <li>
                                                    <a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
                                                </li>
                                                <li>
                                                    <a href="#" target="_blank"><i class="fab fa-dribbble"></i> </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="col-lg-3 col-md-6">

                                <div class="footer-widget footer-menu">
                                    <h2 class="footer-title">For Mentee</h2>
                                    <ul>
                                        <li><a href="search.html">Search Mentors</a></li>
                                        <li><a href="login.html">Login</a></li>
                                        <li><a href="register.html">Register</a></li>
                                        <li><a href="booking.html">Booking</a></li>
                                        <li><a href="dashboard-mentee.html">Mentee Dashboard</a></li>
                                    </ul>
                                </div>

                            </div>
                            <div class="col-lg-3 col-md-6">

                                <div class="footer-widget footer-menu">
                                    <h2 class="footer-title">For Mentors</h2>
                                    <ul>
                                        <li><a href="appointments.html">Appointments</a></li>
                                        <li><a href="chat.html">Chat</a></li>
                                        <li><a href="login.html">Login</a></li>
                                        <li><a href="register.html">Register</a></li>
                                        <li><a href="dashboard.html">Mentor Dashboard</a></li>
                                    </ul>
                                </div>

                            </div>
                            <div class="col-lg-3 col-md-6">

                                <div class="footer-widget footer-contact">
                                    <h2 class="footer-title">Contact Us</h2>
                                    <div class="footer-contact-info">
                                        <div class="footer-address">
                                            <span><i class="fas fa-map-marker-alt"></i></span>
                                            <p> 3556 Beech Street, San Francisco,<br> California, CA 94108 </p>
                                        </div>
                                        <p>
                                            <i class="fas fa-phone-alt"></i>
                                            +1 315 369 5943
                                        </p>
                                        <p class="mb-0">
                                            <i class="fas fa-envelope"></i>
                                            <a href="https://mentoring.dreamguystech.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="08656d667c677a61666f486d70696578646d266b6765">[email&#160;protected]</a>
                                        </p>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>


                <div class="footer-bottom">
                    <div class="container-fluid">

                        <div class="copyright">
                            <div class="row">
                                <div class="col-12 text-center">
                                    <div class="copyright-text">
                                        <p class="mb-0">&copy; 2020 Mentoring. All rights reserved.</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </footer>                
        </div>


        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <script src="assets/js/script.js"></script>
        <script src="assets/js/date-change.js"></script>
        <script>
                                                        function saveDraft() {
                                                            alert("Your request has been saved.");
                                                        }
                                                        function submitOrder() {
                                                            alert("Your request has been sent.");
                                                        }
                                                        document.getElementById('yearForm').addEventListener('change', function () {
                                                            document.getElementById('updateYear').submit();
                                                        });

                                                        document.getElementById("weekSelect").onchange = function () {
                                                            document.getElementById("updateWeek").submit(); // Submit form khi onchange dropdown
                                                        };



        </script>

    </body>
</html>

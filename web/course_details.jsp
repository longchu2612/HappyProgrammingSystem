<%-- 
    Document   : booking
    Created on : Jun 25, 2024, 7:22:44 PM
    Author     : catmi
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="helper.ScheduleHelper" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Slot" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.temporal.WeekFields" %>
<%@ page import="java.time.DayOfWeek" %>
<%@ page import="java.time.temporal.ChronoUnit" %>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/booking.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:33:02 GMT -->

    <head>
        <meta charset="utf-8">
        <title>Mentoring</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/plugins/daterangepicker/daterangepicker.css">

        <link rel="stylesheet" href="assets/css/style.css">
    </head>

    <body>

        <div class="main-wrapper">
            <jsp:include page="layout_header.jsp"/>
            <div class="breadcrumb-bar">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-12 col-12">
                            <nav aria-label="breadcrumb" class="page-breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="home">Home</a></li>
                                    <li class="breadcrumb-item"><a href="Booking?service=all_skill">Back to courses</a></li>
                                </ol>
                            </nav>
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
                        <div class="col-md-7 col-lg-8 col-xl-9">
                            <div class="card col-12">
                                <div class="card-body">
                                    <h2>Mentor Information:</h2>
                                    <div class="booking-user-info">
                                        <a href="#" class="booking-user-img">
                                            <img src="${requestScope.mentor.avatar}" alt="User Image">
                                        </a>
                                        <div class="booking-info">
                                            <h4><a href="#">${requestScope.mentor.fullname}</a></h4>
                                            <div class="rating">
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star-half-alt filled"></i>
                                                <i class="fas fa-star"></i>
                                                <span class="d-inline-block average-rating">35</span>
                                            </div>
                                            <p class="text-muted mb-0"><Strong>Profession:</Strong> ${requestScope.mentor_cv.job}</p>
                                            <p class="text-muted mb-0"><Strong>Date of birth:</Strong> ${requestScope.mentor.dateOfBirth}</p>
                                            <p class="text-muted mb-0"><Strong>Phone:</Strong> ${requestScope.phone}</p>
                                            <p class="text-muted mb-0"><Strong>Email address:</Strong> ${requestScope.mentor.email}</p>
                                            <p class="text-muted mb-0"><i class="fas fa-map-marker-alt"></i> ${requestScope.mentor.address}</p>
                                            <p class="text-muted mb-0"><i class="far fa-money-bill-alt"></i> ${requestScope.mentor_cv.rate}/hours</p>
                                            <div class="d-flex">
                                                <p class="text-muted mb-0"><Strong>Skills: </Strong>
                                                        <c:forEach items="${listS}" var="s">
                                                            ${s.skillName},
                                                    </c:forEach>
                                                </p>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card col-12">
                                <div class="card-body">
                                    <div class="booking-user-info">
                                        <div class="booking-info">
                                            <div>
                                                <Strong><i class=""></i>Introduction:</Strong>
                                                <p class="mb-0"> ${requestScope.mentor_cv.introduction}</p>
                                            </div>
                                            <div>
                                                <Strong>Achievements:</Strong>
                                                <p class="mb-0"> ${requestScope.mentor_cv.achievements}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <c:choose>
                                <c:when test="${requestScope.check == false}">
                                    <p style="color: red; font-weight: bold;">This mentor does not have a class schedule yet.</p>
                                </c:when>
                                <c:otherwise>
                                    <div class="card col-12">
                                        <div class="card-body">
                                            <div class="row form-row">
                                                <div class="col-12 col-md-12">
                                                    <div class="form-group">
                                                        <h4>Schedule</h4>
                                                    </div>
                                                    <h4 style="color: red; align-content: center;">
                                                        ${requestScope.message}
                                                    </h4>
                                                </div>
                                                <div class="row">   


                                                    <div class="col-12 col-md-2 mb-3"> 
                                                        <label>Year:</label>
                                                        <form id="updateYear" action="book_schedule" method="Post">

                                                            <input type="hidden" name="action" value="update_year"/>
                                                            <input type="hidden" name="month_form_updateyear" value="${requestScope.month}"/>
                                                            <input type="hidden" name="mentorId_form_updateyear" value="${requestScope.mentorId}"/>
                                                            <input type="hidden" name="phone_form_updateyear" value="${requestScope.phone}"/>

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
                                                        <form id="updateWeek" action="book_schedule" method="Post">
                                                            <input type="hidden"  name="action" value="update_week"/>
                                                            <input type="hidden"  name="month_form_updateweek" value="${requestScope.month}"/>
                                                            <input type="hidden"  name="schedule_id" value="${requestScope.scheduleId}"/>
                                                            <input type="hidden" name="value_year" value="${requestScope.currentYear}"/>
                                                            <input type="hidden" name="mentorId_form_updateweek" value="${requestScope.mentorId}"/>
                                                            <input type="hidden" name="phone_form_updateweek" value="${requestScope.phone}"/>


                                                            <select id="weekSelect" name="selectedWeek" class="form-select" onchange="submitForm()">
                                                                <%
                                                                    List<String> weeks = (List<String>) request.getAttribute("weeks");
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
                                                <form action="#" method="Post">

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

                                                                <%
                                                                    List<Slot> slots = (List<Slot>) request.getAttribute("slots");
                                                                %>
                                                                <%
                                                                    int currentMonth = Integer.parseInt(String.valueOf(request.getAttribute("month")));
                                                                %>



                                                                <tr>
                                                                    <td>Slot 1 (7h30 --> 9h30)</td>
                                                                    <td><input type="checkbox" id="mon1" name="slot_1" value="1" data-slot="1" data-day-index="0" <%= ScheduleHelper.isCheckedSlotByDate(slots, 1, weekDates[0])%>  disabled></td>
                                                                    <td><input type="checkbox" id="tue1" name="slot_1" value="2" data-slot="1" data-day-index="1" <%= ScheduleHelper.isCheckedSlotByDate(slots, 1, weekDates[1])%> disabled></td>
                                                                    <td><input type="checkbox" id="wed1" name="slot_1" value="3" data-slot="1" data-day-index="2" <%= ScheduleHelper.isCheckedSlotByDate(slots, 1, weekDates[2])%> disabled></td>
                                                                    <td><input type="checkbox" id="thu1" name="slot_1" value="4" data-slot="1" data-day-index="3" <%= ScheduleHelper.isCheckedSlotByDate(slots, 1, weekDates[3])%> disabled></td>
                                                                    <td><input type="checkbox" id="fri1" name="slot_1" value="5" data-slot="1" data-day-index="4" <%= ScheduleHelper.isCheckedSlotByDate(slots, 1, weekDates[4])%> disabled></td>
                                                                    <td><input type="checkbox" id="sat1" name="slot_1" value="6" data-slot="1" data-day-index="5" <%= ScheduleHelper.isCheckedSlotByDate(slots, 1, weekDates[5])%> disabled></td>
                                                                    <td><input type="checkbox" id="sun1" name="slot_1" value="7" data-slot="1" data-day-index="6" <%= ScheduleHelper.isCheckedSlotByDate(slots, 1, weekDates[6])%> disabled></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Slot 2 (9h45 --> 11h45)</td>
                                                                    <td><input type="checkbox" id="mon2" name="slot_2" value ="1" data-slot="2" data-day-index="0" <%= ScheduleHelper.isCheckedSlotByDate(slots, 2, weekDates[0])%> disabled></td>
                                                                    <td><input type="checkbox" id="tue2" name="slot_2" value ="2"  data-slot="2" data-day-index="1" <%= ScheduleHelper.isCheckedSlotByDate(slots, 2, weekDates[1])%> disabled></td>
                                                                    <td><input type="checkbox" id="wed2" name="slot_2" value ="3" data-slot="2" data-day-index="2" <%= ScheduleHelper.isCheckedSlotByDate(slots, 2, weekDates[2])%> disabled></td>
                                                                    <td><input type="checkbox" id="thu2" name="slot_2" value ="4" data-slot="2" data-day-index="3" <%= ScheduleHelper.isCheckedSlotByDate(slots, 2, weekDates[3])%> disabled></td>
                                                                    <td><input type="checkbox" id="fri2" name="slot_2" value ="5"  data-slot="2" data-day-index="4" <%= ScheduleHelper.isCheckedSlotByDate(slots, 2, weekDates[4])%> disabled></td>
                                                                    <td><input type="checkbox" id="sat2" name="slot_2" value ="6" data-slot="2" data-day-index="5" <%= ScheduleHelper.isCheckedSlotByDate(slots, 2, weekDates[5])%> disabled></td>
                                                                    <td><input type="checkbox" id="sun2" name="slot_2" value ="7" data-slot="2" data-day-index="6" <%= ScheduleHelper.isCheckedSlotByDate(slots, 2, weekDates[6])%> disabled></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Slot 3 (13h30 --> 15h30)</td>
                                                                    <td><input type="checkbox" id="mon3" name="slot_3" value ="1" data-slot="3" data-day-index="0" <%= ScheduleHelper.isCheckedSlotByDate(slots, 3, weekDates[0])%> disabled></td>
                                                                    <td><input type="checkbox" id="tue3" name="slot_3" value ="2" data-slot="3" data-day-index="1" <%= ScheduleHelper.isCheckedSlotByDate(slots, 3, weekDates[1])%> disabled></td>
                                                                    <td><input type="checkbox" id="wed3" name="slot_3" value ="3" data-slot="3" data-day-index="2" <%= ScheduleHelper.isCheckedSlotByDate(slots, 3, weekDates[2])%> disabled></td>
                                                                    <td><input type="checkbox" id="thu3" name="slot_3" value ="4" data-slot="3" data-day-index="3" <%= ScheduleHelper.isCheckedSlotByDate(slots, 3, weekDates[3])%> disabled></td>
                                                                    <td><input type="checkbox" id="fri3" name="slot_3" value ="5" data-slot="3" data-day-index="4" <%= ScheduleHelper.isCheckedSlotByDate(slots, 3, weekDates[4])%> disabled></td>
                                                                    <td><input type="checkbox" id="sat3" name="slot_3" value ="6" data-slot="3" data-day-index="5" <%= ScheduleHelper.isCheckedSlotByDate(slots, 3, weekDates[5])%> disabled></td>
                                                                    <td><input type="checkbox" id="sun3" name="slot_3" value ="7" data-slot="3" data-day-index="6" <%= ScheduleHelper.isCheckedSlotByDate(slots, 3, weekDates[6])%> disabled></td>
                                                                </tr>


                                                                <tr>
                                                                    <td>Slot 4 (16h --> 18h)</td>
                                                                    <td><input type="checkbox" id="mon4" name="slot_4" value ="1" data-slot="4" data-day-index="0" <%= ScheduleHelper.isCheckedSlotByDate(slots, 4, weekDates[0])%> disabled></td>
                                                                    <td><input type="checkbox" id="tue4" name="slot_4" value ="2" data-slot="4" data-day-index="1" <%= ScheduleHelper.isCheckedSlotByDate(slots, 4, weekDates[1])%> disabled></td>
                                                                    <td><input type="checkbox" id="wed4" name="slot_4" value ="3" data-slot="4" data-day-index="2" <%= ScheduleHelper.isCheckedSlotByDate(slots, 4, weekDates[2])%> disabled></td>
                                                                    <td><input type="checkbox" id="thu4" name="slot_4" value ="4" data-slot="4" data-day-index="3" <%= ScheduleHelper.isCheckedSlotByDate(slots, 4, weekDates[3])%> disabled></td>
                                                                    <td><input type="checkbox" id="fri4" name="slot_4" value ="5" data-slot="4" data-day-index="4" <%= ScheduleHelper.isCheckedSlotByDate(slots, 4, weekDates[4])%> disabled></td>
                                                                    <td><input type="checkbox" id="sat4" name="slot_4" value ="6" data-slot="4" data-day-index="5" <%= ScheduleHelper.isCheckedSlotByDate(slots, 4, weekDates[5])%> disabled></td>
                                                                    <td><input type="checkbox" id="sun4" name="slot_4" value ="7" data-slot="4" data-day-index="6" <%= ScheduleHelper.isCheckedSlotByDate(slots, 4, weekDates[6])%> disabled></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Slot 5 (19h --> 21h)</td>
                                                                    <td><input type="checkbox" id="mon5" name="slot_5" value="1" data-slot="5" data-day-index="0" <%= ScheduleHelper.isCheckedSlotByDate(slots, 5, weekDates[0])%> disabled></td>
                                                                    <td><input type="checkbox" id="tue5" name="slot_5" value="2" data-slot="5" data-day-index="1" <%= ScheduleHelper.isCheckedSlotByDate(slots, 5, weekDates[1])%> disabled></td>
                                                                    <td><input type="checkbox" id="wed5" name="slot_5" value ="3" data-slot="5" data-day-index="2" <%= ScheduleHelper.isCheckedSlotByDate(slots, 5, weekDates[2])%> disabled></td>
                                                                    <td><input type="checkbox" id="thu5" name="slot_5" value ="4" data-slot="5" data-day-index="3" <%= ScheduleHelper.isCheckedSlotByDate(slots, 5, weekDates[3])%> disabled></td>
                                                                    <td><input type="checkbox" id="fri5" name="slot_5" value ="5" data-slot="5" data-day-index="4" <%= ScheduleHelper.isCheckedSlotByDate(slots, 5, weekDates[4])%> disabled></td>
                                                                    <td><input type="checkbox" id="sat5" name="slot_5" value ="6" data-slot="5" data-day-index="5" <%= ScheduleHelper.isCheckedSlotByDate(slots, 5, weekDates[5])%> disabled></td>
                                                                    <td><input type="checkbox" id="sun5" name="slot_5" value ="7" data-slot="5" data-day-index="6" <%= ScheduleHelper.isCheckedSlotByDate(slots, 5, weekDates[6])%> disabled></td>
                                                                </tr>
                                                            </tbody>

                                                        </table>


                                                    </div>
                                                </form>
                                                <div class="submit-section col-md-2 mb-3 mt-3">                          
                                                    <form action="request?service=create_request" method="post">
                                                        <input type="hidden" name="mentorId" value="${requestScope.mentor_cv.accountID}">
                                                        <input type="hidden" name="cvId" value="${requestScope.mentor_cv.id}">
                                                        <button type="submit" class="btn btn-primary">Create request</button>

                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">   


                                            <div class="col-12 col-md-2 mb-3"> 
                                                <label>Year:</label>
                                                <form id="updateYear" action="book_schedule" method="Post">

                                                    <input type="hidden" name="action" value="update_year"/>
                                                    <input type="hidden" name="month_form_updateyear" value="${requestScope.month}"/>
                                                    <input type="hidden" name="mentorId_form_updateyear" value="${requestScope.mentorId}"/>
                                                    <input type="hidden" name="phone_form_updateyear" value="${requestScope.phone}"/>

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
                                                <form id="updateWeek" action="book_schedule" method="Post">
                                                    <input type="hidden"  name="action" value="update_week"/>
                                                    <input type="hidden"  name="month_form_updateweek" value="${requestScope.month}"/>
                                                    <input type="hidden"  name="schedule_id" value="${requestScope.scheduleId}"/>
                                                    <input type="hidden" name="value_year" value="${requestScope.currentYear}"/>
                                                    <input type="hidden" name="mentorId_form_updateweek" value="${requestScope.mentorId}"/>
                                                    <input type="hidden" name="phone_form_updateweek" value="${requestScope.phone}"/>


                                                    <select id="weekSelect" name="selectedWeek" class="form-select" onchange="submitForm()">
                                                        <%
                                                            List<String> weeks = (List<String>) request.getAttribute("weeks");
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
                                        <form action="#" method="Post">

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

                                                        <%
                                                            List<Slot> slots = (List<Slot>) request.getAttribute("slots");
                                                        %>
                                                        <%
                                                            int currentMonth = Integer.parseInt(String.valueOf(request.getAttribute("month")));
                                                        %>
                                                        <tr>
                                                            <td>Slot 1 (7h30 --> 9h30)</td>
                                                            <td><input type="checkbox" id="mon1" name="slot_1" value="1" data-slot="1" data-day-index="0" <%= ScheduleHelper.isCheckedSlotByDate(slots, 1, weekDates[0])%>  disabled></td>
                                                            <td><input type="checkbox" id="tue1" name="slot_1" value="2" data-slot="1" data-day-index="1" <%= ScheduleHelper.isCheckedSlotByDate(slots, 1, weekDates[1])%> disabled></td>
                                                            <td><input type="checkbox" id="wed1" name="slot_1" value="3" data-slot="1" data-day-index="2" <%= ScheduleHelper.isCheckedSlotByDate(slots, 1, weekDates[2])%> disabled></td>
                                                            <td><input type="checkbox" id="thu1" name="slot_1" value="4" data-slot="1" data-day-index="3" <%= ScheduleHelper.isCheckedSlotByDate(slots, 1, weekDates[3])%> disabled></td>
                                                            <td><input type="checkbox" id="fri1" name="slot_1" value="5" data-slot="1" data-day-index="4" <%= ScheduleHelper.isCheckedSlotByDate(slots, 1, weekDates[4])%> disabled></td>
                                                            <td><input type="checkbox" id="sat1" name="slot_1" value="6" data-slot="1" data-day-index="5" <%= ScheduleHelper.isCheckedSlotByDate(slots, 1, weekDates[5])%> disabled></td>
                                                            <td><input type="checkbox" id="sun1" name="slot_1" value="7" data-slot="1" data-day-index="6" <%= ScheduleHelper.isCheckedSlotByDate(slots, 1, weekDates[6])%> disabled></td>
                                                        </tr>

                                                        <tr>
                                                            <td>Slot 2 (9h45 --> 11h45)</td>
                                                            <td><input type="checkbox" id="mon2" name="slot_2" value ="1" data-slot="2" data-day-index="0" <%= ScheduleHelper.isCheckedSlotByDate(slots, 2, weekDates[0])%> disabled></td>
                                                            <td><input type="checkbox" id="tue2" name="slot_2" value ="2"  data-slot="2" data-day-index="1" <%= ScheduleHelper.isCheckedSlotByDate(slots, 2, weekDates[1])%> disabled></td>
                                                            <td><input type="checkbox" id="wed2" name="slot_2" value ="3" data-slot="2" data-day-index="2" <%= ScheduleHelper.isCheckedSlotByDate(slots, 2, weekDates[2])%> disabled></td>
                                                            <td><input type="checkbox" id="thu2" name="slot_2" value ="4" data-slot="2" data-day-index="3" <%= ScheduleHelper.isCheckedSlotByDate(slots, 2, weekDates[3])%> disabled></td>
                                                            <td><input type="checkbox" id="fri2" name="slot_2" value ="5"  data-slot="2" data-day-index="4" <%= ScheduleHelper.isCheckedSlotByDate(slots, 2, weekDates[4])%> disabled></td>
                                                            <td><input type="checkbox" id="sat2" name="slot_2" value ="6" data-slot="2" data-day-index="5" <%= ScheduleHelper.isCheckedSlotByDate(slots, 2, weekDates[5])%> disabled></td>
                                                            <td><input type="checkbox" id="sun2" name="slot_2" value ="7" data-slot="2" data-day-index="6" <%= ScheduleHelper.isCheckedSlotByDate(slots, 2, weekDates[6])%> disabled></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Slot 3 (13h30 --> 15h30)</td>
                                                            <td><input type="checkbox" id="mon3" name="slot_3" value ="1" data-slot="3" data-day-index="0" <%= ScheduleHelper.isCheckedSlotByDate(slots, 3, weekDates[0])%> disabled></td>
                                                            <td><input type="checkbox" id="tue3" name="slot_3" value ="2" data-slot="3" data-day-index="1" <%= ScheduleHelper.isCheckedSlotByDate(slots, 3, weekDates[1])%> disabled></td>
                                                            <td><input type="checkbox" id="wed3" name="slot_3" value ="3" data-slot="3" data-day-index="2" <%= ScheduleHelper.isCheckedSlotByDate(slots, 3, weekDates[2])%> disabled></td>
                                                            <td><input type="checkbox" id="thu3" name="slot_3" value ="4" data-slot="3" data-day-index="3" <%= ScheduleHelper.isCheckedSlotByDate(slots, 3, weekDates[3])%> disabled></td>
                                                            <td><input type="checkbox" id="fri3" name="slot_3" value ="5" data-slot="3" data-day-index="4" <%= ScheduleHelper.isCheckedSlotByDate(slots, 3, weekDates[4])%> disabled></td>
                                                            <td><input type="checkbox" id="sat3" name="slot_3" value ="6" data-slot="3" data-day-index="5" <%= ScheduleHelper.isCheckedSlotByDate(slots, 3, weekDates[5])%> disabled></td>
                                                            <td><input type="checkbox" id="sun3" name="slot_3" value ="7" data-slot="3" data-day-index="6" <%= ScheduleHelper.isCheckedSlotByDate(slots, 3, weekDates[6])%> disabled></td>
                                                        </tr>


                                                        <tr>
                                                            <td>Slot 4 (16h --> 18h)</td>
                                                            <td><input type="checkbox" id="mon4" name="slot_4" value ="1" data-slot="4" data-day-index="0" <%= ScheduleHelper.isCheckedSlotByDate(slots, 4, weekDates[0])%> disabled></td>
                                                            <td><input type="checkbox" id="tue4" name="slot_4" value ="2" data-slot="4" data-day-index="1" <%= ScheduleHelper.isCheckedSlotByDate(slots, 4, weekDates[1])%> disabled></td>
                                                            <td><input type="checkbox" id="wed4" name="slot_4" value ="3" data-slot="4" data-day-index="2" <%= ScheduleHelper.isCheckedSlotByDate(slots, 4, weekDates[2])%> disabled></td>
                                                            <td><input type="checkbox" id="thu4" name="slot_4" value ="4" data-slot="4" data-day-index="3" <%= ScheduleHelper.isCheckedSlotByDate(slots, 4, weekDates[3])%> disabled></td>
                                                            <td><input type="checkbox" id="fri4" name="slot_4" value ="5" data-slot="4" data-day-index="4" <%= ScheduleHelper.isCheckedSlotByDate(slots, 4, weekDates[4])%> disabled></td>
                                                            <td><input type="checkbox" id="sat4" name="slot_4" value ="6" data-slot="4" data-day-index="5" <%= ScheduleHelper.isCheckedSlotByDate(slots, 4, weekDates[5])%> disabled></td>
                                                            <td><input type="checkbox" id="sun4" name="slot_4" value ="7" data-slot="4" data-day-index="6" <%= ScheduleHelper.isCheckedSlotByDate(slots, 4, weekDates[6])%> disabled></td>
                                                        </tr>

                                                        <tr>
                                                            <td>Slot 5 (19h --> 21h)</td>
                                                            <td><input type="checkbox" id="mon5" name="slot_5" value="1" data-slot="5" data-day-index="0" <%= ScheduleHelper.isCheckedSlotByDate(slots, 5, weekDates[0])%> disabled></td>
                                                            <td><input type="checkbox" id="tue5" name="slot_5" value="2" data-slot="5" data-day-index="1" <%= ScheduleHelper.isCheckedSlotByDate(slots, 5, weekDates[1])%> disabled></td>
                                                            <td><input type="checkbox" id="wed5" name="slot_5" value ="3" data-slot="5" data-day-index="2" <%= ScheduleHelper.isCheckedSlotByDate(slots, 5, weekDates[2])%> disabled></td>
                                                            <td><input type="checkbox" id="thu5" name="slot_5" value ="4" data-slot="5" data-day-index="3" <%= ScheduleHelper.isCheckedSlotByDate(slots, 5, weekDates[3])%> disabled></td>
                                                            <td><input type="checkbox" id="fri5" name="slot_5" value ="5" data-slot="5" data-day-index="4" <%= ScheduleHelper.isCheckedSlotByDate(slots, 5, weekDates[4])%> disabled></td>
                                                            <td><input type="checkbox" id="sat5" name="slot_5" value ="6" data-slot="5" data-day-index="5" <%= ScheduleHelper.isCheckedSlotByDate(slots, 5, weekDates[5])%> disabled></td>
                                                            <td><input type="checkbox" id="sun5" name="slot_5" value ="7" data-slot="5" data-day-index="6" <%= ScheduleHelper.isCheckedSlotByDate(slots, 5, weekDates[6])%> disabled></td>
                                                        </tr>
                                                    </tbody>

                                                </table>


                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="submit-section col-md-2 mb-3">                          

                                <input type="hidden" name="mentorId" value="${requestScope.mentor_cv.accountID}">
                                <input type="hidden" name="cvId" value="${requestScope.mentor_cv.id}">
                                <a class="btn btn-primary" href="request?mentorId=${requestScope.mentor_cv.accountID}&cvId=${requestScope.mentor_cv.id}">Create request</a>

                            </div>  
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>


<jsp:include page="footer.jsp"></jsp:include>

</div>


<script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script src="assets/js/jquery-3.6.0.min.js"></script>

<script src="assets/js/bootstrap.bundle.min.js"></script>

<script src="assets/js/moment.min.js"></script>
<script src="assets/plugins/daterangepicker/daterangepicker.js"></script>

<script src="assets/js/script.js"></script>

<script>

                                                document.getElementById('yearForm').addEventListener('change', function () {
                                                    document.getElementById('updateYear').submit();
                                                });

                                                document.getElementById("weekSelect").onchange = function () {
                                                    document.getElementById("updateWeek").submit(); // Submit form khi onchange dropdown
                                                };
</script>
</body>

<!-- Mirrored from mentoring.dreamguystech.com/html/template/booking.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:33:04 GMT -->

</html>

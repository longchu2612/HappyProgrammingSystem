<%-- 
    Document   : update-schedule
    Created on : Jun 15, 2024, 7:23:58 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ page import="helper.ScheduleHelper" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.List" %>
<%@page import="model.Slot" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.temporal.WeekFields" %>
<%@ page import="java.time.DayOfWeek" %>
<%@ page import="java.time.temporal.ChronoUnit" %>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/admin/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:31 GMT -->
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Mentoring - Dashboard</title>

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <link rel="stylesheet" href="assets/css/feathericon.min.css">

        <link rel="stylesheet" href="assets/plugins/morris/morris.css">

        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body>

        <div class="main-wrapper">

            <div class="header">

                <div class="header-left">
                    <a href="index.html" class="logo">
                        <img src="assets/img/logo.png" alt="Logo">
                    </a>
                    <a href="index.html" class="logo logo-small">
                        <img src="assets/img/logo-small.png" alt="Logo" width="30" height="30">
                    </a>
                </div>

                <a href="javascript:void(0);" id="toggle_btn">
                    <i class="fe fe-text-align-left"></i>
                </a>
                <div class="top-nav-search">
                    <form>
                        <input type="text" class="form-control" placeholder="Search here">
                        <button class="btn" type="submit"><i class="fa fa-search"></i></button>
                    </form>
                </div>

                <a class="mobile_btn" id="mobile_btn">
                    <i class="fa fa-bars"></i>
                </a>


                <ul class="nav user-menu">

                    <li class="nav-item dropdown noti-dropdown">
                        <a href="#" class="dropdown-toggle nav-link" data-bs-toggle="dropdown">
                            <i class="fe fe-bell"></i> <span class="badge badge-pill">3</span>
                        </a>
                        <div class="dropdown-menu notifications">
                            <div class="topnav-dropdown-header">
                                <span class="notification-title">Notifications</span>
                                <a href="javascript:void(0)" class="clear-noti"> Clear All </a>
                            </div>
                            <div class="noti-content">
                                <ul class="notification-list">
                                    <li class="notification-message">
                                        <a href="#">
                                            <div class="media d-flex">
                                                <span class="avatar avatar-sm flex-shrink-0">
                                                    <img class="avatar-img rounded-circle" alt="User Image" src="assets/img/user/user.jpg">
                                                </span>
                                                <div class="media-body flex-grow-1">
                                                    <p class="noti-details"><span class="noti-title">Jonathan Doe</span> Schedule <span class="noti-title">his appointment</span></p>
                                                    <p class="noti-time"><span class="notification-time">4 mins ago</span></p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="notification-message">
                                        <a href="#">
                                            <div class="media d-flex">
                                                <span class="avatar avatar-sm flex-shrink-0">
                                                    <img class="avatar-img rounded-circle" alt="User Image" src="assets/img/user/user1.jpg">
                                                </span>
                                                <div class="media-body flex-grow-1">
                                                    <p class="noti-details"><span class="noti-title">Julie Pennington</span> has booked her appointment to <span class="noti-title">Ruby Perrin</span></p>
                                                    <p class="noti-time"><span class="notification-time">6 mins ago</span></p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="notification-message">
                                        <a href="#">
                                            <div class="media d-flex">
                                                <span class="avatar avatar-sm flex-shrink-0">
                                                    <img class="avatar-img rounded-circle" alt="User Image" src="assets/img/user/user2.jpg">
                                                </span>
                                                <div class="media-body flex-grow-1">
                                                    <p class="noti-details"><span class="noti-title">Tyrone Roberts</span> sent a amount of $210 for his <span class="noti-title">appointment</span></p>
                                                    <p class="noti-time"><span class="notification-time">8 mins ago</span></p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="notification-message">
                                        <a href="#">
                                            <div class="media d-flex">
                                                <span class="avatar avatar-sm flex-shrink-0">
                                                    <img class="avatar-img rounded-circle" alt="User Image" src="assets/img/user/user4.jpg">
                                                </span>
                                                <div class="media-body flex-grow-1">
                                                    <p class="noti-details"><span class="noti-title">Patricia Manzi</span> send a message <span class="noti-title"> to his Mentee</span></p>
                                                    <p class="noti-time"><span class="notification-time">12 mins ago</span></p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="topnav-dropdown-footer">
                                <a href="#">View all Notifications</a>
                            </div>
                        </div>
                    </li>


                    <li class="nav-item dropdown has-arrow">
                        <a href="#" class="dropdown-toggle nav-link" data-bs-toggle="dropdown">
                            <span class="user-img"><img class="rounded-circle" src="assets/img/profiles/avatar-12.jpg" width="31" alt="Ryan Taylor"></span>
                        </a>
                        <div class="dropdown-menu">
                            <div class="user-header">
                                <div class="avatar avatar-sm">
                                    <img src="assets/img/profiles/avatar-12.jpg" alt="User Image" class="avatar-img rounded-circle">
                                </div>
                                <div class="user-text">
                                    <h6>Allen Davis</h6>
                                    <p class="text-muted mb-0">Administrator</p>
                                </div>
                            </div>
                            <a class="dropdown-item" href="profile.html">My Profile</a>
                            <a class="dropdown-item" href="settings.html">Settings</a>
                            <a class="dropdown-item" href="login.html">Logout</a>
                        </div>
                    </li>

                </ul>

            </div>


            <jsp:include page="layout_sidebar.jsp"/>


            <div class="page-wrapper">
                <div class="content container-fluid">

                    <div class="page-header">
                        <div class="row">
                            <div class="col-sm-12">
                                <h3 class="page-title">Manage Schedule</h3>

                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">

                            <div class="card">

                                <div class="card-body">


                                    <div class="row form-row">
                                        <div class="col-12 col-md-12">
                                            <h4 style="color: red; align-content: center;">
                                                ${requestScope.message}
                                            </h4>
                                        </div>
                                        <div class="row">
                                            <div class="col-12 col-md-3 mb-3">
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
                                                <input type="hidden" name="account_id" value="${requestScope.accountId}"/>
                                                <input type="hidden" name="session_id" value="${requestScope.sessionId}"/>

                                                <input type="hidden" name="schedule_id" value="${requestScope.schedule_id}"/>
                                            </div>
                                            <div class="col-12 col-md-3 mb-3">
                                                <label>Week:</label>
                                                <form id="updateWeek" action="update_schedule" method="Post">
                                                    <input type="hidden"  name="action" value="update_week"/>
                                                    <input type="hidden" name="accountId_updateweek" value="${requestScope.accountId}"/>
                                                    <input type="hidden"  name="month_form_updateweek" value="${requestScope.month}"/>
                                                    <input type="hidden"  name="schedule_id" value="${requestScope.schedule_id}"/>
                                                    <input type="hidden" name="value_year" value="${requestScope.currentYear}"/>
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
                                        <form id="updateStatusSchedule" action="update_schedule" method="Post">
                                            <input type="hidden"  name="action" value="update_schedule"/>
                                            <input type="hidden" name="accountId_update_schedule" value="${requestScope.accountId}"/>
                                            <input type="hidden" name="schedule_id_update_schedule" value="${requestScope.schedule_id}"/>
                                            <input type="hidden" name="month_update_schedule" value="${requestScope.month}"/>
                                            <input type="hidden" name="isoWeek_update_schedule" value="${requestScope.isoWeek}"/>
                                            <div class="col-12 col-md-12">

                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th rowspan="2" > 
                                                                Year 2024
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

                                                        <tr>
                                                            <td>Slot 1 (7h30 --> 9h30)</td>
                                                            <td><input type="checkbox" id="mon1" name="slot_1" value="1" data-slot="1" data-day-index="0" <%= ScheduleHelper.isCheckedSlotByDate(slots, 1, weekDates[0])%> disabled  ></td>
                                                            <td><input type="checkbox" id="tue1" name="slot_1" value="2" data-slot="1" data-day-index="1" <%= ScheduleHelper.isCheckedSlotByDate(slots, 1, weekDates[1])%> disabled ></td>
                                                            <td><input type="checkbox" id="wed1" name="slot_1" value="3" data-slot="1" data-day-index="2" <%= ScheduleHelper.isCheckedSlotByDate(slots, 1, weekDates[2])%> disabled ></td>
                                                            <td><input type="checkbox" id="thu1" name="slot_1" value="4" data-slot="1" data-day-index="3" <%= ScheduleHelper.isCheckedSlotByDate(slots, 1, weekDates[3])%> disabled ></td>
                                                            <td><input type="checkbox" id="fri1" name="slot_1" value="5" data-slot="1" data-day-index="4" <%= ScheduleHelper.isCheckedSlotByDate(slots, 1, weekDates[4])%> disabled ></td>
                                                            <td><input type="checkbox" id="sat1" name="slot_1" value="6" data-slot="1" data-day-index="5" <%= ScheduleHelper.isCheckedSlotByDate(slots, 1, weekDates[5])%> disabled ></td>
                                                            <td><input type="checkbox" id="sun1" name="slot_1" value="7" data-slot="1" data-day-index="6" <%= ScheduleHelper.isCheckedSlotByDate(slots, 1, weekDates[6])%> disabled ></td>
                                                        </tr>


                                                        <tr>
                                                            <td>Slot 2 (9h45 --> 11h45)</td>
                                                            <td><input type="checkbox" id="mon2" name="slot_2" value ="1" data-slot="2" data-day-index="0" <%= ScheduleHelper.isCheckedSlotByDate(slots, 2, weekDates[0])%> disabled ></td>
                                                            <td><input type="checkbox" id="tue2" name="slot_2" value ="2"  data-slot="2" data-day-index="1" <%= ScheduleHelper.isCheckedSlotByDate(slots, 2, weekDates[1])%> disabled></td>
                                                            <td><input type="checkbox" id="wed2" name="slot_2" value ="3" data-slot="2" data-day-index="2" <%= ScheduleHelper.isCheckedSlotByDate(slots, 2, weekDates[2])%> disabled></td>
                                                            <td><input type="checkbox" id="thu2" name="slot_2" value ="4" data-slot="2" data-day-index="3" <%= ScheduleHelper.isCheckedSlotByDate(slots, 2, weekDates[3])%> disabled></td>
                                                            <td><input type="checkbox" id="fri2" name="slot_2" value ="5"  data-slot="2" data-day-index="4" <%= ScheduleHelper.isCheckedSlotByDate(slots, 2, weekDates[4])%> disabled></td>
                                                            <td><input type="checkbox" id="sat2" name="slot_2" value ="6" data-slot="2" data-day-index="5" <%= ScheduleHelper.isCheckedSlotByDate(slots, 2, weekDates[5])%> disabled></td>
                                                            <td><input type="checkbox" id="sun2" name="slot_2" value ="7" data-slot="2" data-day-index="6" <%= ScheduleHelper.isCheckedSlotByDate(slots, 2, weekDates[6])%> disabled></td>
                                                        </tr>


                                                        <tr>
                                                            <td>Slot 3 (13h30 --> 15h30)</td>
                                                            <td><input type="checkbox" id="mon3" name="slot_3" value ="1" data-slot="3" data-day-index="0" <%= ScheduleHelper.isCheckedSlotByDate(slots, 3, weekDates[0])%> disabled ></td>
                                                            <td><input type="checkbox" id="tue3" name="slot_3" value ="2" data-slot="3" data-day-index="1" <%= ScheduleHelper.isCheckedSlotByDate(slots, 3, weekDates[1])%> disabled></td>
                                                            <td><input type="checkbox" id="wed3" name="slot_3" value ="3" data-slot="3" data-day-index="2" <%= ScheduleHelper.isCheckedSlotByDate(slots, 3, weekDates[2])%> disabled></td>
                                                            <td><input type="checkbox" id="thu3" name="slot_3" value ="4" data-slot="3" data-day-index="3" <%= ScheduleHelper.isCheckedSlotByDate(slots, 3, weekDates[3])%> disabled></td>
                                                            <td><input type="checkbox" id="fri3" name="slot_3" value ="5" data-slot="3" data-day-index="4" <%= ScheduleHelper.isCheckedSlotByDate(slots, 3, weekDates[4])%> disabled></td>
                                                            <td><input type="checkbox" id="sat3" name="slot_3" value ="6" data-slot="3" data-day-index="5" <%= ScheduleHelper.isCheckedSlotByDate(slots, 3, weekDates[5])%> disabled></td>
                                                            <td><input type="checkbox" id="sun3" name="slot_3" value ="7" data-slot="3" data-day-index="6" <%= ScheduleHelper.isCheckedSlotByDate(slots, 3, weekDates[6])%> disabled></td>
                                                        </tr>


                                                        <tr>
                                                            <td>Slot 4 (16h --> 18h)</td>
                                                            <td><input type="checkbox" id="mon4" name="slot_4" value ="1" data-slot="4" data-day-index="0" <%= ScheduleHelper.isCheckedSlotByDate(slots, 4, weekDates[0])%> disabled ></td>
                                                            <td><input type="checkbox" id="tue4" name="slot_4" value ="2" data-slot="4" data-day-index="1" <%= ScheduleHelper.isCheckedSlotByDate(slots, 4, weekDates[1])%> disabled></td>
                                                            <td><input type="checkbox" id="wed4" name="slot_4" value ="3" data-slot="4" data-day-index="2" <%= ScheduleHelper.isCheckedSlotByDate(slots, 4, weekDates[2])%> disabled></td>
                                                            <td><input type="checkbox" id="thu4" name="slot_4" value ="4" data-slot="4" data-day-index="3" <%= ScheduleHelper.isCheckedSlotByDate(slots, 4, weekDates[3])%> disabled></td>
                                                            <td><input type="checkbox" id="fri4" name="slot_4" value ="5" data-slot="4" data-day-index="4" <%= ScheduleHelper.isCheckedSlotByDate(slots, 4, weekDates[4])%> disabled></td>
                                                            <td><input type="checkbox" id="sat4" name="slot_4" value ="6" data-slot="4" data-day-index="5" <%= ScheduleHelper.isCheckedSlotByDate(slots, 4, weekDates[5])%> disabled></td>
                                                            <td><input type="checkbox" id="sun4" name="slot_4" value ="7" data-slot="4" data-day-index="6" <%= ScheduleHelper.isCheckedSlotByDate(slots, 4, weekDates[6])%> disabled></td>
                                                        </tr>


                                                        <tr>
                                                            <td>Slot 5 (19h --> 21h)</td>
                                                            <td><input type="checkbox" id="mon5" name="slot_5" value="1" data-slot="5" data-day-index="0" <%= ScheduleHelper.isCheckedSlotByDate(slots, 5, weekDates[0])%> disabled ></td>
                                                            <td><input type="checkbox" id="tue5" name="slot_5" value="2" data-slot="5" data-day-index="1" <%= ScheduleHelper.isCheckedSlotByDate(slots, 5, weekDates[1])%> disabled></td>
                                                            <td><input type="checkbox" id="wed5" name="slot_5" value ="3" data-slot="5" data-day-index="2" <%= ScheduleHelper.isCheckedSlotByDate(slots, 5, weekDates[2])%> disabled></td>
                                                            <td><input type="checkbox" id="thu5" name="slot_5" value ="4" data-slot="5" data-day-index="3" <%= ScheduleHelper.isCheckedSlotByDate(slots, 5, weekDates[3])%> disabled></td>
                                                            <td><input type="checkbox" id="fri5" name="slot_5" value ="5" data-slot="5" data-day-index="4" <%= ScheduleHelper.isCheckedSlotByDate(slots, 5, weekDates[4])%> disabled></td>
                                                            <td><input type="checkbox" id="sat5" name="slot_5" value ="6" data-slot="5" data-day-index="5" <%= ScheduleHelper.isCheckedSlotByDate(slots, 5, weekDates[5])%> disabled></td>
                                                            <td><input type="checkbox" id="sun5" name="slot_5" value ="7" data-slot="5" data-day-index="6" <%= ScheduleHelper.isCheckedSlotByDate(slots, 5, weekDates[6])%> disabled></td>
                                                        </tr>

                                                    </tbody>

                                                </table>
                                                <div class="col-12 col-md-6 mt-3">
                                                    <div class="form-group">
                                                        <label for="note">Note</label>
                                                        <textarea class="form-control" id="note" name="note" rows="3" placeholder="Enter your note here...">${requestScope.note}</textarea>
                                                        <div class="invalid-feedback">
                                                            Please enter a note for this schedule.
                                                        </div>
                                                    </div>
                                                </div>  
                                                <div class="col-12 col-md-6 mt-4">   
                                                    <div class="row">

                                                        <div class="submit-section col-md-4">

                                                            <c:choose>
                                                                <c:when test="${requestScope.status == 1}">
                                                                    <button type="submit" name="button_action" value="accept" class="btn btn-outline-success">Accept</button>
                                                                    <button type="submit" name="button_action" value="reject" class="btn btn-outline-danger">Reject</button>
                                                                </c:when>
                                                                <c:when test="${requestScope.status == 2}">
                                                                    <button type="submit" name="button_action" value="reject" class="btn btn-outline-danger">Reject</button>
                                                                </c:when>
                                                                <c:when test="${requestScope.status == 3}">
                                                                    <button type="submit" name="button_action" value="accept" class="btn btn-outline-success">Accept</button>
                                                                </c:when>
                                                            </c:choose>
                                                        </div>

                                                    </div>
                                                </div> 
                                            </div>
                                        </form>            
                                    </div>



                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!--        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                 Modal body content 
                                This is the modal body content.
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>-->


        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/feather.min.js"></script>

        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

        <script src="assets/plugins/raphael/raphael.min.js"></script>

        <script src="assets/plugins/morris/morris.min.js"></script>

        <script src="assets/js/chart.morris.js"></script>

        <script src="assets/js/script.js"></script>
        <script>
                                                        document.getElementById('updateStatusSchedule').addEventListener('submit', function (event) {

                                                            var isValid = true;

                                                            var scheduleNote = document.getElementById('note');
                                                            var note = scheduleNote.value.trim();
                                                            if (note === '') {
                                                                scheduleNote.classList.add('is-invalid');
                                                                isValid = false;
                                                            }
                                                            if (!isValid) {
                                                                event.preventDefault();
                                                            }

                                                        });
                                                        document.getElementById("weekSelect").onchange = function () {
                                                            document.getElementById("updateWeek").submit(); // Submit form khi onchange dropdown
                                                        };


        </script>

    </body>

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/admin/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:33:02 GMT -->
</html>
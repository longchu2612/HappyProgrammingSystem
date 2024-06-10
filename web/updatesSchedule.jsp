<%-- 
    Document   : updatesSchedule
    Created on : Jun 9, 2024, 11:15:11 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Schedule" %>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/profile-settings-mentee.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:23 GMT -->
    <head>
        <meta charset="utf-8">
        <title>Mentoring</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">

        <link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css">

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
                                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Profile Settings</li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">Profile Settings</h2>
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
                            <div class="card">
                                <div class="card-body">

                                    <form id="updateScheduleForm" action="update_schedule" method="Post"> 
                                        <input type="hidden" name="action" value="create"/>
                                        <div class="row form-row">
                                            <div class="col-12 col-md-12">
                                                <div class="form-group">
                                                    <h4>Update Schedule</h4>  
                                                </div>

                                            </div>
                                            <h4 style="color: red; align-content: center;">
                                                ${requestScope.message}
                                            </h4>

                                            <div class="col-12 col-md-5">
                                                <div class="form-group">
                                                    <label>Month</label>
                                                <% 
                                                  List<Schedule> schedules = (List<Schedule>) request.getAttribute("schedules");
                                                   
                                                %>
                                                    <select class="form-control select" name="month">
                                                        <option value="1" <% if (schedules.get(0).getMonth() == 1) { %> selected <% } %>>January</option>
                                                        <option value="2" <% if (schedules.get(0).getMonth() == 2) { %> selected <% } %>>February</option>
                                                        <option value="3" <% if (schedules.get(0).getMonth() == 3) { %> selected <% } %>>March</option>
                                                        <option value="4" <% if (schedules.get(0).getMonth() == 4) { %> selected <% } %>>April</option>
                                                        <option value="5" <% if (schedules.get(0).getMonth() == 5) { %> selected <% } %>>May</option>
                                                        <option value="6" <% if (schedules.get(0).getMonth() == 6) { %> selected <% } %>>June</option>
                                                        <option value="7" <% if (schedules.get(0).getMonth() == 7) { %> selected <% } %>>July</option>
                                                        <option value="8" <% if (schedules.get(0).getMonth() == 8) { %> selected <% } %>>August</option>
                                                        <option value="9" <% if (schedules.get(0).getMonth() == 9) { %> selected <% } %>>September</option>
                                                        <option value="10"<% if (schedules.get(0).getMonth() == 10) { %> selected <% } %>>October</option>
                                                        <option value="11"<% if (schedules.get(0).getMonth() == 11) { %> selected <% } %>>November</option>
                                                        <option value="12"<% if (schedules.get(0).getMonth() == 12) { %> selected <% } %>>December</option>
                                                    </select>
                                                </div>
                                                <%
                                                    List<Integer> scheduledDays = new ArrayList<>();
                                                    
    
                                                    for (Schedule schedule : schedules) {
                                                         scheduledDays.add(schedule.getDayOfWeek());
                                                    }
                                                
                                                %>
                                                <%!
                                                     String getStartTime(List<Schedule> schedules, String day) {
                                                     for (Schedule schedule : schedules) {
                                                        if (Integer.toString(schedule.getDayOfWeek()).equals(day)) {
                                                         return schedule.getStartTime().toString(); 
                                                        }
                                                     }
                                                     return "";                                                    
                                                    }
    
                                                    String getEndTime(List<Schedule> schedules, String day) {
                                                    for (Schedule schedule : schedules) {
                                                        if (Integer.toString(schedule.getDayOfWeek()).equals(day)) {
                                                           return schedule.getEndTime().toString();
                                                        }
                                                    }
                                                        return "";
                                                    }
                                                
                                                %>
                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input" id="checkBoxMonday" onchange="toggleDates()" name="selecteDay" value="2" <% if (scheduledDays.contains(2)) { %> checked <% } %>/> Monday

                                                </div>

                                                <div class="form-row mt-3" id="dateMonday" <% if (scheduledDays.contains(2)) { %> style="display: block;" <% } else { %> style="display: none;" <% } %>>
                                                    <div class="form-group col-md-6">
                                                        <lable>Start Date</lable>
                                                        <input type="time" id="startMonday" name="startDateMonday" value="<%= getStartTime(schedules, "2") %>"  class="form-control"/>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>End Date</label>
                                                        <input type="time" id="endMonday" name="enDateMonday" value="<%= getEndTime(schedules, "2") %>" class="form-control"/>
                                                        <div class="invalid-feedback">
                                                            Time cannot be empty and startdate must be less than endDate
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input" id="checkBoxTuesday" onchange="toggleDates()" name="selecteDay" value="3" <% if (scheduledDays.contains(3)) { %> checked <% } %>/> Tuesday

                                                </div>

                                                <div class="form-row mt-3" id="dateTuesday"  <% if (scheduledDays.contains(3)) { %> style="display: block;" <% } else { %> style="display: none;" <% } %>>
                                                    <div class="form-group col-md-6">
                                                        <lable>Start Date</lable>
                                                        <input type="time" id="startTuesday" name="startDateTuesday" value="<%= getStartTime(schedules, "3") %>"  class="form-control"/>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>End Date</label>
                                                        <input type="time" id="endTuesday" name="enDateTuesday" value="<%= getEndTime(schedules, "3") %>" class="form-control"/>
                                                        <div class="invalid-feedback">
                                                            Time cannot be empty and startdate must be less than endDate
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input" id="checkBoxWed" onchange="toggleDates()" name="selecteDay" value="4" <% if (scheduledDays.contains(4)) { %> checked <% } %>/> Wednesday

                                                </div>

                                                <div class="form-row mt-3" id="dateWed" <% if (scheduledDays.contains(4)) { %> style="display: block;" <% } else { %> style="display: none;" <% } %>>
                                                    <div class="form-group col-md-6">
                                                        <lable>Start Date</lable>
                                                        <input type="time" id="startWed" name="startWednesday" value="<%= getStartTime(schedules, "4") %>"  class="form-control"/>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>End Date</label>
                                                        <input type="time" id="endWed" name="endWednesday" value="<%= getEndTime(schedules, "4") %>" class="form-control"/>
                                                        <div class="invalid-feedback">
                                                            Time cannot be empty and startdate must be less than endDate
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input" id="checkBoxThurs" onchange="toggleDates()" name="selecteDay" value="5" <% if (scheduledDays.contains(5)) { %> checked <% } %>/> Thursday

                                                </div>

                                                <div class="form-row mt-3" id="dateThurs" <% if (scheduledDays.contains(5)) { %> style="display: block;" <% } else { %> style="display: none;" <% } %>>
                                                    <div class="form-group col-md-6">
                                                        <lable>Start Date</lable>
                                                        <input type="time" id="startThurs" name="startThursday"  value="<%= getStartTime(schedules, "5") %>" class="form-control"/>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>End Date</label>
                                                        <input type="time" id="endThurs" name="endThursday" value="<%= getEndTime(schedules, "5") %>" class="form-control"/>
                                                        <div class="invalid-feedback">
                                                            Time cannot be empty and startdate must be less than endDate
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input" id="checkBoxFriday" onchange="toggleDates()" name="selecteDay" value="6" <% if (scheduledDays.contains(6)) { %> checked <% } %>/> Friday

                                                </div>

                                                <div class="form-row mt-3" id="dateFriday" <% if (scheduledDays.contains(6)) { %> style="display: block;" <% } else { %> style="display: none;" <% } %>>
                                                    <div class="form-group col-md-6">
                                                        <lable>Start Date</lable>
                                                        <input type="time" id="startFriday" name="startFriday" value="<%= getStartTime(schedules, "6") %>"  class="form-control"/>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>End Date</label>
                                                        <input type="time" id="endFriday" name="endFriday" value="<%= getEndTime(schedules, "6") %>" class="form-control"/>
                                                        <div class="invalid-feedback">
                                                            Time cannot be empty and startdate must be less than endDate
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>















                                        </div>
                                        <div class="submit-section">
                                            <button type="submit" class="btn btn-primary submit-btn">Create</button>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
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


        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/plugins/select2/js/select2.min.js"></script>

        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>

        <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <script src="assets/js/script.js"></script>
        <script>
                                                        document.getElementById('updateScheduleForm').addEventListener('submit', function (event) {

                                                            var isValid = true;
                                                            var checkBoxMonday = document.getElementById('checkBoxMonday');
                                                            var startMonday = document.getElementById('startMonday');
                                                            var endMonday = document.getElementById('endMonday');
                                                            var startMon = startMonday.value.trim();
                                                            var endMon = endMonday.value.trim();
                                                            if (checkBoxMonday.checked) {
                                                                if (startMon === '' || endMon === '') {
                                                                    startMonday.classList.add('is-invalid');
                                                                    endMonday.classList.add('is-invalid');
                                                                    isValid = false;
                                                                } else if (startMon >= endMon) {
                                                                    startMonday.classList.add('is-invalid');
                                                                    endMonday.classList.add('is-invalid');
                                                                    isValid = false;
                                                                } else {
                                                                    startMonday.classList.remove('is-invalid');
                                                                    endMonday.classList.remove('is-invalid');

                                                                }
                                                            }

                                                            var checkBoxWed = document.getElementById('checkBoxWed');
                                                            var startWednesday = document.getElementById('startWed');
                                                            var endWednesday = document.getElementById('endWed');
                                                            var startWed = startWednesday.value.trim();
                                                            var endWed = endWednesday.value.trim();
                                                            if (checkBoxWed.checked) {
                                                                if (startWed === '' || endWed === '') {
                                                                    startWednesday.classList.add('is-invalid');
                                                                    endWednesday.classList.add('is-invalid');
                                                                    isValid = false;
                                                                } else if (startWed >= endWed) {
                                                                    startWednesday.classList.add('is-invalid');
                                                                    endWednesday.classList.add('is-invalid');
                                                                    isValid = false;
                                                                } else {
                                                                    startWednesday.classList.remove('is-invalid');
                                                                    endWednesday.classList.remove('is-invalid');

                                                                }
                                                            }


                                                            var checkBoxThurs = document.getElementById('checkBoxThurs');
                                                            var startThursday = document.getElementById('startThurs');
                                                            var endThursday = document.getElementById('endThurs');
                                                            var startThurs = startThursday.value.trim();
                                                            var endThurs = endThursday.value.trim();
                                                            if (checkBoxThurs.checked) {
                                                                if (startThurs === '' || endThurs === '') {
                                                                    startThursday.classList.add('is-invalid');
                                                                    endThursday.classList.add('is-invalid');
                                                                    isValid = false;
                                                                } else if (startThurs >= endThurs) {
                                                                    startThursday.classList.add('is-invalid');
                                                                    endThursday.classList.add('is-invalid');
                                                                    isValid = false;
                                                                } else {
                                                                    startWednesday.classList.remove('is-invalid');
                                                                    endWednesday.classList.remove('is-invalid');

                                                                }
                                                            }

                                                            var checkBoxFriday = document.getElementById('checkBoxFriday');
                                                            var startFriday = document.getElementById('startFriday');
                                                            var endFriday = document.getElementById('endFriday');
                                                            var startFri = startFriday.value.trim();
                                                            var endFri = endFriday.value.trim();
                                                            if (checkBoxFriday.checked) {
                                                                if (startFri === '' || endFri === '') {
                                                                    startFriday.classList.add('is-invalid');
                                                                    endFriday.classList.add('is-invalid');
                                                                    isValid = false;
                                                                } else if (startFri >= endFri) {
                                                                    startFriday.classList.add('is-invalid');
                                                                    endFriday.classList.add('is-invalid');
                                                                    isValid = false;
                                                                } else {
                                                                    startFriday.classList.remove('is-invalid');
                                                                    endFriday.classList.remove('is-invalid');

                                                                }
                                                            }


                                                            var checkboxTuesday = document.getElementById('checkBoxTuesday');
                                                            var startTuesday = document.getElementById('startTuesday');
                                                            var endTuesday = document.getElementById('endTuesday');
                                                            var startTue = startTuesday.value.trim();
                                                            var endTue = endTuesday.value.trim();


                                                            if (checkboxTuesday.checked) {
                                                                if (startTue === '' || endTue === '') {
                                                                    startTuesday.classList.add('is-invalid');
                                                                    endTuesday.classList.add('is-invalid');
                                                                    isValid = false;
                                                                } else if (startTue >= endTue) {
                                                                    startTuesday.classList.add('is-invalid');
                                                                    endTuesday.classList.add('is-invalid');
                                                                    isValid = false;
                                                                } else {
                                                                    startTuesday.classList.remove('is-invalid');
                                                                    endTuesday.classList.remove('is-invalid');

                                                                }


                                                            }





                                                            if (!isValid) {
                                                                event.preventDefault();
                                                            }

                                                        });
        </script>
    </body>

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/profile-settings-mentee.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:23 GMT -->
</html>




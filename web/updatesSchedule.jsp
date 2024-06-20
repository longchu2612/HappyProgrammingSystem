<%-- 
    Document   : createSchedule
    Created on : Jun 5, 2024, 3:56:42 AM
    Author     : asus
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ page import="helper.ScheduleHelper" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Slot" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
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

                                    <form id="createScheduleMonth" action="" method="Post"> 
                                        <input type="hidden" name="action" value="create"/>
                                        <div class="row form-row">
                                            <div class="col-12 col-md-12">
                                                <div class="form-group">
                                                    <h4>Update Schedule</h4>
                                                </div>
                                                <h4 style="color: red; align-content: center;">
                                                    ${requestScope.message}
                                                </h4>
                                            </div>
                                            <div class="col-12 col-md-2 mb-3">
                                                <!--                                                <div class="row">
                                                                                                    <div class="col-md-3 mb-3">
                                                                                                        <label>Start Date</label>
                                                                                                        <input type="date" class="form-control" value="${requestScope.startDate}" name="start_date" value="" id="startDate"/>
                                                                                                        <div class="invalid-feedback">
                                                                                                            Please choose a end date,start date and start date before end date.
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <div class="col-md-3 mb-3">
                                                                                                        <label>End Date</label>
                                                                                                        <input type="date" class="form-control" value="${requestScope.endDate}" name="end_date" value="" id="endDate"/>
                                                
                                                                                                    </div>
                                                
                                                                                                </div>-->
                                                <label>Month:</label>
                                                <select class="form-select" name="selectMonth" aria-label="Default select example" disabled>
                                                    <option value="1" ${requestScope.month == 1 ? 'selected' : ''}>January </option>
                                                    <option value="2" ${requestScope.month == 2 ? 'selected' : ''}>February</option>
                                                    <option value="3" ${requestScope.month == 3 ? 'selected' : ''}>March</option>
                                                    <option value="4" ${requestScope.month == 4 ? 'selected' : ''}>April</option>
                                                    <option value=s"5" ${requestScope.month == 5 ? 'selected' : ''}>May</option>
                                                    <option value="6" ${requestScope.month == 6 ? 'selected' : ''}>June</option>
                                                    <option value="7" ${requestScope.month == 7 ? 'selected' : ''}>July</option>
                                                    <option value="8" ${requestScope.month == 8 ? 'selected' : ''}>August</option>
                                                    <option value="9" ${requestScope.month == 9 ? 'selected' : ''}>September</option>
                                                    <option value="10" ${requestScope.month == 10 ? 'selected' : ''} >October</option>
                                                    <option value="11" ${requestScope.month == 11 ? 'selected' : ''}>November</option>
                                                    <option value="12" ${requestScope.month == 12 ? 'selected' : ''}>December</option>
                                                </select>

                                            </div>
                                            <div class="col-12 col-md-12">

                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th class="text-center">
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

                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            List<Slot> slots = (List<Slot>) request.getAttribute("slots");
                                                        %>
                                                        <tr>
                                                            <td>Slot 1 (7h30 --> 9h30)</td>
                                                            <td><input type="checkbox" id="mon1" name="slot_1" value="1" data-slot="1" <%= ScheduleHelper.isCheckedSlot(slots, 1, 1)%> data-day-index="0" ></td>
                                                            <td><input type="checkbox" id="tue1" name="slot_1" value="2" data-slot="1" <%= ScheduleHelper.isCheckedSlot(slots, 1, 2)%> data-day-index="1" ></td>
                                                            <td><input type="checkbox" id="wed1" name="slot_1" value="3" data-slot="1" <%= ScheduleHelper.isCheckedSlot(slots, 1, 3)%> data-day-index="2" ></td>
                                                            <td><input type="checkbox" id="thu1" name="slot_1" value="4" data-slot="1" <%= ScheduleHelper.isCheckedSlot(slots, 1, 4)%> data-day-index="3" ></td>
                                                            <td><input type="checkbox" id="fri1" name="slot_1" value="5" data-slot="1" <%= ScheduleHelper.isCheckedSlot(slots, 1, 5)%>data-day-index="4" ></td>
                                                            <td><input type="checkbox" id="sat1" name="slot_1" value="6" data-slot="1" <%= ScheduleHelper.isCheckedSlot(slots, 1, 6)%> data-day-index="5" ></td>
                                                            <td><input type="checkbox" id="sun1" name="slot_1" value="7" data-slot="1" <%= ScheduleHelper.isCheckedSlot(slots, 1, 7)%> data-day-index="6" ></td>
                                                        </tr>

                                                        <tr>
                                                            <td>Slot 2 (9h45 --> 11h45)</td>
                                                            <td><input type="checkbox" id="mon2" name="slot_2" value ="1" data-slot="2" data-day-index="0" <%= ScheduleHelper.isCheckedSlot(slots, 2, 1)%> ></td>
                                                            <td><input type="checkbox" id="tue2" name="slot_2" value ="2"  data-slot="2" data-day-index="1" <%= ScheduleHelper.isCheckedSlot(slots, 2, 2)%> ></td>
                                                            <td><input type="checkbox" id="wed2" name="slot_2" value ="3" data-slot="2" data-day-index="2" <%= ScheduleHelper.isCheckedSlot(slots, 2, 3)%> ></td>
                                                            <td><input type="checkbox" id="thu2" name="slot_2" value ="4" data-slot="2" data-day-index="3" <%= ScheduleHelper.isCheckedSlot(slots, 2, 4)%> ></td>
                                                            <td><input type="checkbox" id="fri2" name="slot_2" value ="5"  data-slot="2" data-day-index="4" <%= ScheduleHelper.isCheckedSlot(slots, 2, 5)%> ></td>
                                                            <td><input type="checkbox" id="sat2" name="slot_2" value ="6" data-slot="2" data-day-index="5" <%= ScheduleHelper.isCheckedSlot(slots, 2, 6)%> ></td>
                                                            <td><input type="checkbox" id="sun2" name="slot_2" value ="7" data-slot="2" data-day-index="6" <%= ScheduleHelper.isCheckedSlot(slots, 2, 7)%>></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Slot 3 (13h30 --> 15h30)</td>
                                                            <td><input type="checkbox" id="mon3" name="slot_3" value ="1" data-slot="3" data-day-index="0" <%= ScheduleHelper.isCheckedSlot(slots, 3, 1)%> ></td>
                                                            <td><input type="checkbox" id="tue3" name="slot_3" value ="2" data-slot="3" data-day-index="1" <%= ScheduleHelper.isCheckedSlot(slots, 3, 2)%>></td>
                                                            <td><input type="checkbox" id="wed3" name="slot_3" value ="3" data-slot="3" data-day-index="2" <%= ScheduleHelper.isCheckedSlot(slots, 3, 3)%>></td>
                                                            <td><input type="checkbox" id="thu3" name="slot_3" value ="4" data-slot="3" data-day-index="3" <%= ScheduleHelper.isCheckedSlot(slots, 3, 4)%>></td>
                                                            <td><input type="checkbox" id="fri3" name="slot_3" value ="5" data-slot="3" data-day-index="4" <%= ScheduleHelper.isCheckedSlot(slots, 3, 5)%>></td>
                                                            <td><input type="checkbox" id="sat3" name="slot_3" value ="6" data-slot="3" data-day-index="5" <%= ScheduleHelper.isCheckedSlot(slots, 3, 6)%>></td>
                                                            <td><input type="checkbox" id="sun3" name="slot_3" value ="7" data-slot="3" data-day-index="6" <%= ScheduleHelper.isCheckedSlot(slots, 3, 7)%>></td>
                                                        </tr>


                                                        <tr>
                                                            <td>Slot 4 (16h --> 18h)</td>
                                                            <td><input type="checkbox" id="mon4" name="slot_4" value ="1" data-slot="4" data-day-index="0" <%= ScheduleHelper.isCheckedSlot(slots, 4, 1)%>></td>
                                                            <td><input type="checkbox" id="tue4" name="slot_4" value ="2" data-slot="4" data-day-index="1" <%= ScheduleHelper.isCheckedSlot(slots, 4, 2)%>></td>
                                                            <td><input type="checkbox" id="wed4" name="slot_4" value ="3" data-slot="4" data-day-index="2" <%= ScheduleHelper.isCheckedSlot(slots, 4, 3)%>></td>
                                                            <td><input type="checkbox" id="thu4" name="slot_4" value ="4" data-slot="4" data-day-index="3" <%= ScheduleHelper.isCheckedSlot(slots, 4, 4)%>></td>
                                                            <td><input type="checkbox" id="fri4" name="slot_4" value ="5" data-slot="4" data-day-index="4" <%= ScheduleHelper.isCheckedSlot(slots, 4, 5)%>></td>
                                                            <td><input type="checkbox" id="sat4" name="slot_4" value ="6" data-slot="4" data-day-index="5" <%= ScheduleHelper.isCheckedSlot(slots, 4, 6)%>></td>
                                                            <td><input type="checkbox" id="sun4" name="slot_4" value ="7" data-slot="4" data-day-index="6" <%= ScheduleHelper.isCheckedSlot(slots, 4, 7)%>></td>
                                                        </tr>

                                                        <tr>
                                                            <td>Slot 5 (19h --> 21h)</td>
                                                            <td><input type="checkbox" id="mon5" name="slot_5" value="1" data-slot="5" data-day-index="0" <%= ScheduleHelper.isCheckedSlot(slots, 5, 1)%>></td>
                                                            <td><input type="checkbox" id="tue5" name="slot_5" value="2" data-slot="5" data-day-index="1" <%= ScheduleHelper.isCheckedSlot(slots, 5, 2)%>></td>
                                                            <td><input type="checkbox" id="wed5" name="slot_5" value ="3" data-slot="5" data-day-index="2" <%= ScheduleHelper.isCheckedSlot(slots, 5, 3)%>></td>
                                                            <td><input type="checkbox" id="thu5" name="slot_5" value ="4" data-slot="5" data-day-index="3" <%= ScheduleHelper.isCheckedSlot(slots, 5, 4)%>></td>
                                                            <td><input type="checkbox" id="fri5" name="slot_5" value ="5" data-slot="5" data-day-index="4" <%= ScheduleHelper.isCheckedSlot(slots, 5, 5)%>></td>
                                                            <td><input type="checkbox" id="sat5" name="slot_5" value ="6" data-slot="5" data-day-index="5" <%= ScheduleHelper.isCheckedSlot(slots, 5, 6)%>></td>
                                                            <td><input type="checkbox" id="sun5" name="slot_5" value ="7" data-slot="5" data-day-index="6" <%= ScheduleHelper.isCheckedSlot(slots, 5, 7)%>></td>
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
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-8 mt-4">   
                                            <div class="row">
                                                <div class="submit-section col-md-2">
                                                    <button type="submit" id="createButton" class="btn btn-primary">Update</button>
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
            document.getElementById('createScheduleMonth').addEventListener('submit', function (event) {

                var isValid = true;

                var startDate = document.getElementById('startDate');
                var endDate = document.getElementById('endDate');
                var start = startDate.value.trim();
                var end = endDate.value.trim();

                if (start === '' || end === '') {
                    startDate.classList.add('is-invalid');
                    endDate.classList.add('is-invalid');
                    isValid = false;
                } else if (start >= end) {
                    startDate.classList.add('is-invalid');
                    endDate.classList.add('is-invalid');
                    isValid = false;
                } else {
                    startDate.classList.remove('is-invalid');
                    endDate.classList.remove('is-invalid');

                }
                if (!isValid) {
                    event.preventDefault();
                }

            });
        </script>
    </body>

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/profile-settings-mentee.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:23 GMT -->
</html>



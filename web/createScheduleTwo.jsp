<%-- 
    Document   : createScheduleTwo
    Created on : Jun 10, 2024, 10:10:07 PM
    Author     : asus
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <style>

            .table thead th {
                vertical-align: middle;
                text-align: center;
                background-color: #f8f9fa;
                font-weight: bold;
            }



        </style>
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

                                    <form action="schedule" method="Post"> 
                                        <input type="hidden" name="action" value="create"/>
                                        <div class="row form-row">
                                            <div class="col-12 col-md-12">
                                                <div class="form-group">
                                                    <h4>Create Schedule</h4>
                                                </div>

                                            </div>
                                            <div class="col-12 col-md-12">
                                                <div class="row">
                                                    <div class="col-md-3 mb-3">
                                                        <label>Start Date</label>
                                                        <input type="date" class="form-control"/>
                                                    </div>
                                                    <div class="col-md-3 mb-3">
                                                        <label>End Date</label>
                                                        <input type="date" class="form-control"/>
                                                    </div>
                                                    <div class="col-md-3 mb-3">
                                                        <label>Type</label>
                                                        <select class="form-select">
                                                            <option>Choose type</option>
                                                            <option>Month</option>
                                                            <option>Week</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-12">
                                                <h4 style="color: red; align-content: center;">
                                                    ${requestScope.message}
                                                </h4>
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th rowspan="2">Year 
                                                                <select style="margin-bottom: 5px;">
                                                                    <option>2024</option>
                                                                    <option>2025</option>
                                                                </select><br>
                                                                Week

                                                                <select id="weekSelect" onchange="updateWeekDays()">
                                                                    <option value="1">01/01 To 07/01</option>
                                                                    <option value="2">08/01 To 14/01</option>
                                                                    <option value="3">15/01 To 21/01</option>
                                                                    <option value="4">22/01 To 28/01</option>
                                                                    <option value="5">29/01 To 04/02</option>
                                                                    <option value="6">05/02 To 11/02</option>
                                                                    <option value="7">12/02 To 18/02</option>
                                                                    <option value="8">19/02 To 25/02</option>
                                                                    <option value="9">26/02 To 03/03</option>
                                                                    <option value="10">04/03 To 10/03</option>
                                                                    <option value="11">11/03 To 17/03</option>
                                                                    <option value="12">18/03 To 24/03</option>
                                                                    <option value="13">25/03 To 31/03</option>
                                                                    <option value="14">01/04 To 07/04</option>
                                                                    <option value="15">08/04 To 14/04</option>
                                                                    <option value="16">15/04 To 21/04</option>
                                                                    <option value="17">22/04 To 28/04</option>
                                                                    <option value="18">29/04 To 05/05</option>
                                                                    <option value="19">06/05 To 12/05</option>
                                                                    <option value="20">13/05 To 19/05</option>
                                                                    <option value="21">20/05 To 26/05</option>
                                                                    <option value="22">27/05 To 02/06</option>
                                                                    <option value="23">03/06 To 09/06</option>
                                                                    <option value="24">10/06 To 16/06</option>
                                                                    <option value="25">17/06 To 23/06</option>
                                                                    <option value="26">24/06 To 30/06</option>
                                                                    <option value="27">01/07 To 07/07</option>
                                                                    <option value="28">08/07 To 14/07</option>
                                                                    <option value="29">15/07 To 21/07</option>
                                                                    <option value="30">22/07 To 28/07</option>
                                                                    <option value="31">29/07 To 04/08</option>
                                                                    <option value="32">05/08 To 11/08</option>
                                                                    <option value="33">12/08 To 18/08</option>
                                                                    <option value="34">19/08 To 25/08</option>
                                                                    <option value="35">26/08 To 01/09</option>
                                                                    <option value="36">02/09 To 08/09</option>
                                                                    <option value="37">09/09 To 15/09</option>
                                                                    <option value="38">16/09 To 22/09</option>
                                                                    <option value="39">23/09 To 29/09</option>
                                                                    <option value="40">30/09 To 06/10</option>
                                                                    <option value="41">07/10 To 13/10</option>
                                                                    <option value="42">14/10 To 20/10</option>
                                                                    <option value="43">21/10 To 27/10</option>
                                                                    <option value="44">28/10 To 03/11</option>
                                                                    <option value="45">04/11 To 10/11</option>
                                                                    <option value="46">11/11 To 17/11</option>
                                                                    <option value="47">18/11 To 24/11</option>
                                                                    <option value="48">25/11 To 01/12</option>
                                                                    <option value="49">02/12 To 08/12</option>
                                                                    <option value="50">09/12 To 15/12</option>
                                                                    <option value="51">16/12 To 22/12</option>
                                                                    <option value="52">23/12 To 29/12</option>
                                                                </select>
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
                                                            <th></th>
                                                            <th></th>
                                                            <th></th>
                                                            <th></th>
                                                            <th></th>
                                                            <th></th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Slot 1 (7h30 --> 9h30)</td>
                                                            <td><input type="checkbox" id="mon1" name="slot_1" data-slot="1" data-day-index="0" ></td>
                                                            <td><input type="checkbox" id="tue1" name="slot_1" data-slot="1" data-day-index="1" ></td>
                                                            <td><input type="checkbox" id="wed1" name="slot_1" data-slot="1" data-day-index="2" ></td>
                                                            <td><input type="checkbox" id="thu1" name="slot_1" data-slot="1" data-day-index="3" ></td>
                                                            <td><input type="checkbox" id="fri1" name="slot_1" data-slot="1" data-day-index="4" ></td>
                                                            <td><input type="checkbox" id="sat1" name="slot_1" data-slot="1" data-day-index="5" ></td>
                                                            <td><input type="checkbox" id="sun1" name="slot_1" data-slot="1" data-day-index="6" ></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Slot 2 (9h45 --> 11h45)</td>
                                                            <td><input type="checkbox" id="mon2" name="slot_2" data-slot="2" data-day-index="0" ></td>
                                                            <td><input type="checkbox" id="tue2" name="slot_2" data-slot="2" data-day-index="1" ></td>
                                                            <td><input type="checkbox" id="wed2" name="slot_2" data-slot="2" data-day-index="2" ></td>
                                                            <td><input type="checkbox" id="thu2" name="slot_2" data-slot="2" data-day-index="3" ></td>
                                                            <td><input type="checkbox" id="fri2" name="slot_2" data-slot="2" data-day-index="4" ></td>
                                                            <td><input type="checkbox" id="sat2" name="slot_2" data-slot="2" data-day-index="5" ></td>
                                                            <td><input type="checkbox" id="sun2" name="slot_2" data-slot="2" data-day-index="6" ></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Slot 3 (13h30 --> 15h30)</td>
                                                            <td><input type="checkbox" id="mon3" name="slot_3" data-slot="3" data-day-index="0"></td>
                                                            <td><input type="checkbox" id="tue3" name="slot_3" data-slot="3" data-day-index="1"></td>
                                                            <td><input type="checkbox" id="wed3" name="slot_3" data-slot="3" data-day-index="2"></td>
                                                            <td><input type="checkbox" id="thu3" name="slot_3" data-slot="3" data-day-index="3"></td>
                                                            <td><input type="checkbox" id="fri3" name="slot_3" data-slot="3" data-day-index="4"></td>
                                                            <td><input type="checkbox" id="sat3" name="slot_3" data-slot="3" data-day-index="5"></td>
                                                            <td><input type="checkbox" id="sun3" name="slot_3" data-slot="3" data-day-index="6"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Slot 4 (16h --> 18h)</td>
                                                            <td><input type="checkbox" id="mon4" name="slot_4" data-slot="4" data-day-index="0"></td>
                                                            <td><input type="checkbox" id="tue4" name="slot_4" data-slot="4" data-day-index="1"></td>
                                                            <td><input type="checkbox" id="wed4" name="slot_4" data-slot="4" data-day-index="2"></td>
                                                            <td><input type="checkbox" id="thu4" name="slot_4" data-slot="4" data-day-index="3"></td>
                                                            <td><input type="checkbox" id="fri4" name="slot_4" data-slot="4" data-day-index="4"></td>
                                                            <td><input type="checkbox" id="sat4" name="slot_4" data-slot="4" data-day-index="5"></td>
                                                            <td><input type="checkbox" id="sun4" name="slot_4" data-slot="4" data-day-index="6"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Slot 5 (19h --> 21h)</td>
                                                            <td><input type="checkbox" id="mon5" name="slot_5" data-slot="5" data-day-index="0"></td>
                                                            <td><input type="checkbox" id="tue5" name="slot_5" data-slot="5" data-day-index="1"></td>
                                                            <td><input type="checkbox" id="wed5" name="slot_5" data-slot="5" data-day-index="2"></td>
                                                            <td><input type="checkbox" id="thu5" name="slot_5" data-slot="5" data-day-index="3"></td>
                                                            <td><input type="checkbox" id="fri5" name="slot_5" data-slot="5" data-day-index="4"></td>
                                                            <td><input type="checkbox" id="sat5" name="slot_5" data-slot="5" data-day-index="5"></td>
                                                            <td><input type="checkbox" id="sun5" name="slot_5" data-slot="5" data-day-index="6"></td>
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
                                                    <button type="button" class="btn btn-primary">Save</button>
                                                </div>

                                                <div class="submit-section col-md-2">
                                                    <button type="submit" id="createButton" class="btn btn-primary">Create</button>
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
                                                                    function getWeekNumber(date) {
                                                                        const firstDayOfYear = new Date(date.getFullYear(), 0, 1);
                                                                        const pastDaysOfYear = (date - firstDayOfYear) / 86400000;
                                                                        return Math.ceil((pastDaysOfYear + firstDayOfYear.getDay() + 1) / 7);
                                                                    }

                                                                    var currentDate = new Date();
                                                                    var currentWeek = getWeekNumber(currentDate);
                                                                    document.getElementById("weekSelect").value = currentWeek;

                                                                    updateWeekDays();

                                                                    




        </script>

    </body>

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/profile-settings-mentee.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:23 GMT -->
</html>



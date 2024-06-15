<%-- 
    Document   : update-schedule
    Created on : Jun 15, 2024, 7:23:58 AM
    Author     : asus
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
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
                                    <form id="createScheduleMonth" action="schedule_month" method="Post"> 
                                        <input type="hidden" name="action" value="create"/>
                                        <div class="row form-row">
                                            <div class="col-12 col-md-12">
                                                <h4 style="color: red; align-content: center;">
                                                    ${requestScope.message}
                                                </h4>
                                            </div>
                                            <div class="col-12 col-md-12">
                                                <div class="row">
                                                    <div class="col-md-3 mb-3">
                                                        <label>Start Date</label>
                                                        <input type="date" class="form-control" name="start_date" value="${requestScope.startDate}" id="startDate"/>
                                                        <div class="invalid-feedback">
                                                            Please choose a end date,start date and start date before end date.
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 mb-3">
                                                        <label>End Date</label>
                                                        <input type="date" class="form-control" name="end_date" value="${requestScope.endDate}" id="endDate"/>

                                                    </div>

                                                </div>

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

                                                        <tr>
                                                            <td>Slot 1 (7h30 --> 9h30)</td>
                                                            <td><input type="checkbox" id="mon1" name="slot_1" value="1" data-slot="1" data-day-index="0" checked disabled ></td>
                                                            <td><input type="checkbox" id="tue1" name="slot_1" value="2" data-slot="1" data-day-index="1" disabled ></td>
                                                            <td><input type="checkbox" id="wed1" name="slot_1" value="3" data-slot="1" data-day-index="2" disabled ></td>
                                                            <td><input type="checkbox" id="thu1" name="slot_1" value="4" data-slot="1" data-day-index="3" disabled ></td>
                                                            <td><input type="checkbox" id="fri1" name="slot_1" value="5" data-slot="1" data-day-index="4" disabled ></td>
                                                            <td><input type="checkbox" id="sat1" name="slot_1" value="6" data-slot="1" data-day-index="5" disabled ></td>
                                                            <td><input type="checkbox" id="sun1" name="slot_1" value="7" data-slot="1" data-day-index="6" disabled ></td>
                                                        </tr>


                                                        <tr>
                                                            <td>Slot 2 (9h45 --> 11h45)</td>
                                                            <td><input type="checkbox" id="mon2" name="slot_2" value ="1" data-slot="2" data-day-index="0" ></td>
                                                            <td><input type="checkbox" id="tue2" name="slot_2" value ="2"  data-slot="2" data-day-index="1" ></td>
                                                            <td><input type="checkbox" id="wed2" name="slot_2" value ="3" data-slot="2" data-day-index="2" ></td>
                                                            <td><input type="checkbox" id="thu2" name="slot_2" value ="4" data-slot="2" data-day-index="3" ></td>
                                                            <td><input type="checkbox" id="fri2" name="slot_2" value ="5"  data-slot="2" data-day-index="4" ></td>
                                                            <td><input type="checkbox" id="sat2" name="slot_2" value ="6" data-slot="2" data-day-index="5" ></td>
                                                            <td><input type="checkbox" id="sun2" name="slot_2" value ="7" data-slot="2" data-day-index="6" ></td>
                                                        </tr>


                                                        <tr>
                                                            <td>Slot 3 (13h30 --> 15h30)</td>
                                                            <td><input type="checkbox" id="mon3" name="slot_3" value ="1" data-slot="3" data-day-index="0" ></td>
                                                            <td><input type="checkbox" id="tue3" name="slot_3" value ="2" data-slot="3" data-day-index="1" ></td>
                                                            <td><input type="checkbox" id="wed3" name="slot_3" value ="3" data-slot="3" data-day-index="2" ></td>
                                                            <td><input type="checkbox" id="thu3" name="slot_3" value ="4" data-slot="3" data-day-index="3" ></td>
                                                            <td><input type="checkbox" id="fri3" name="slot_3" value ="5" data-slot="3" data-day-index="4" ></td>
                                                            <td><input type="checkbox" id="sat3" name="slot_3" value ="6" data-slot="3" data-day-index="5" ></td>
                                                            <td><input type="checkbox" id="sun3" name="slot_3" value ="7" data-slot="3" data-day-index="6" ></td>
                                                        </tr>


                                                        <tr>
                                                            <td>Slot 4 (16h --> 18h)</td>
                                                            <td><input type="checkbox" id="mon4" name="slot_4" value ="1" data-slot="4" data-day-index="0" ></td>
                                                            <td><input type="checkbox" id="tue4" name="slot_4" value ="2" data-slot="4" data-day-index="1" ></td>
                                                            <td><input type="checkbox" id="wed4" name="slot_4" value ="3" data-slot="4" data-day-index="2" ></td>
                                                            <td><input type="checkbox" id="thu4" name="slot_4" value ="4" data-slot="4" data-day-index="3" ></td>
                                                            <td><input type="checkbox" id="fri4" name="slot_4" value ="5" data-slot="4" data-day-index="4" ></td>
                                                            <td><input type="checkbox" id="sat4" name="slot_4" value ="6" data-slot="4" data-day-index="5" ></td>
                                                            <td><input type="checkbox" id="sun4" name="slot_4" value ="7" data-slot="4" data-day-index="6" ></td>
                                                        </tr>


                                                        <tr>
                                                            <td>Slot 5 (19h --> 21h)</td>
                                                            <td><input type="checkbox" id="mon5" name="slot_5" value="1" data-slot="5" data-day-index="0" ></td>
                                                            <td><input type="checkbox" id="tue5" name="slot_5" value="2" data-slot="5" data-day-index="1" ></td>
                                                            <td><input type="checkbox" id="wed5" name="slot_5" value ="3" data-slot="5" data-day-index="2" ></td>
                                                            <td><input type="checkbox" id="thu5" name="slot_5" value ="4" data-slot="5" data-day-index="3" ></td>
                                                            <td><input type="checkbox" id="fri5" name="slot_5" value ="5" data-slot="5" data-day-index="4" ></td>
                                                            <td><input type="checkbox" id="sat5" name="slot_5" value ="6" data-slot="5" data-day-index="5" ></td>
                                                            <td><input type="checkbox" id="sun5" name="slot_5" value ="7" data-slot="5" data-day-index="6" ></td>
                                                        </tr>
                                                        
                                                    </tbody>

                                                </table>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-8 mt-4">   
                                            <div class="row">
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

    </body>

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/admin/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:33:02 GMT -->
</html>



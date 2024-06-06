<%-- 
    Document   : list-schedule
    Created on : Jun 6, 2024, 12:30:04 AM
    Author     : asus
--%>

<%-- 
    Document   : index
    Created on : Jun 6, 2024, 12:23:43 AM
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

                            <div class="card card-table">

                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-center mb-0">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Mentor Name</th>
                                                    <th>Month</th>

                                                    <th>Booking Time</th>

                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${accounts}" var="a" varStatus="stat">
                                                    <tr>

                                                        <td>${stat.count}</td>


                                                        <td>${a.getFullname()}</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${a.getSchedules()[0].getMonth() eq 1}">
                                                                    January
                                                                </c:when>
                                                                <c:when test="${a.getSchedules()[0].getMonth() eq 2}">
                                                                    February
                                                                </c:when>
                                                                <c:when test="${a.getSchedules()[0].getMonth() eq 3}">
                                                                    March
                                                                </c:when>
                                                                <c:when test="${a.getSchedules()[0].getMonth() eq 4}">
                                                                    April
                                                                </c:when>
                                                                <c:when test="${a.getSchedules()[0].getMonth() eq 5}">
                                                                    May
                                                                </c:when>
                                                                <c:when test="${a.getSchedules()[0].getMonth() eq 6}">
                                                                    June
                                                                </c:when>
                                                                <c:when test="${a.getSchedules()[0].getMonth() eq 7}">
                                                                    July
                                                                </c:when>
                                                                <c:when test="${a.getSchedules()[0].getMonth() eq 8}">
                                                                    August
                                                                </c:when>
                                                                <c:when test="${a.getSchedules()[0].getMonth() eq 9}">
                                                                    September
                                                                </c:when>
                                                                <c:when test="${a.getSchedules()[0].getMonth() eq 10}">
                                                                    October
                                                                </c:when>
                                                                <c:when test="${a.getSchedules()[0].getMonth() eq 11}">
                                                                    November
                                                                </c:when>
                                                                <c:when test="${a.getSchedules()[0].getMonth() eq 12}">
                                                                    December
                                                                </c:when>
                                                            </c:choose>
                                                        
                                                        </td>


                                                        <td>
                                                            <c:forEach items="${a.getSchedules()}" var="schedule">
                                                                <c:choose>
                                                                    <c:when test="${schedule.getDayOfWeek() eq 2}">
                                                                        Monday
                                                                    </c:when>
                                                                    <c:when test="${schedule.getDayOfWeek() eq 3}">
                                                                        Tuesday
                                                                    </c:when>
                                                                    <c:when test="${schedule.getDayOfWeek() eq 4}">
                                                                        Wednesday
                                                                    </c:when>
                                                                    <c:when test="${schedule.getDayOfWeek() eq 5}">
                                                                        Thursday
                                                                    </c:when>
                                                                    <c:when test="${schedule.getDayOfWeek() eq 6}">
                                                                        Friday
                                                                    </c:when>
                                                                </c:choose>
                                                                <span class="text-primary d-block">${schedule.getStartTime()} - ${schedule.getEndTime()}</span>
                                                            </c:forEach>
                                                             
                                                             
                                                        </td>


                                                        <td>
                                                            <button type="submit" class="btn btn-outline-success" onclick="window.location.href = 'manage_schedule?action=accept'">Accept</button>
                                                            <button type="button" class="btn btn-outline-danger" onclick="window.location.href = 'manage_schedule?action=reject'">Reject</button>
                                                        </td>


                                                    </tr>
                                                </c:forEach>





                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>


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


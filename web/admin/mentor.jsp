<%-- 
    Document   : mentor
    Created on : Jun 5, 2024, 8:59:08 AM
    Author     : catmi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Mentoring - Mentor List Page</title>
        
        <link rel="shortcut icon" type="image/x-icon" href="admin/assets/img/favicon.png">

        <link rel="stylesheet" href="admin/assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="admin/assets/css/font-awesome.min.css">

        <link rel="stylesheet" href="admin/assets/css/feathericon.min.css">

        <link rel="stylesheet" href="admin/assets/plugins/datatables/datatables.min.css">

        <link rel="stylesheet" href="admin/assets/css/style.css">
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

            <jsp:include page="admin-header.jsp"></jsp:include>

            <jsp:include page="admin-sidebar.jsp"></jsp:include>


                <div class="page-wrapper">
                    <div class="content container-fluid">

                        <div class="page-header">
                            <div class="row">
                                <div class="col-sm-12">
                                    <h3 class="page-title">List of Mentor</h3>
                                    <div class="row">
                                        <form action="admin-mentorlist" method="post">
                                            <input type="hidden" name="service" value="search">
                                            <div class="col-sm-6 d-flex">
                                                <input id="searchbox-mentorlist" class="p-1 rounded-2" type="search" name="txtSearch" 
                                                       placeholder="Search in here..." value="${txtSearch}">
                                            <button class="btn btn-success" type="submit"><i class="fa fa-search"></i></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="datatable table table-hover table-center mb-0 text-center">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>ID</th>
                                                    <th>Full Name</th>
                                                    <th>Username</th>
                                                    <th>Number of Request</th>
                                                    <th>Rating</th>
                                                    <th>Account Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${mentors}" var="mentor" varStatus="count">
                                                    <tr>
                                                        <td>${count.index+1}</td>
                                                        <td>${mentor.id}</td>
                                                        <td>${mentor.fullname}</td>
                                                        <td>${mentor.username}</td>
                                                        <td>${mentor.numOfReq}</td>
                                                        <td>${mentor.rating}/5</td>
                                                        <td>
                                                            <form action="admin-mentorlist?service=setStatus&id=${mentor.id}&status=${mentor.status}" method="post">
                                                                <button class="btn btn-outline-danger" type="submit">
                                                                    <c:if test="${mentor.status == 1}">
                                                                        Active
                                                                    </c:if>
                                                                    <c:if test="${mentor.status == 0}">
                                                                        Inactive
                                                                    </c:if>
                                                                </button>
                                                            </form>
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


        <script src="admin/assets/js/jquery-3.6.0.min.js"></script>

        <script src="admin/assets/js/bootstrap.bundle.min.js"></script>

        <script src="admin/assets/js/feather.min.js"></script>

        <script src="admin/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

        <script src="admin/assets/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="admin/assets/plugins/datatables/datatables.min.js"></script>

        <script src="admin/assets/js/script.js"></script>
        
    </body>
</html>

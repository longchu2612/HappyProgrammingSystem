<%-- 
    Document   : profile_mentor
    Created on : May 23, 2024, 6:20:31 PM
    Author     : luutu
--%>

<%-- 
    Document   : profile-mentee
    Created on : May 21, 2024, 1:04:06 PM
    Author     : luutu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="model.Account"%>
<%@page import="dao.AccountDAO"%>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/profile-mentee.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:09 GMT -->
    <head>
        <meta charset="utf-8">
        <title>Mentoring</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body>

        <div class="main-wrapper">

            <header class="header">
                <div class="header-fixed">
                    <nav class="navbar navbar-expand-lg header-nav">
                        <div class="navbar-header">
                            <a id="mobile_btn" href="javascript:void(0);">
                                <span class="bar-icon">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </span>
                            </a>
                            <a href="index-five.jsp" class="navbar-brand logo">
                                <img src="assets/img/logo-6.png" class="img-fluid" alt="Logo">
                            </a>
                        </div>
                        <div class="main-menu-wrapper">
                            <div class="menu-header">
                                <a href="index.html" class="menu-logo">
                                    <img src="assets/img/logo.png" class="img-fluid" alt="Logo">
                                </a>
                                <a id="menu_close" class="menu-close" href="javascript:void(0);">
                                    <i class="fas fa-times"></i>
                                </a>
                            </div>
                            <ul class="main-nav">
                                <li>
                                    <a href="index-five.jsp">Home <i class="fas fa-chevron-down"></i></a>
                                </li>
                                <li class="has-submenu active">
                                    <a href>Mentor <i class="fas fa-chevron-down"></i></a>
                                    <ul class="submenu">
                                        <li><a href="dashboard.html">Mentor Dashboard</a></li>
                                        <li><a href="bookings.html">Bookings</a></li>
                                        <li><a href="schedule-timings.html">Schedule Timing</a></li>
                                        <li><a href="mentee-list.html">Mentee List</a></li>
                                        <li class="active"><a href="profile-mentee.html">Mentee Profile</a></li>
                                        <li class="has-submenu">
                                            <a href="blog.html">Blog</a>
                                            <ul class="submenu">
                                                <li><a href="blog.html">Blog</a></li>
                                                <li><a href="blog-details.html">Blog View</a></li>
                                                <li><a href="add-blog.html">Add Blog</a></li>
                                                <li><a href="edit-blog.html">Edit Blog</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="chat.html">Chat</a></li>
                                        <li><a href="invoices.html">Invoices</a></li>
                                        <li><a href="profile-settings.html">Profile Settings</a></li>
                                        <li><a href="reviews.html">Reviews</a></li>
                                        <li><a href="mentor-register.html">Mentor Register</a></li>
                                    </ul>
                                </li>
                                <li class="has-submenu">
                                    <a href>Mentee <i class="fas fa-chevron-down"></i></a>
                                    <ul class="submenu">
                                        <li class="has-submenu">
                                            <a href="#">Mentors</a>
                                            <ul class="submenu">
                                                <li><a href="map-grid.html">Map Grid</a></li>
                                                <li><a href="map-list.html">Map List</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="search.html">Search Mentor</a></li>
                                        <li><a href="profile.html">Mentor Profile</a></li>
                                        <li><a href="bookings-mentee.html">Bookings</a></li>
                                        <li><a href="checkout.html">Checkout</a></li>
                                        <li><a href="booking-success.html">Booking Success</a></li>
                                        <li><a href="dashboard-mentee.html">Mentee Dashboard</a></li>
                                        <li><a href="favourites.html">Favourites</a></li>
                                        <li><a href="chat-mentee.html">Chat</a></li>
                                        <li><a href="profile-settings-mentee.html">Profile Settings</a></li>
                                        <li><a href="change-password.html">Change Password</a></li>
                                    </ul>
                                </li>
                                <li class="has-submenu">
                                    <a href>Pages <i class="fas fa-chevron-down"></i></a>
                                    <ul class="submenu">
                                        <li><a href="voice-call.html">Voice Call</a></li>
                                        <li><a href="video-call.html">Video Call</a></li>
                                        <li><a href="search.html">Search Mentors</a></li>
                                        <li><a href="components.html">Components</a></li>
                                        <li class="has-submenu">
                                            <a href="invoices.html">Invoices</a>
                                            <ul class="submenu">
                                                <li><a href="invoices.html">Invoices</a></li>
                                                <li><a href="invoice-view.html">Invoice View</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="blank-page.html">Starter Page</a></li>
                                        <li><a href="login.html">Login</a></li>
                                        <li><a href="register.html">Register</a></li>
                                        <li><a href="forgot-password.html">Forgot Password</a></li>
                                    </ul>
                                </li>
                                <li class="has-submenu">
                                    <a href>Blog <i class="fas fa-chevron-down"></i></a>
                                    <ul class="submenu">
                                        <li><a href="blog-list.html">Blog List</a></li>
                                        <li><a href="blog-grid.html">Blog Grid</a></li>
                                        <li><a href="blog-details.html">Blog Details</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="admin/index.html" target="_blank">Admin</a>
                                </li>
                                <li class="login-link">
                                    <a href="login.html">Login / Signup</a>
                                </li>
                            </ul>
                        </div>
                        <ul class="nav header-navbar-rht">

                            <li class="nav-item dropdown has-arrow logged-item">
                                <a href="#" class="dropdown-toggle nav-link" data-bs-toggle="dropdown">
                                    <span class="user-img">
                                        <img class="rounded-circle" src="assets/img/user/user.jpg" width="31" alt="Darren Elder">
                                    </span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-end">
                                    <div class="user-header">
                                        <div class="avatar avatar-sm">
                                            <img src="assets/img/user/user.jpg" alt="User Image" class="avatar-img rounded-circle">
                                        </div>
                                        <div class="user-text">
                                            <h6>Jonathan Doe</h6>
                                        </div>
                                    </div>
                                    <a class="dropdown-item" href="dashboard.html">Dashboard</a>
                                    <a class="dropdown-item" href="profile-setting.jsp?id=${mentor.account_id}">Profile Settings</a>
                                    <a class="dropdown-item" href="login.html">Logout</a>
                                </div>
                            </li>

                        </ul>
                    </nav>
                </div>
            </header>


            <div class="breadcrumb-bar">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-12 col-12">
                            <nav aria-label="breadcrumb" class="page-breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Mentor Profile</li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">Mentor Profile</h2>
                        </div>
                    </div>
                </div>
            </div>


            <div class="content">
                <div class="container">

                    <div class="card col-10 me-auto ms-auto p-0">
                        <div class="card-body">
                            <div class="mentor-widget">
                                <div class="user-info-left align-items-center">
                                    <div class="mentor-img d-flex flex-wrap justify-content-center">
                                        <div class="pro-avatar">JD</div>
                                        <div class="rating">
                                            <!-- Loop to display filled stars -->
                                            <c:forEach var="i" begin="1" end="${mentor.rating_star}">
                                                <i class="fas fa-star filled"></i>
                                            </c:forEach>
                                            <!-- Loop to display empty stars -->
                                            <c:forEach var="i" begin="${mentor.rating_star + 1}" end="5">
                                                <i class="fas fa-star"></i>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="user-info-cont">
                                        <h4 class="usr-name">${mentor.fullname}</h4>
                                        <p class="mentor-type">English Literature (M.A)</p>
                                        <div class="mentor-action">
                                            <p class="mentor-type social-title">Contact Me</p>
                                            <a href="javascript:void(0)" class="btn-blue">
                                                <i class="fas fa-comments"></i>
                                            </a>
                                            <a href="chat.html" class="btn-blue">
                                                <i class="fas fa-envelope"></i>
                                            </a>
                                            <a href="javascript:void(0)" class="btn-blue" data-toggle="modal" data-target="#voice_call">
                                                <i class="fas fa-phone-alt"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="user-info-right d-flex align-items-end flex-wrap">
                                    <div class="hireme-btn text-center">
                                        <span class="hire-rate">$500 / Hour</span>
                                        <a class="blue-btn-radius" href="booking.html">Hire Me</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card col-10 me-auto ms-auto p-0">
                        <div class="card-body custom-border-card pb-0">

                            <div class="widget about-widget custom-about mb-0">
                                <h4 class="widget-title">About Me</h4>
                                <hr/>
                                <p>${mentor.introduction}</p>
                            </div>

                        </div>
                    </div>

                    <div class="card col-10 me-auto ms-auto p-0">
                        <div class="card-body custom-border-card pb-0">

                            <div class="widget education-widget mb-0">
                                <h4 class="widget-title">Account Details</h4>
                                <hr/>
                                <div class="experience-box">
                                    <ul class="experience-list profile-custom-list">
                                        <li>
                                            <div class="experience-content">
                                                <div class="timeline-content">
                                                    <span>Account name</span>
                                                    <div class="row-result">${mentor.account_name}</div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="experience-content">
                                                <div class="timeline-content">
                                                    <span>Mobile</span>
                                                    <div class="row-result">${mentor.phone}</div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="experience-content">
                                                <div class="timeline-content">
                                                    <span>Email</span>
                                                    <div class="row-result">${mentor.email}</div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="experience-content">
                                                <div class="timeline-content">
                                                    <span>Balance</span>
                                                    <div class="row-result" style=" color: #1879cd ">${mentor.balance}</div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="card col-10 me-auto ms-auto p-0">
                        <div class="card-body custom-border-card pb-0">

                            <div class="widget education-widget mb-0">
                                <h4 class="widget-title">Personal Details</h4>
                                <hr/>
                                <div class="experience-box">
                                    <ul class="experience-list profile-custom-list">
                                        <li>
                                            <div class="experience-content">
                                                <div class="timeline-content">
                                                    <span>Gender</span>
                                                    <div class="row-result">${mentor.sex == true ? "Male" : "Female"}</div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="experience-content">
                                                <div class="timeline-content">
                                                    <span>Date of Birth</span>
                                                    <div class="row-result">${mentor.dateOfBirth}</div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="experience-content">
                                                <div class="timeline-content">
                                                    <span>Location</span>
                                                    <div class="row-result">${mentor.address}</div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
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
                                                    <a href="https://mentoring.dreamguystech.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="6b060e051f041902050c2b0e130a061b070e45080406">[email&#160;protected]</a>
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


                <div class="modal fade call-modal" id="voice_call">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-body">

                                <div class="call-box incoming-box">
                                    <div class="call-wrapper">
                                        <div class="call-inner">
                                            <div class="call-user">
                                                <img alt="User Image" src="assets/img/user/user.jpg" class="call-avatar">
                                                <h4>Jonathan Doe</h4>
                                                <span>Connecting...</span>
                                            </div>
                                            <div class="call-items">
                                                <a href="javascript:void(0);" class="btn call-item call-end" data-dismiss="modal" aria-label="Close"><i class="material-icons">call_end</i></a>
                                                <a href="voice-call.html" class="btn call-item call-start"><i class="material-icons">call</i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>


                <div class="modal fade call-modal" id="video_call">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-body">

                                <div class="call-box incoming-box">
                                    <div class="call-wrapper">
                                        <div class="call-inner">
                                            <div class="call-user">
                                                <img class="call-avatar" src="assets/img/user/user.jpg" alt="User Image">
                                                <h4>Dr. Darren Elder</h4>
                                                <span>Calling ...</span>
                                            </div>
                                            <div class="call-items">
                                                <a href="javascript:void(0);" class="btn call-item call-end" data-dismiss="modal" aria-label="Close"><i class="material-icons">call_end</i></a>
                                                <a href="video-call.html" class="btn call-item call-start"><i class="material-icons">videocam</i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>


                <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="assets/js/jquery-3.6.0.min.js"></script>

                <script src="assets/js/bootstrap.bundle.min.js"></script>

                <script src="assets/js/script.js"></script>
                </body>

                <!-- Mirrored from mentoring.dreamguystech.com/html/template/profile-mentee.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:09 GMT -->
                </html>
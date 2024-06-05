<%-- 
    Document   : schedule-timings
    Created on : Jun 3, 2024, 10:10:19 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/schedule-timings.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:08 GMT -->
    <head>
        <meta charset="utf-8">
        <title>Mentoring</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css">

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
                            <a href="index.html" class="navbar-brand logo">
                                <img src="assets/img/logo.png" class="img-fluid" alt="Logo">
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
                                <li class="has-submenu">
                                    <a href="index.html">Home <i class="fas fa-chevron-down"></i></a>
                                    <ul class="submenu">
                                        <li><a href="index.html">Home</a></li>
                                        <li><a href="index-two.html">Home 2</a></li>
                                        <li><a href="index-three.html">Home 3</a></li>
                                        <li><a href="index-four.html">Home 4</a></li>
                                        <li><a href="index-five.html">Home 5</a></li>
                                        <li><a href="index-six.html">Home 6</a></li>
                                        <li><a href="index-seven.html">Home 7</a></li>
                                    </ul>
                                </li>
                                <li class="has-submenu active">
                                    <a href>Mentor <i class="fas fa-chevron-down"></i></a>
                                    <ul class="submenu">
                                        <li><a href="dashboard.html">Mentor Dashboard</a></li>
                                        <li><a href="bookings.html">Bookings</a></li>
                                        <li class="active"><a href="schedule-timings.html">Schedule Timing</a></li>
                                        <li><a href="mentee-list.html">Mentee List</a></li>
                                        <li><a href="profile-mentee.html">Mentee Profile</a></li>
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
                                            <p class="text-muted mb-0">Mentor</p>
                                        </div>
                                    </div>
                                    <a class="dropdown-item" href="dashboard.html">Dashboard</a>
                                    <a class="dropdown-item" href="profile-settings.html">Profile Settings</a>
                                    <a class="dropdown-item" href="login.html">Logout</a>
                                </div>
                            </li>

                        </ul>
                    </nav>
                </div>
            
             <jsp:include page="layout_header.jsp"/>

            <div class="breadcrumb-bar">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-12 col-12">
                            <nav aria-label="breadcrumb" class="page-breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Schedule Timings</li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">Schedule Timings</h2>
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
                                        <li><a href="schedule-timings.html" class="active"><i class="fas fa-hourglass-start"></i>Schedule Timings <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="chat.html"><i class="fas fa-comments"></i>Messages <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="invoices.html"><i class="fas fa-file-invoice"></i>Invoices <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="reviews.html"><i class="fas fa-eye"></i>Reviews <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="blog.html"><i class="fab fa-blogger-b"></i>Blog <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="profile.html"><i class="fas fa-user-cog"></i>Profile <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="login.html"><i class="fas fa-sign-out-alt"></i>Logout <span><i class="fas fa-chevron-right"></i></span></a></li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                        <div class="col-md-7 col-lg-8 col-xl-9">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="card-title">Schedule Timings</h4>
                                            <div class="profile-box">
                                                <div class="row">
                                                    <div class="col-lg-4">
                                                        <div class="form-group">
                                                            <label>Timing Slot Duration</label>
                                                            <select class="select form-control">
                                                                <option>Select</option>
                                                                <option>15 mins</option>
                                                                <option selected="selected">30 mins</option>
                                                                <option>45 mins</option>
                                                                <option>1 Hour</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="card schedule-widget mb-0">

                                                            <div class="schedule-header">

                                                                <div class="schedule-nav">
                                                                    <ul class="nav nav-tabs nav-justified">
                                                                        <li class="nav-item">
                                                                            <a class="nav-link" data-bs-toggle="tab" href="#slot_sunday">Sunday</a>
                                                                        </li>
                                                                        <li class="nav-item">
                                                                            <a class="nav-link active" data-bs-toggle="tab" href="#slot_monday">Monday</a>
                                                                        </li>
                                                                        <li class="nav-item">
                                                                            <a class="nav-link" data-bs-toggle="tab" href="#slot_tuesday">Tuesday</a>
                                                                        </li>
                                                                        <li class="nav-item">
                                                                            <a class="nav-link" data-bs-toggle="tab" href="#slot_wednesday">Wednesday</a>
                                                                        </li>
                                                                        <li class="nav-item">
                                                                            <a class="nav-link" data-bs-toggle="tab" href="#slot_thursday">Thursday</a>
                                                                        </li>
                                                                        <li class="nav-item">
                                                                            <a class="nav-link" data-bs-toggle="tab" href="#slot_friday">Friday</a>
                                                                        </li>
                                                                        <li class="nav-item">
                                                                            <a class="nav-link" data-bs-toggle="tab" href="#slot_saturday">Saturday</a>
                                                                        </li>
                                                                    </ul>
                                                                </div>

                                                            </div>


                                                            <div class="tab-content schedule-cont">

                                                                <div id="slot_sunday" class="tab-pane fade">
                                                                    <h4 class="card-title d-flex justify-content-between">
                                                                        <span>Time Slots</span>
                                                                        <a class="edit-link" data-bs-toggle="modal" href="#add_time_slot"><i class="fa fa-plus-circle"></i> Add Slot</a>
                                                                    </h4>
                                                                    <p class="text-muted mb-0">Not Available</p>
                                                                </div>


                                                                <div id="slot_monday" class="tab-pane fade show active">
                                                                    <h4 class="card-title d-flex justify-content-between">
                                                                        <span>Time Slots</span>
                                                                        <a class="edit-link" data-bs-toggle="modal" href="#edit_time_slot"><i class="fa fa-edit me-1"></i>Edit</a>
                                                                    </h4>

                                                                    <div class="user-times">
                                                                        <div class="user-slot-list">
                                                                            8:00 pm - 11:30 pm
                                                                            <a href="javascript:void(0)" class="delete_schedule">
                                                                                <i class="fa fa-times"></i>
                                                                            </a>
                                                                        </div>
                                                                        <div class="user-slot-list">
                                                                            11:30 pm - 1:30 pm
                                                                            <a href="javascript:void(0)" class="delete_schedule">
                                                                                <i class="fa fa-times"></i>
                                                                            </a>
                                                                        </div>
                                                                        <div class="user-slot-list">
                                                                            3:00 pm - 5:00 pm
                                                                            <a href="javascript:void(0)" class="delete_schedule">
                                                                                <i class="fa fa-times"></i>
                                                                            </a>
                                                                        </div>
                                                                        <div class="user-slot-list">
                                                                            6:00 pm - 11:00 pm
                                                                            <a href="javascript:void(0)" class="delete_schedule">
                                                                                <i class="fa fa-times"></i>
                                                                            </a>
                                                                        </div>
                                                                    </div>

                                                                </div>


                                                                <div id="slot_tuesday" class="tab-pane fade">
                                                                    <h4 class="card-title d-flex justify-content-between">
                                                                        <span>Time Slots</span>
                                                                        <a class="edit-link" data-bs-toggle="modal" href="#add_time_slot"><i class="fa fa-plus-circle"></i> Add Slot</a>
                                                                    </h4>
                                                                    <p class="text-muted mb-0">Not Available</p>
                                                                </div>


                                                                <div id="slot_wednesday" class="tab-pane fade">
                                                                    <h4 class="card-title d-flex justify-content-between">
                                                                        <span>Time Slots</span>
                                                                        <a class="edit-link" data-bs-toggle="modal" href="#add_time_slot"><i class="fa fa-plus-circle"></i> Add Slot</a>
                                                                    </h4>
                                                                    <p class="text-muted mb-0">Not Available</p>
                                                                </div>


                                                                <div id="slot_thursday" class="tab-pane fade">
                                                                    <h4 class="card-title d-flex justify-content-between">
                                                                        <span>Time Slots</span>
                                                                        <a class="edit-link" data-bs-toggle="modal" href="#add_time_slot"><i class="fa fa-plus-circle"></i> Add Slot</a>
                                                                    </h4>
                                                                    <p class="text-muted mb-0">Not Available</p>
                                                                </div>


                                                                <div id="slot_friday" class="tab-pane fade">
                                                                    <h4 class="card-title d-flex justify-content-between">
                                                                        <span>Time Slots</span>
                                                                        <a class="edit-link" data-bs-toggle="modal" href="#add_time_slot"><i class="fa fa-plus-circle"></i> Add Slot</a>
                                                                    </h4>
                                                                    <p class="text-muted mb-0">Not Available</p>
                                                                </div>


                                                                <div id="slot_saturday" class="tab-pane fade">
                                                                    <h4 class="card-title d-flex justify-content-between">
                                                                        <span>Time Slots</span>
                                                                        <a class="edit-link" data-bs-toggle="modal" href="#add_time_slot"><i class="fa fa-plus-circle"></i> Add Slot</a>
                                                                    </h4>
                                                                    <p class="text-muted mb-0">Not Available</p>
                                                                </div>

                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
                                            <a href="https://mentoring.dreamguystech.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="7f121a110b100d1611183f1a071e120f131a511c1012">[email&#160;protected]</a>
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


        <div class="modal fade custom-modal" id="add_time_slot">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add Time Slots</h5>
                        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="hours-info">
                                <div class="row form-row hours-cont">
                                    <div class="col-12 col-md-10">
                                        <div class="row form-row">
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Start Time</label>
                                                    <select class="form-control form-select">
                                                        <option>Select</option>
                                                        <option>12.00 am</option>
                                                        <option>1.00 am</option>
                                                        <option>2.00 am</option>
                                                        <option>3.00 am</option>
                                                        <option>4.00 am</option>
                                                        <option>5.00 am</option>
                                                        <option>6.00 am</option>
                                                        <option>7.00 am</option>
                                                        <option>8.00 am</option>
                                                        <option>9.00 am</option>
                                                        <option>10.00 am</option>
                                                        <option>11.00 am</option>
                                                        <option>12.00 pm</option>
                                                        <option>1.00 pm</option>
                                                        <option>2.00 pm</option>
                                                        <option>3.00 pm</option>
                                                        <option>4.00 pm</option>
                                                        <option>5.00 pm</option>
                                                        <option>6.00 pm</option>
                                                        <option>7.00 pm</option>
                                                        <option>8.00 pm</option>
                                                        <option>9.00 pm</option>
                                                        <option>10.00 pm</option>
                                                        <option>11.00 pm</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>End Time</label>
                                                    <select class="form-control form-select">
                                                        <option>Select</option>
                                                        <option>12.00 am</option>
                                                        <option>1.00 am</option>
                                                        <option>2.00 am</option>
                                                        <option>3.00 am</option>
                                                        <option>4.00 am</option>
                                                        <option>5.00 am</option>
                                                        <option>6.00 am</option>
                                                        <option>7.00 am</option>
                                                        <option>8.00 am</option>
                                                        <option>9.00 am</option>
                                                        <option>10.00 am</option>
                                                        <option>11.00 am</option>
                                                        <option>12.00 pm</option>
                                                        <option>1.00 pm</option>
                                                        <option>2.00 pm</option>
                                                        <option>3.00 pm</option>
                                                        <option>4.00 pm</option>
                                                        <option>5.00 pm</option>
                                                        <option>6.00 pm</option>
                                                        <option>7.00 pm</option>
                                                        <option>8.00 pm</option>
                                                        <option>9.00 pm</option>
                                                        <option>10.00 pm</option>
                                                        <option>11.00 pm</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="add-more mb-3">
                                <a href="javascript:void(0);" class="add-hours"><i class="fa fa-plus-circle"></i> Add More</a>
                            </div>
                            <div class="submit-section text-center">
                                <button type="submit" class="btn btn-primary submit-btn">Save Changes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade custom-modal" id="edit_time_slot">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Time Slots</h5>
                        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="hours-info">
                                <div class="row form-row hours-cont">
                                    <div class="col-12 col-md-10">
                                        <div class="row form-row">
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Start Time</label>
                                                    <select class="form-control form-select">
                                                        <option>Select</option>
                                                        <option>12.00 am</option>
                                                        <option>1.00 am</option>
                                                        <option>2.00 am</option>
                                                        <option>3.00 am</option>
                                                        <option>4.00 am</option>
                                                        <option>5.00 am</option>
                                                        <option>6.00 am</option>
                                                        <option>7.00 am</option>
                                                        <option>8.00 am</option>
                                                        <option>9.00 am</option>
                                                        <option>10.00 am</option>
                                                        <option>11.00 am</option>
                                                        <option>12.00 pm</option>
                                                        <option>1.00 pm</option>
                                                        <option>2.00 pm</option>
                                                        <option>3.00 pm</option>
                                                        <option>4.00 pm</option>
                                                        <option>5.00 pm</option>
                                                        <option>6.00 pm</option>
                                                        <option>7.00 pm</option>
                                                        <option>8.00 pm</option>
                                                        <option>9.00 pm</option>
                                                        <option>10.00 pm</option>
                                                        <option>11.00 pm</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>End Time</label>
                                                    <select class="form-control form-select">
                                                        <option>Select</option>
                                                        <option>12.00 am</option>
                                                        <option>1.00 am</option>
                                                        <option>2.00 am</option>
                                                        <option>3.00 am</option>
                                                        <option>4.00 am</option>
                                                        <option>5.00 am</option>
                                                        <option>6.00 am</option>
                                                        <option>7.00 am</option>
                                                        <option>8.00 am</option>
                                                        <option>9.00 am</option>
                                                        <option>10.00 am</option>
                                                        <option>11.00 am</option>
                                                        <option>12.00 pm</option>
                                                        <option>1.00 pm</option>
                                                        <option>2.00 pm</option>
                                                        <option>3.00 pm</option>
                                                        <option>4.00 pm</option>
                                                        <option>5.00 pm</option>
                                                        <option>6.00 pm</option>
                                                        <option>7.00 pm</option>
                                                        <option>8.00 pm</option>
                                                        <option>9.00 pm</option>
                                                        <option>10.00 pm</option>
                                                        <option>11.00 pm</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row form-row hours-cont">
                                    <div class="col-12 col-md-10">
                                        <div class="row form-row">
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Start Time</label>
                                                    <select class="form-control form-select">
                                                        <option>Select</option>
                                                        <option>12.00 am</option>
                                                        <option>1.00 am</option>
                                                        <option>2.00 am</option>
                                                        <option>3.00 am</option>
                                                        <option>4.00 am</option>
                                                        <option>5.00 am</option>
                                                        <option>6.00 am</option>
                                                        <option>7.00 am</option>
                                                        <option>8.00 am</option>
                                                        <option>9.00 am</option>
                                                        <option>10.00 am</option>
                                                        <option>11.00 am</option>
                                                        <option>12.00 pm</option>
                                                        <option>1.00 pm</option>
                                                        <option>2.00 pm</option>
                                                        <option>3.00 pm</option>
                                                        <option>4.00 pm</option>
                                                        <option>5.00 pm</option>
                                                        <option>6.00 pm</option>
                                                        <option>7.00 pm</option>
                                                        <option>8.00 pm</option>
                                                        <option>9.00 pm</option>
                                                        <option>10.00 pm</option>
                                                        <option>11.00 pm</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>End Time</label>
                                                    <select class="form-control form-select">
                                                        <option>Select</option>
                                                        <option>12.00 am</option>
                                                        <option>1.00 am</option>
                                                        <option>2.00 am</option>
                                                        <option>3.00 am</option>
                                                        <option>4.00 am</option>
                                                        <option>5.00 am</option>
                                                        <option>6.00 am</option>
                                                        <option>7.00 am</option>
                                                        <option>8.00 am</option>
                                                        <option>9.00 am</option>
                                                        <option>10.00 am</option>
                                                        <option>11.00 am</option>
                                                        <option>12.00 pm</option>
                                                        <option>1.00 pm</option>
                                                        <option>2.00 pm</option>
                                                        <option>3.00 pm</option>
                                                        <option>4.00 pm</option>
                                                        <option>5.00 pm</option>
                                                        <option>6.00 pm</option>
                                                        <option>7.00 pm</option>
                                                        <option>8.00 pm</option>
                                                        <option>9.00 pm</option>
                                                        <option>10.00 pm</option>
                                                        <option>11.00 pm</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-2"><label class="d-md-block d-sm-none d-none">&nbsp;</label><a href="#" class="btn btn-danger trash"><i class="far fa-trash-alt"></i></a></div>
                                </div>
                                <div class="row form-row hours-cont">
                                    <div class="col-12 col-md-10">
                                        <div class="row form-row">
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Start Time</label>
                                                    <select class="form-control form-select">
                                                        <option>Select</option>
                                                        <option>12.00 am</option>
                                                        <option>1.00 am</option>
                                                        <option>2.00 am</option>
                                                        <option>3.00 am</option>
                                                        <option>4.00 am</option>
                                                        <option>5.00 am</option>
                                                        <option>6.00 am</option>
                                                        <option>7.00 am</option>
                                                        <option>8.00 am</option>
                                                        <option>9.00 am</option>
                                                        <option>10.00 am</option>
                                                        <option>11.00 am</option>
                                                        <option>12.00 pm</option>
                                                        <option>1.00 pm</option>
                                                        <option>2.00 pm</option>
                                                        <option>3.00 pm</option>
                                                        <option>4.00 pm</option>
                                                        <option>5.00 pm</option>
                                                        <option>6.00 pm</option>
                                                        <option>7.00 pm</option>
                                                        <option>8.00 pm</option>
                                                        <option>9.00 pm</option>
                                                        <option>10.00 pm</option>
                                                        <option>11.00 pm</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>End Time</label>
                                                    <select class="form-control form-select">
                                                        <option>Select</option>
                                                        <option>12.00 am</option>
                                                        <option>1.00 am</option>
                                                        <option>2.00 am</option>
                                                        <option>3.00 am</option>
                                                        <option>4.00 am</option>
                                                        <option>5.00 am</option>
                                                        <option>6.00 am</option>
                                                        <option>7.00 am</option>
                                                        <option>8.00 am</option>
                                                        <option>9.00 am</option>
                                                        <option>10.00 am</option>
                                                        <option>11.00 am</option>
                                                        <option>12.00 pm</option>
                                                        <option>1.00 pm</option>
                                                        <option>2.00 pm</option>
                                                        <option>3.00 pm</option>
                                                        <option>4.00 pm</option>
                                                        <option>5.00 pm</option>
                                                        <option>6.00 pm</option>
                                                        <option>7.00 pm</option>
                                                        <option>8.00 pm</option>
                                                        <option>9.00 pm</option>
                                                        <option>10.00 pm</option>
                                                        <option>11.00 pm</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-2"><label class="d-md-block d-sm-none d-none">&nbsp;</label><a href="#" class="btn btn-danger trash"><i class="far fa-trash-alt"></i></a></div>
                                </div>
                            </div>
                            <div class="add-more mb-3">
                                <a href="javascript:void(0);" class="add-hours"><i class="fa fa-plus-circle"></i> Add More</a>
                            </div>
                            <div class="submit-section text-center">
                                <button type="submit" class="btn btn-primary submit-btn">Save Changes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <script src="assets/plugins/select2/js/select2.min.js"></script>

        <script src="assets/js/script.js"></script>
    </body>

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/schedule-timings.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:08 GMT -->
</html>

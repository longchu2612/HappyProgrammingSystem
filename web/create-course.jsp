<%-- 
    Document   : create-course
    Created on : Jun 3, 2024, 10:34:34 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/bookings.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:08 GMT -->
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

            <!--            <header class="header">
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
                                                    <li class="active"><a href="bookings.html">Bookings</a></li>
                                                    <li><a href="schedule-timings.html">Schedule Timing</a></li>
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
                        </header>-->

            <jsp:include page="layout_header.jsp"/>
            <div class="breadcrumb-bar">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-12 col-12">
                            <nav aria-label="breadcrumb" class="page-breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">My Bookings</li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">My Bookings</h2>
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
                                        <li><a href="bookings.html" class="active"><i class="fas fa-clock"></i>Bookings <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="schedule-timings.html"><i class="fas fa-hourglass-start"></i>Schedule Timings <span><i class="fas fa-chevron-right"></i></span></a></li>
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
                            <div class="card">
                                <div class="card-body">

                                    <form id=""> 
                                    <input type="hidden" name="action" value="create"/>
                                    <div class="row form-row">
                                        <div class="col-12 col-md-12">
                                            <div class="form-group">
                                                <h4>Create Schedule</h4>
                                            </div>

                                        </div>










                                        <div class="col-12 col-md-6">

                                            <div class="form-group">

                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input" id="checkBoxMonday" onchange="toggleDates()" name="selecteDay" value="1"/> Monday

                                                </div>
                                                <div class="form-row mt-3" id="dateMonday" style="display: none;">
                                                    <div class="form-group col-md-6">
                                                        <lable>Start Date</lable>
                                                        <input type="time" id="startMonday" name="startDateMonday"  class="form-control"/>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>End Date</label>
                                                        <input type="time" id="endMonday" name="enDateMonday" class="form-control"/>
                                                        <div class="invalid-feedback">
                                                            Time cannot be empty and startdate must be less than endDate
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input" onchange="toggleDates()" id="checkBoxTuesday" name="selecteDay" value="2"/> Tuesday 
                                                </div>
                                                <div class="form-row mt-3" id="dateTuesday" style="display: none;">
                                                    <div class="form-group col-md-6">
                                                        <lable>Start Date</lable>
                                                        <input type="time" name="startDateTuesday" class="form-control"/>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>End Date</label>
                                                        <input type="time" name="endDateTuesday" class="form-control"/>
                                                    </div>
                                                </div>
                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input" onchange="toggleDates()" id="checkBoxWed" name="selecteDay" value="3"/> Wednesday 
                                                </div>

                                                <div class="form-row mt-3" id="dateWed" style="display: none;">
                                                    <div class="form-group col-md-6">
                                                        <lable>Start Date</lable>
                                                        <input type="time" name="startDateWed" class="form-control"/>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>End Date</label>
                                                        <input type="time" name="endDateWed" class="form-control"/>
                                                    </div>
                                                </div>


                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input" id="checkBoxThurs" onchange="toggleDates()" name="selecteDay" value="4"/> Thursday  
                                                </div>
                                                <div class="form-row mt-3" id="dateThurs" style="display: none;">
                                                    <div class="form-group col-md-6">
                                                        <lable>Start Date</lable>
                                                        <input type="time" name="startDateThurs" class="form-control"/>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>End Date</label>
                                                        <input type="time" name="endDateThurs" class="form-control"/>
                                                    </div>
                                                </div>

                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input" onchange="toggleDates()" id="checkBoxFriday" name="selecteDay" value="5"/> Friday 
                                                </div>
                                                <div class="form-row mt-3" id="dateFriday" style="display: none;">
                                                    <div class="form-group col-md-6">
                                                        <lable>Start Date</lable>
                                                        <input type="time" name="startDateFriday" class="form-control"/>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>End Date</label>
                                                        <input type="time" name ="endDateFriday" class="form-control"/>
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
                                                <a href="https://mentoring.dreamguystech.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="dbb6beb5afb4a9b2b5bc9bbea3bab6abb7bef5b8b4b6">[email&#160;protected]</a>
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


            <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="assets/js/jquery-3.6.0.min.js"></script>

            <script src="assets/js/bootstrap.bundle.min.js"></script>

            <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
            <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

            <script src="assets/js/script.js"></script>
            <script>
                                                        document.getElementById('createCourseForm').addEventListener('submit', function (event) {
                                                            var checkboxMonday = document.getElementById('checkBoxMonday');
                                                            var startMonday = document.getElementById('startMonday').value;
                                                            var endMonday = document.getElementById('endMonday').value;

                                                            var isValid = true;
                                                            if (checkboxMonday.checked) {
                                                                if (startMonday === '' || endMonday === '') {
                                                                    startMonday.classList.add('is-invalid');
                                                                    endMonday.classList.add('is-invalid');
                                                                    isValid = false;
                                                                } else if (startMonday >= endMonday) {
                                                                    startMonday.classList.add('is-invalid');
                                                                    endMonday.classList.add('is-invalid');
                                                                    isValid = false;
                                                                } else {
                                                                    startMonday.classList.remove('is-invalid');
                                                                    endMonday.classList.remove('is-invalid');
                                                                }
                                                            }





                                                            if (!isValid) {
                                                                event.preventDefault();
                                                            }
                                                        });
            </script>
    </body>

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/bookings.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:08 GMT -->
</html>
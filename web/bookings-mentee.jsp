<%-- 
    Document   : bookings-mentee
    Created on : May 26, 2024, 5:28:15 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/bookings-mentee.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:23 GMT -->
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
                                        <li><a href="dashboard-mentee.html"><i class="fas fa-home"></i>Dashboard <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="bookings-mentee.html" class="active"><i class="fas fa-clock"></i>Bookings <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="chat-mentee.html"><i class="fas fa-comments"></i>Messages <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="favourites.html"><i class="fas fa-star"></i>Favourites <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="profile-mentee.html"><i class="fas fa-user-cog"></i>Profile <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="login.html"><i class="fas fa-sign-out-alt"></i>Logout <span><i class="fas fa-chevron-right"></i></span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>


                        <div class="col-md-7 col-lg-8 col-xl-9">
                            <h3 class="pb-3">Booking Summary</h3>

                            <div class="tab-pane show active" id="mentee-list">
                                <div class="card card-table">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-hover table-center mb-0">
                                                <thead>
                                                    <tr>
                                                        <th>MENTEE LISTS</th>
                                                        <th>SCHEDULED DATE</th>
                                                        <th class="text-center">SCHEDULED TIMINGS</th>
                                                        <th class="text-center">ACTION</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <h2 class="table-avatar">
                                                                <a href="profile.html" class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="assets/img/user/user2.jpg" alt="User Image"></a>
                                                                <a href="profile.html">Tyrone Roberts<span><span class="__cf_email__" data-cfemail="f5818c879a9b90879a9790878186b594919a9790db969a98">[email&#160;protected]</span></span></a>
                                                            </h2>
                                                        </td>
                                                        <td>08 April 2020</td>
                                                        <td class="text-center"><span class="pending">9:00 AM - 10:00 AM</span></td>
                                                        <td class="text-center"><a href="profile-mentee.html" class="btn btn-sm bg-info-light"><i class="far fa-eye"></i> View</a></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <h2 class="table-avatar">
                                                                <a href="profile.html" class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="assets/img/user/user1.jpg" alt="User Image"></a>
                                                                <a href="profile.html">Julie Pennington <span><span class="__cf_email__" data-cfemail="8be1fee7e2eecbeaefe4e9eea5e8e4e6">[email&#160;protected]</span></span></a>
                                                            </h2>
                                                        </td>
                                                        <td>08 April 2020</td>
                                                        <td class="text-center"><span class="pending">9:00 AM - 10:00 AM</span></td>
                                                        <td class="text-center"><a href="profile-mentee.html" class="btn btn-sm bg-info-light"><i class="far fa-eye"></i> View</a></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <h2 class="table-avatar">
                                                                <a href="profile.html" class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="assets/img/user/user3.jpg" alt="User Image"></a>
                                                                <a href="profile.html">Allen Davis <span><span class="__cf_email__" data-cfemail="06676a6a63686267706f754667626964632865696b">[email&#160;protected]</span></span></a>
                                                            </h2>
                                                        </td>
                                                        <td>07 April 2020</td>
                                                        <td class="text-center"><span class="pending">9:00 AM - 10:00 AM</span></td>
                                                        <td class="text-center"><a href="profile-mentee.html" class="btn btn-sm bg-info-light"><i class="far fa-eye"></i> View</a></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <h2 class="table-avatar">
                                                                <a href="profile.html" class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="assets/img/user/user4.jpg" alt="User Image"></a>
                                                                <a href="profile.html">Patricia Manzi <span><span class="__cf_email__" data-cfemail="cdbdacb9bfa4aea4aca0aca3b7a48daca9a2afa8e3aea2a0">[email&#160;protected]</span></span></a>
                                                            </h2>
                                                        </td>
                                                        <td>07 April 2020</td>
                                                        <td class="text-center"><span class="pending">9:00 AM - 10:00 AM</span></td>
                                                        <td class="text-center"><a href="profile-mentee.html" class="btn btn-sm bg-info-light"><i class="far fa-eye"></i> View</a></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <h2 class="table-avatar">
                                                                <a href="profile.html" class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="assets/img/user/user5.jpg" alt="User Image"></a>
                                                                <a href="profile.html">Olive Lawrence <span><span class="__cf_email__" data-cfemail="93fcfffae5f6fff2e4e1f6fdf0f6d3f2f7fcf1f6bdf0fcfe">[email&#160;protected]</span></span></a>
                                                            </h2>
                                                        </td>
                                                        <td>06 April 2020</td>
                                                        <td class="text-center"><span class="pending">9:00 AM - 10:00 AM</span></td>
                                                        <td class="text-center"><a href="profile-mentee.html" class="btn btn-sm bg-info-light"><i class="far fa-eye"></i> View</a></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <h2 class="table-avatar">
                                                                <a href="profile.html" class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="assets/img/user/user6.jpg" alt="User Image"></a>
                                                                <a href="profile.html">Frances Foster <span><span class="__cf_email__" data-cfemail="600612010e0305132001040f02054e030f0d">[email&#160;protected]</span></span></a>
                                                            </h2>
                                                        </td>
                                                        <td>06 April 2020</td>
                                                        <td class="text-center"><span class="pending">9:00 AM - 10:00 AM</span></td>
                                                        <td class="text-center"><a href="profile-mentee.html" class="btn btn-sm bg-info-light"><i class="far fa-eye"></i> View</a></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <h2 class="table-avatar">
                                                                <a href="profile.html" class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="assets/img/user/user2.jpg" alt="User Image"></a>
                                                                <a href="profile.html">Tyrone Roberts<span><span class="__cf_email__" data-cfemail="7a0e030815141f0815181f080e093a1b1e15181f54191517">[email&#160;protected]</span></span></a>
                                                            </h2>
                                                        </td>
                                                        <td>08 April 2020</td>
                                                        <td class="text-center"><span class="pending">9:00 AM - 10:00 AM</span></td>
                                                        <td class="text-center"><a href="profile-mentee.html" class="btn btn-sm bg-info-light"><i class="far fa-eye"></i> View</a></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <h2 class="table-avatar">
                                                                <a href="profile.html" class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="assets/img/user/user1.jpg" alt="User Image"></a>
                                                                <a href="profile.html">Julie Pennington <span><span class="__cf_email__" data-cfemail="ff958a93969abf9e9b909d9ad19c9092">[email&#160;protected]</span></span></a>
                                                            </h2>
                                                        </td>
                                                        <td>08 April 2020</td>
                                                        <td class="text-center"><span class="pending">9:00 AM - 10:00 AM</span></td>
                                                        <td class="text-center"><a href="profile-mentee.html" class="btn btn-sm bg-info-light"><i class="far fa-eye"></i> View</a></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <h2 class="table-avatar">
                                                                <a href="profile.html" class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="assets/img/user/user3.jpg" alt="User Image"></a>
                                                                <a href="profile.html">Allen Davis <span><span class="__cf_email__" data-cfemail="57363b3b32393336213e241736333835327934383a">[email&#160;protected]</span></span></a>
                                                            </h2>
                                                        </td>
                                                        <td>07 April 2020</td>
                                                        <td class="text-center"><span class="pending">9:00 AM - 10:00 AM</span></td>
                                                        <td class="text-center"><a href="profile-mentee.html" class="btn btn-sm bg-info-light"><i class="far fa-eye"></i> View</a></td>
                                                    </tr>
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
                                            <a href="https://mentoring.dreamguystech.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="f598909b819a879c9b92b5908d9498859990db969a98">[email&#160;protected]</a>
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
    </body>

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/bookings-mentee.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:23 GMT -->
</html>

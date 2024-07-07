<%-- 
    Document   : booking
    Created on : Jun 25, 2024, 7:22:44 PM
    Author     : catmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from mentoring.dreamguystech.com/html/template/booking.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:33:02 GMT -->

<head>
    <meta charset="utf-8">
    <title>Mentoring</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">

    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

    <link rel="stylesheet" href="assets/plugins/daterangepicker/daterangepicker.css">

    <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>

    <div class="main-wrapper">

        <div class="breadcrumb-bar">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-md-12 col-12">
                        <nav aria-label="breadcrumb" class="page-breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="home">Home</a></li>
                                <li class="breadcrumb-item"><a href="Booking?service=all_course">Back to courses</a></li>
                            </ol>
                        </nav>
                        <h2 class="breadcrumb-title">Booking</h2>
                    </div>
                </div>
            </div>
        </div>


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="booking-user-info">
                                    <a href="profile.html" class="booking-user-img">
                                        <img src="assets/img/user/user2.jpg" alt="User Image">
                                    </a>
                                    <div class="booking-info">
                                        <h4><a href="profile.html"></a></h4>
                                        <div class="rating">
                                            <i class="fas fa-star filled"></i>
                                            <i class="fas fa-star filled"></i>
                                            <i class="fas fa-star filled"></i>
                                            <i class="fas fa-star filled"></i>
                                            <i class="fas fa-star"></i>
                                            <span class="d-inline-block average-rating">35</span>
                                        </div>
                                        <p class="text-muted mb-0"><i class="fas fa-map-marker-alt"></i> Newyork, USA
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-4 col-md-6">
                                <h4 class="mb-1">11 November 2019</h4>
                                <p class="text-muted">Monday</p>
                            </div>
                            <div class="col-12 col-sm-8 col-md-6 text-sm-end">
                                <div class="bookingrange btn btn-white btn-sm mb-3">
                                    <i class="far fa-calendar-alt me-2"></i>
                                    <span></span>
                                    <i class="fas fa-chevron-down ms-2"></i>
                                </div>
                            </div>
                        </div>

                        <div class="card booking-schedule schedule-widget">

                            <div class="schedule-header">
                                <div class="row">
                                    <div class="col-md-12">

                                        <div class="day-slot">
                                            <ul>
                                                <li class="left-arrow">
                                                    <a href>
                                                        <i class="fa fa-chevron-left"></i>
                                                    </a>
                                                </li>
                                                <li>
                                                    <span>Mon</span>
                                                    <span class="slot-date">11 Nov <small
                                                            class="slot-year">2019</small></span>
                                                </li>
                                                <li>
                                                    <span>Tue</span>
                                                    <span class="slot-date">12 Nov <small
                                                            class="slot-year">2019</small></span>
                                                </li>
                                                <li>
                                                    <span>Wed</span>
                                                    <span class="slot-date">13 Nov <small
                                                            class="slot-year">2019</small></span>
                                                </li>
                                                <li>
                                                    <span>Thu</span>
                                                    <span class="slot-date">14 Nov <small
                                                            class="slot-year">2019</small></span>
                                                </li>
                                                <li>
                                                    <span>Fri</span>
                                                    <span class="slot-date">15 Nov <small
                                                            class="slot-year">2019</small></span>
                                                </li>
                                                <li>
                                                    <span>Sat</span>
                                                    <span class="slot-date">16 Nov <small
                                                            class="slot-year">2019</small></span>
                                                </li>
                                                <li>
                                                    <span>Sun</span>
                                                    <span class="slot-date">17 Nov <small
                                                            class="slot-year">2019</small></span>
                                                </li>
                                                <li class="right-arrow">
                                                    <a href>
                                                        <i class="fa fa-chevron-right"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>

                                    </div>
                                </div>
                            </div>


                            <div class="schedule-cont">
                                <div class="row">
                                    <div class="col-md-12">

                                        <div class="time-slot">
                                            <ul class="clearfix">
                                                <li>
                                                    <a class="timing" href="#">
                                                        <span>9:00</span> <span>AM</span>
                                                    </a>
                                                    <a class="timing" href="#">
                                                        <span>10:00</span> <span>AM</span>
                                                    </a>
                                                    <a class="timing" href="#">
                                                        <span>11:00</span> <span>AM</span>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a class="timing" href="#">
                                                        <span>9:00</span> <span>AM</span>
                                                    </a>
                                                    <a class="timing" href="#">
                                                        <span>10:00</span> <span>AM</span>
                                                    </a>
                                                    <a class="timing" href="#">
                                                        <span>11:00</span> <span>AM</span>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a class="timing" href="#">
                                                        <span>9:00</span> <span>AM</span>
                                                    </a>
                                                    <a class="timing" href="#">
                                                        <span>10:00</span> <span>AM</span>
                                                    </a>
                                                    <a class="timing" href="#">
                                                        <span>11:00</span> <span>AM</span>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a class="timing" href="#">
                                                        <span>9:00</span> <span>AM</span>
                                                    </a>
                                                    <a class="timing" href="#">
                                                        <span>10:00</span> <span>AM</span>
                                                    </a>
                                                    <a class="timing" href="#">
                                                        <span>11:00</span> <span>AM</span>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a class="timing" href="#">
                                                        <span>9:00</span> <span>AM</span>
                                                    </a>
                                                    <a class="timing selected" href="#">
                                                        <span>10:00</span> <span>AM</span>
                                                    </a>
                                                    <a class="timing" href="#">
                                                        <span>11:00</span> <span>AM</span>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a class="timing" href="#">
                                                        <span>9:00</span> <span>AM</span>
                                                    </a>
                                                    <a class="timing" href="#">
                                                        <span>10:00</span> <span>AM</span>
                                                    </a>
                                                    <a class="timing" href="#">
                                                        <span>11:00</span> <span>AM</span>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a class="timing" href="#">
                                                        <span>9:00</span> <span>AM</span>
                                                    </a>
                                                    <a class="timing" href="#">
                                                        <span>10:00</span> <span>AM</span>
                                                    </a>
                                                    <a class="timing" href="#">
                                                        <span>11:00</span> <span>AM</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>


                        <div class="submit-section proceed-btn text-end">
                            <a href="checkout.html" class="btn btn-primary submit-btn">Proceed to Pay</a>
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
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                        incididunt ut labore et dolore magna aliqua. </p>
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
                                        <a href="https://mentoring.dreamguystech.com/cdn-cgi/l/email-protection"
                                            class="__cf_email__"
                                            data-cfemail="d8b5bdb6acb7aab1b6bf98bda0b9b5a8b4bdf6bbb7b5">[email&#160;protected]</a>
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

    <script src="assets/js/moment.min.js"></script>
    <script src="assets/plugins/daterangepicker/daterangepicker.js"></script>

    <script src="assets/js/script.js"></script>
</body>

<!-- Mirrored from mentoring.dreamguystech.com/html/template/booking.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:33:04 GMT -->

</html>

<%-- 
    Document   : checkout.jsp
    Created on : May 26, 2024, 5:29:51 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/checkout.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:23 GMT -->
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
                                    <li class="breadcrumb-item active" aria-current="page">Checkout</li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">Checkout</h2>
                        </div>
                    </div>
                </div>
            </div>


            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-7 col-lg-8">
                            <div class="card">
                                <div class="card-body">

                                    <form action="https://mentoring.dreamguystech.com/html/template/booking-success.html">

                                        <div class="info-widget">
                                            <h4 class="card-title">Personal Information</h4>
                                            <div class="row">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group card-label">
                                                        <label>First Name</label>
                                                        <input class="form-control" type="text">
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group card-label">
                                                        <label>Last Name</label>
                                                        <input class="form-control" type="text">
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group card-label">
                                                        <label>Email</label>
                                                        <input class="form-control" type="email">
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group card-label">
                                                        <label>Phone</label>
                                                        <input class="form-control" type="text">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="exist-customer">Existing Customer? <a href="#">Click here to login</a></div>
                                        </div>

                                        <div class="payment-widget">
                                            <h4 class="card-title">Payment Method</h4>

                                            <div class="payment-list">
                                                <label class="payment-radio credit-card-option">
                                                    <input type="radio" name="radio" checked>
                                                    <span class="checkmark"></span>
                                                    Credit card
                                                </label>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group card-label">
                                                            <label for="card_name">Name on Card</label>
                                                            <input class="form-control" id="card_name" type="text">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group card-label">
                                                            <label for="card_number">Card Number</label>
                                                            <input class="form-control" id="card_number" placeholder="1234  5678  9876  5432" type="text">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group card-label">
                                                            <label for="expiry_month">Expiry Month</label>
                                                            <input class="form-control" id="expiry_month" placeholder="MM" type="text">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group card-label">
                                                            <label for="expiry_year">Expiry Year</label>
                                                            <input class="form-control" id="expiry_year" placeholder="YY" type="text">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group card-label">
                                                            <label for="cvv">CVV</label>
                                                            <input class="form-control" id="cvv" type="text">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="payment-list">
                                                <label class="payment-radio paypal-option">
                                                    <input type="radio" name="radio">
                                                    <span class="checkmark"></span>
                                                    Paypal
                                                </label>
                                            </div>


                                            <div class="terms-accept">
                                                <div class="custom-checkbox">
                                                    <input type="checkbox" id="terms_accept">
                                                    <label for="terms_accept">I have read and accepted <a href="#">Terms &amp; Conditions</a></label>
                                                </div>
                                            </div>


                                            <div class="submit-section mt-4">
                                                <button type="submit" class="btn btn-primary submit-btn">Confirm and Pay</button>
                                            </div>

                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-5 col-lg-4 theiaStickySidebar">

                            <div class="card booking-card">
                                <div class="card-header">
                                    <h4 class="card-title">Booking Summary</h4>
                                </div>
                                <div class="card-body">

                                    <div class="booking-user-info">
                                        <a href="profile.html" class="booking-user-img">
                                            <img src="assets/img/user/user2.jpg" alt="User Image">
                                        </a>
                                        <div class="booking-info">
                                            <h4><a href="profile.html">Darren Elder</a></h4>
                                            <div class="rating">
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star"></i>
                                                <span class="d-inline-block average-rating">35</span>
                                            </div>
                                            <div class="mentor-details">
                                                <p class="user-location"><i class="fas fa-map-marker-alt"></i> Newyork, USA</p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="booking-summary">
                                        <div class="booking-item-wrap">
                                            <ul class="booking-date">
                                                <li>Date <span>16 Nov 2019</span></li>
                                                <li>Time <span>10:00 AM</span></li>
                                            </ul>
                                            <ul class="booking-fee">
                                                <li>Consulting Fee <span>$100</span></li>
                                                <li>Booking Fee <span>$10</span></li>
                                                <li>Video Call <span>$50</span></li>
                                            </ul>
                                            <div class="booking-total">
                                                <ul class="booking-total-list">
                                                    <li>
                                                        <span>Total</span>
                                                        <span class="total-cost">$160</span>
                                                    </li>
                                                </ul>
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
                                            <a href="https://mentoring.dreamguystech.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="076a62697368756e696047627f666a776b622964686a">[email&#160;protected]</a>
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

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/checkout.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:23 GMT -->
</html>

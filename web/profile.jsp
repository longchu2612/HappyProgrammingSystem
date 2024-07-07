<%-- 
    Document   : profile
    Created on : May 26, 2024, 5:23:31 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:23 GMT -->
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
                    <div class="row justify-content-center">
                        <div class="col-xl-10">

                            <div class="card">
                                <div class="card-body">
                                    <div class="mentor-widget">
                                        <div class="user-info-left align-items-center">
                                            <div class="mentor-img d-flex flex-wrap justify-content-center">
                                                <div class="pro-avatar">${fln}</div>
                                                
                                                
                                            </div>
                                            <div class="user-info-cont">
                                                <h4 class="usr-name">${fullname}</h4>
                                            
                                            </div>
                                        </div>
                                        <div class="user-info-right d-flex align-items-end flex-wrap">
                                            <div class="hireme-btn text-center">
                                                <a class="blue-btn-radius" href="booking.html">Deposit</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                <div class="card">
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
                                                            <div class="row-result">
                                                                <div class="row-result">${username}</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="experience-content">
                                                        <div class="timeline-content">
                                                            <span>Email</span>
                                                            <div class="row-result">${email}</div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="experience-content">
                                                        <div class="timeline-content">
                                                            <span>Balance</span>
                                                            <div class="row-result">${balance}</div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="experience-content">
                                                        <div class="timeline-content">
                                                            
                                                             <a href="changepass.jsp">Change Password</a> 
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body custom-border-card pb-0">

                                    <div class="widget education-widget mb-0">
                                        <h4 class="widget-title">Personal Details</h4>
                                        <hr/>
                                        <div class="experience-box">
                                            <ul class="experience-list profile-custom-list">
                                                <li>
                                                    <div class="experience-content">
                                                        <div class="timeline-content">
                                                            <span>Full Name</span>
                                                            <div class="row-result">
                                                                <div class="row-result">${fullname}</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="experience-content">
                                                        <div class="timeline-content">
                                                            <span>Date of Birth</span>
                                                            <div class="row-result">${dob}</div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="experience-content">
                                                        <div class="timeline-content">
                                                            <span>Gender</span>
                                                             <div class="row-result">${sex == 1 ? "Male" : "Female"}</div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="experience-content">
                                                        <div class="timeline-content">
                                                            <span>Phone Number</span>
                                                             <div class="row-result">${phonenumber}</div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="experience-content">
                                                        <div class="timeline-content">
                                                            <span>Address</span>
                                                             <div class="row-result">${address}</div>
                                                        </div>
                                                    </div>
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
            </div>


            <footer class="footer">

                <div class="footer-top">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-4 col-md-6">

                                <div class="footer-widget footer-about">
                                    <div class="footer-logo">
                                        <img src="assets/img/logo-7.png" alt="logo">
                                    </div>
                                    <div class="footer-about-content">
                                        <p>“Study, learn more, learn forever .”― V.I.Lenin </p>
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
                            <div class="col-lg-4 col-md-6">

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
                            <div class="col-lg-4 col-md-6">

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

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:23 GMT -->
</html>

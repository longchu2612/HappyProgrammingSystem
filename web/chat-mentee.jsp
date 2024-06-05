<%-- 
    Document   : chat-mentee
    Created on : May 26, 2024, 5:34:29 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/chat-mentee.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:23 GMT -->
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
    <body class="chat-page">

        <div class="main-wrapper">

            <jsp:include page="layout_header.jsp"/>


            <div class="content">
                <div class="container-fluid">
                    <div class="settings-back mb-3">
                        <a href="dashboard.html">
                            <i class="fas fa-long-arrow-alt-left"></i> <span>Settings</span>
                        </a>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 mb-4">
                            <div class="chat-window">

                                <div class="chat-cont-left">
                                    <form class="chat-search d-flex align-items-center">
                                        <div class="avatar avatar-online me-3">
                                            <img src="assets/img/user/user.jpg" alt="User Image" class="avatar-img rounded-circle">
                                        </div>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <i class="fas fa-search"></i>
                                            </div>
                                            <input type="text" class="form-control rounded-pill" placeholder="Search">
                                        </div>
                                    </form>
                                    <div class="chat-header">
                                        <span>Chats</span>
                                    </div>
                                    <div class="chat-users-list">
                                        <div class="chat-scroll">
                                            <a href="javascript:void(0);" class="media d-flex">
                                                <div class="media-img-wrap flex-shrink-0">
                                                    <div class="avatar avatar-away">
                                                        <img src="assets/img/user/user14.jpg" alt="User Image" class="avatar-img rounded-circle">
                                                    </div>
                                                </div>
                                                <div class="media-body flex-grow-1">
                                                    <div>
                                                        <div class="user-name">Marvin Downey</div>
                                                        <div class="user-last-chat">Hey, How are you?</div>
                                                    </div>
                                                    <div>
                                                        <div class="last-chat-time block">2 min</div>
                                                        <div class="badge badge-success badge-pill fill-blue rounded-pill">15</div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="javascript:void(0);" class="media read-chat d-flex">
                                                <div class="media-img-wrap flex-shrink-0">
                                                    <div class="avatar avatar-online">
                                                        <img src="assets/img/user/user1.jpg" alt="User Image" class="avatar-img rounded-circle">
                                                    </div>
                                                </div>
                                                <div class="media-body flex-grow-1">
                                                    <div>
                                                        <div class="user-name">Charlene Reed</div>
                                                        <div class="user-last-chat">I'll call you later </div>
                                                    </div>
                                                    <div>
                                                        <div class="last-chat-time block">8:01 PM</div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="javascript:void(0);" class="media d-flex">
                                                <div class="media-img-wrap flex-shrink-0">
                                                    <div class="avatar avatar-away">
                                                        <img src="assets/img/user/user2.jpg" alt="User Image" class="avatar-img rounded-circle">
                                                    </div>
                                                </div>
                                                <div class="media-body flex-grow-1">
                                                    <div>
                                                        <div class="user-name">Travis Trimble </div>
                                                        <div class="user-last-chat">Give me a full explanation about our project</div>
                                                    </div>
                                                    <div>
                                                        <div class="last-chat-time block">7:30 PM</div>
                                                        <div class="badge badge-success badge-pill fill-blue rounded-pill">3</div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="javascript:void(0);" class="media read-chat d-flex">
                                                <div class="media-img-wrap flex-shrink-0">
                                                    <div class="avatar avatar-online">
                                                        <img src="assets/img/user/user3.jpg" alt="User Image" class="avatar-img rounded-circle">
                                                    </div>
                                                </div>
                                                <div class="media-body flex-grow-1">
                                                    <div>
                                                        <div class="user-name">Carl Kelly</div>
                                                        <div class="user-last-chat">That's very good UI design</div>
                                                    </div>
                                                    <div>
                                                        <div class="last-chat-time block">6:59 PM</div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="javascript:void(0);" class="media read-chat d-flex">
                                                <div class="media-img-wrap flex-shrink-0">
                                                    <div class="avatar avatar-offline">
                                                        <img src="assets/img/user/user4.jpg" alt="User Image" class="avatar-img rounded-circle">
                                                    </div>
                                                </div>
                                                <div class="media-body flex-grow-1">
                                                    <div>
                                                        <div class="user-name">Michelle Fairfax</div>
                                                        <div class="user-last-chat">Yesterday i completed the task</div>
                                                    </div>
                                                    <div>
                                                        <div class="last-chat-time block">11:21 AM</div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="javascript:void(0);" class="media read-chat d-flex">
                                                <div class="media-img-wrap flex-shrink-0">
                                                    <div class="avatar avatar-online">
                                                        <img src="assets/img/user/user5.jpg" alt="User Image" class="avatar-img rounded-circle">
                                                    </div>
                                                </div>
                                                <div class="media-body flex-grow-1">
                                                    <div>
                                                        <div class="user-name">Gina Moore</div>
                                                        <div class="user-last-chat">What is the major functionality?</div>
                                                    </div>
                                                    <div>
                                                        <div class="last-chat-time block">10:05 AM</div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="javascript:void(0);" class="media read-chat d-flex">
                                                <div class="media-img-wrap flex-shrink-0">
                                                    <div class="avatar avatar-away">
                                                        <img src="assets/img/user/user6.jpg" alt="User Image" class="avatar-img rounded-circle">
                                                    </div>
                                                </div>
                                                <div class="media-body flex-grow-1">
                                                    <div>
                                                        <div class="user-name">Elsie Gilley</div>
                                                        <div class="user-last-chat">This has allowed me to showcase not only my technical skills</div>
                                                    </div>
                                                    <div>
                                                        <div class="last-chat-time block">Yesterday</div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="javascript:void(0);" class="media read-chat d-flex">
                                                <div class="media-img-wrap flex-shrink-0">
                                                    <div class="avatar avatar-offline">
                                                        <img src="assets/img/user/user7.jpg" alt="User Image" class="avatar-img rounded-circle">
                                                    </div>
                                                </div>
                                                <div class="media-body flex-grow-1">
                                                    <div>
                                                        <div class="user-name">Joan Gardner</div>
                                                        <div class="user-last-chat">Let's talk briefly in the evening. </div>
                                                    </div>
                                                    <div>
                                                        <div class="last-chat-time block">Sunday</div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="javascript:void(0);" class="media read-chat d-flex">
                                                <div class="media-img-wrap flex-shrink-0">
                                                    <div class="avatar avatar-online">
                                                        <img src="assets/img/user/user8.jpg" alt="User Image" class="avatar-img rounded-circle">
                                                    </div>
                                                </div>
                                                <div class="media-body flex-grow-1">
                                                    <div>
                                                        <div class="user-name">Daniel Griffing</div>
                                                        <div class="user-last-chat">Do you have any collections? If so, what of?</div>
                                                    </div>
                                                    <div>
                                                        <div class="last-chat-time block">Saturday</div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="javascript:void(0);" class="media read-chat d-flex">
                                                <div class="media-img-wrap flex-shrink-0">
                                                    <div class="avatar avatar-away">
                                                        <img src="assets/img/user/user9.jpg" alt="User Image" class="avatar-img rounded-circle">
                                                    </div>
                                                </div>
                                                <div class="media-body flex-grow-1">
                                                    <div>
                                                        <div class="user-name">Walter Roberson</div>
                                                        <div class="user-last-chat">Connect the two modules with in 1 day.</div>
                                                    </div>
                                                    <div>
                                                        <div class="last-chat-time block">Friday</div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>


                                <div class="chat-cont-right">
                                    <div class="chat-header">
                                        <a id="back_user_list" href="javascript:void(0)" class="back-user-list">
                                            <i class="material-icons">chevron_left</i>
                                        </a>
                                        <div class="media d-flex">
                                            <div class="media-img-wrap flex-shrink-0">
                                                <div class="avatar avatar-online">
                                                    <img src="assets/img/user/user.jpg" alt="User Image" class="avatar-img rounded-circle">
                                                </div>
                                            </div>
                                            <div class="media-body flex-grow-1">
                                                <div class="user-name">Jonathan Doe</div>
                                            </div>
                                        </div>
                                        <div class="chat-options">
                                            <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#voice_call">
                                                <i class="material-icons">local_phone</i>
                                            </a>
                                            <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#video_call">
                                                <i class="material-icons">videocam</i>
                                            </a>
                                            <a href="javascript:void(0)">
                                                <i class="material-icons">more_vert</i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="chat-body">
                                        <div class="chat-scroll">
                                            <ul class="list-unstyled">
                                                <li class="media sent">
                                                    <div class="media-body">
                                                        <div class="msg-box">
                                                            <div>
                                                                <p>Hello. What can I do for you?</p>
                                                                <ul class="chat-msg-info">
                                                                    <li>
                                                                        <div class="chat-time">
                                                                            <span>8:30 AM</span>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="media received d-flex">
                                                    <div class="avatar flex-shrink-0">
                                                        <img src="assets/img/user/user.jpg" alt="User Image" class="avatar-img rounded-circle">
                                                    </div>
                                                    <div class="media-body flex-grow-1">
                                                        <div class="msg-box">
                                                            <div>
                                                                <p>I'm just looking around.</p>
                                                                <p>Will you tell me something about yourself?</p>
                                                                <ul class="chat-msg-info">
                                                                    <li>
                                                                        <div class="chat-time">
                                                                            <span>8:35 AM</span>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="msg-box">
                                                            <div>
                                                                <p>Are you there? That time!</p>
                                                                <ul class="chat-msg-info">
                                                                    <li>
                                                                        <div class="chat-time">
                                                                            <span>8:40 AM</span>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="msg-box">
                                                            <div>
                                                                <div class="chat-msg-attachments">
                                                                    <div class="chat-attachment">
                                                                        <img src="assets/img/img-02.jpg" alt="Attachment">
                                                                        <div class="chat-attach-caption">placeholder.jpg</div>
                                                                        <a href class="chat-attach-download">
                                                                            <i class="fas fa-download"></i>
                                                                        </a>
                                                                    </div>
                                                                    <div class="chat-attachment">
                                                                        <img src="assets/img/img-03.jpg" alt="Attachment">
                                                                        <div class="chat-attach-caption">placeholder.jpg</div>
                                                                        <a href class="chat-attach-download">
                                                                            <i class="fas fa-download"></i>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                                <ul class="chat-msg-info">
                                                                    <li>
                                                                        <div class="chat-time">
                                                                            <span>8:41 AM</span>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="media sent">
                                                    <div class="media-body">
                                                        <div class="msg-box">
                                                            <div>
                                                                <p>Where?</p>
                                                                <ul class="chat-msg-info">
                                                                    <li>
                                                                        <div class="chat-time">
                                                                            <span>8:42 AM</span>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="msg-box">
                                                            <div>
                                                                <p>OK, my name is Limingqiang. I like singing, playing basketballand so on.</p>
                                                                <ul class="chat-msg-info">
                                                                    <li>
                                                                        <div class="chat-time">
                                                                            <span>8:42 AM</span>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="msg-box">
                                                            <div>
                                                                <div class="chat-msg-attachments">
                                                                    <div class="chat-attachment">
                                                                        <img src="assets/img/img-04.jpg" alt="Attachment">
                                                                        <div class="chat-attach-caption">placeholder.jpg</div>
                                                                        <a href class="chat-attach-download">
                                                                            <i class="fas fa-download"></i>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                                <ul class="chat-msg-info">
                                                                    <li>
                                                                        <div class="chat-time">
                                                                            <span>8:50 AM</span>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="media received d-flex">
                                                    <div class="avatar flex-shrink-0">
                                                        <img src="assets/img/user/user.jpg" alt="User Image" class="avatar-img rounded-circle">
                                                    </div>
                                                    <div class="media-body flex-grow-1">
                                                        <div class="msg-box">
                                                            <div>
                                                                <p>You wait for notice.</p>
                                                                <p>Consectetuorem ipsum dolor sit?</p>
                                                                <p>Ok?</p>
                                                                <ul class="chat-msg-info">
                                                                    <li>
                                                                        <div class="chat-time">
                                                                            <span>8:55 PM</span>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="chat-date">Today</li>
                                                <li class="media received d-flex">
                                                    <div class="avatar flex-shrink-0">
                                                        <img src="assets/img/user/user.jpg" alt="User Image" class="avatar-img rounded-circle">
                                                    </div>
                                                    <div class="media-body flex-grow-1">
                                                        <div class="msg-box">
                                                            <div>
                                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,</p>
                                                                <ul class="chat-msg-info">
                                                                    <li>
                                                                        <div class="chat-time">
                                                                            <span>10:17 AM</span>
                                                                        </div>
                                                                    </li>
                                                                    <li><a href="#">Edit</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="media sent">
                                                    <div class="media-body">
                                                        <div class="msg-box">
                                                            <div>
                                                                <p>Lorem ipsum dollar sit</p>
                                                                <div class="chat-msg-actions dropdown">
                                                                    <a href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                        <i class="fe fe-elipsis-v"></i>
                                                                    </a>
                                                                    <div class="dropdown-menu dropdown-menu-end">
                                                                        <a class="dropdown-item" href="#">Delete</a>
                                                                    </div>
                                                                </div>
                                                                <ul class="chat-msg-info">
                                                                    <li>
                                                                        <div class="chat-time">
                                                                            <span>10:19 AM</span>
                                                                        </div>
                                                                    </li>
                                                                    <li><a href="#">Edit</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="media received d-flex">
                                                    <div class="avatar flex-shrink-0">
                                                        <img src="assets/img/user/user.jpg" alt="User Image" class="avatar-img rounded-circle">
                                                    </div>
                                                    <div class="media-body flex-grow-1">
                                                        <div class="msg-box">
                                                            <div>
                                                                <div class="msg-typing">
                                                                    <span></span>
                                                                    <span></span>
                                                                    <span></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="chat-footer">
                                        <div class="input-group">
                                            <div class="btn-file btn">
                                                <i class="fa fa-paperclip"></i>
                                                <input type="file">
                                            </div>
                                            <input type="text" class="input-msg-send form-control" placeholder="Type something">
                                            <button type="button" class="btn msg-send-btn">Send</button>
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
                                            <a href="https://mentoring.dreamguystech.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="0568606b716a776c6b6245607d64687569602b666a68">[email&#160;protected]</a>
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
                                        <h4>Richard Wilson</h4>
                                        <span>Connecting...</span>
                                    </div>
                                    <div class="call-items">
                                        <a href="javascript:void(0);" class="btn call-item call-end" data-bs-dismiss="modal" aria-label="Close"><i class="material-icons">call_end</i></a>
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
                                        <h4>Richard Wilson</h4>
                                        <span>Calling ...</span>
                                    </div>
                                    <div class="call-items">
                                        <a href="javascript:void(0);" class="btn call-item call-end" data-bs-dismiss="modal" aria-label="Close"><i class="material-icons">call_end</i></a>
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

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/chat-mentee.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:23 GMT -->
</html>
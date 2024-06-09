<%-- 
    Document   : profilementee
    Created on : May 24, 2024, 12:09:40 AM
    Author     : ngoqu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.CV_skill" %>
<%@ page import="dao.SkillDAO" %>
<%@ page import="dao.SkillsDAO" %>

<%
  String Cvid =String.valueOf(request.getAttribute("Cvid"));
    SkillsDAO s = new SkillsDAO(); // Assuming you have a service to get the skills
    ArrayList<CV_skill> cvs = (ArrayList<CV_skill>) s.getAllByCVId(Cvid);
    SkillDAO sk = new SkillDAO();
%>

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
       

            <div class="breadcrumb-bar">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-12 col-12">
                            <nav aria-label="breadcrumb" class="page-breadcrumb">
                                <ol class="breadcrumb">
                                    <%  String userLogin=null;
                                            userLogin = (String) session.getAttribute("username");
                                    if(userLogin==null){
                                    String home="home";%>
                                    
                                     <li class="breadcrumb-item"><a href="<%=home%>">Home</a></li>
                                      <%  }else{
                                        String home="home1";
                                        %>
                                    
                                    <li class="breadcrumb-item"><a href="<%=home%>">Home</a></li>
                                    <%
                                        }
                                %>
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
                                        <div class="profile-img">
                                            <img src="assets/img/user/${acc.getAvatar()}" alt="User Image" style="max-width: 150px">
                                        </div>


                                    </div>
                                    <div class="user-info-cont">
                                        <h4 class="usr-name">${acc.getAccount_name()}</h4>
                                        <p class="mentor-type">${cv.getJob()}</p>
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

                            <div class="tab-content pt-0">

                                <div role="tabpanel" id="biography" class="tab-pane fade show active">
                                    <div class="row">
                                        <div class="col-md-12">

                                            <div class="widget about-widget custom-about mb-0">
                                                <h4 class="widget-title">About Me</h4>
                                                <hr/>
                                                <p> ${cv.getIntroduction()}</p>


                                            </div>

                                        </div>
                                    </div>
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
                                                    <span>Account Name</span>
                                                    <div class="row-result">${acc.getAccount_name()}</div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="experience-content">
                                                <div class="timeline-content">
                                                    <span>Email</span>
                                                    <div class="row-result">${acc.getEmail()}</div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="experience-content">
                                                <div class="timeline-content">
                                                    <span>Date of Birth</span>
                                                    <div class="row-result">${acc.getDateOfBirth()}</div>
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

                            <div class="widget experience-widget mb-0">
                                <h4 class="widget-title">Achievement and Service</h4>
                                <hr/>
                                <div class="experience-box">
                                    <ul class="experience-list profile-custom-list">
                                        <li>
                                            <div class="experience-content">
                                                <div class="timeline-content">
                                                    <span>Achievement</span>
                                                    <div class="row-result">${cv.getAchievements()}</div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="experience-content">
                                                <div class="timeline-content">
                                                    <span>Statistic Rating of Each Skill</span>



                                                    <%
            for (CV_skill cvSkill : cvs) {
                String skillId = cvSkill.getSkill_id();
                String skill = sk.getskillbySkillID(skillId);
                String rating = cvSkill.getRating_star(); // Correctly retrieving the rating from cvSkill
                                                    %>
                                                    <div class="row-result"><%= skill %>: <%= rating %></div>
                                                    <%
                                                        }
                                                    %>

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

                            <div class="widget experience-widget mb-0">
                                <h4 class="widget-title">Rating And Comments</h4>
                              
                                <div class="experience-box">
                                    <ul class="experience-list profile-custom-list">
                                        <c:forEach items="${rnc}" var="r">
                                        
                                            <div style="margin: 10px">
                                                    <span>Rating: ${r.getRating()}</span>
                                                    <div class="row-result">Comments of mentee: ${r.getComment()}</div>
                                                </div>
                                            
                                      
                                        </c:forEach>


                                    </ul>
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
                                <img src="assets/img/logo-7.png" alt="logo">
                            </div>
                            <div class="footer-about-content">
                                <p>“Study, learn more, learn forever .”
                                    ― V.I.Lenin </p>
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


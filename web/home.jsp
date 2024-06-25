<%-- 
    Document   : index
    Created on : May 21, 2024, 11:32:05 PM
    Author     : asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


    <!-- Mirrored from mentoring.dreamguystech.com/html/template/index-five.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:31:03 GMT -->
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Mentoring</title>

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/owl.theme.default.min.css">

        <link rel="stylesheet" href="assets/plugins/slick/slick.css">
        <link rel="stylesheet" href="assets/plugins/slick/slick-theme.css">

        <link rel="stylesheet" href="assets/plugins/aos/aos.css">

        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body class="body-home-one">

        <div class="main-wrapper">

            <jsp:include page="header.jsp"/>


            <section class=" home-slide home-slide-four d-flex align-items-center">
                <div class="container">
                    <div class="side-four-right">
                        <img src="assets/img/img-1.png" alt>
                    </div>
                    <div class="row ">
                        <div class="col-md-6 d-flex align-items-center">
                            <div class="section-banner-three aos" data-aos="fade-up">
                                <div class="hometwo-slide-text">
                                    <h1>Engaging & <br>Accessible <span>Online<br>Courses</span> For All</h1>
                                    <p>Own your future learning new skills online</p>
                                </div>

                                <div class="search-box">
                                    <form action="https://mentoring.dreamguystech.com/html/template/search.html">
                                        <div class="form-group search-info location-search">
                                            <input type="text" class="form-control text-truncate" placeholder=" Search School, Online educational centers, etc">
                                            <a href="search.html" class="btn bg-search search-btn align-items-center d-flex justify-content-center">Search</a>
                                        </div>
                                    </form>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="object-slide-img aos " data-aos="fade-up">
                                <img src="assets/img/object-5.png" alt>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="section featured-course-four">
                <div class="container">
                    <div class="side-four-right">
                        <img src="assets/img/img-3.png" alt>
                    </div>
                    <div class="section-header h-four text-center aos " data-aos="fade-up">
                        <span>What’s New</span>
                        <h2>Featured Courses</h2>
                        <p class="sub-title">“Study, learn more, learn forever .”― V.I.Lenin.</p>
                    </div>
                    <div class="featured-course-new aos " data-aos="fade-up">
                        <div class="row">
                            <c:forEach begin="0" end="5" items="${listS}" var="skill">
                                <div class="col-lg-4 col-md-6">
                                    <div class="featured-course-face">
                                        <div class="featured-course-design">
                                            <div class="course-info d-flex align-items-center">
                                                <div class="course-bg-left">
                                                    <img src="assets/img/course-bg-1.png" alt>
                                                </div>
                                                <div class="course-bg-right">
                                                    <img src="assets/img/course-bg-2.png" alt>
                                                </div>
                                                <div class="rating rating-star">
                                                    <i class="fas fa-star filled"></i>
                                                    <span class="d-inline-block average-rating rate-point ">4.4<span class="rate-star-point">(15)</span></span>
                                                </div>
                                            </div>
                                            <div class="featured-course-four-head text-center">
                                                <h2>
                                                    <a href="Booking?service=by_course&skId=${skill.skillId}">${skill.skillName}</a>
                                                </h2>
                                            </div>
                                            <div class="view-student">
                                                <ul class="view-student-four justify-content-center">
                                                    <li><i class="fas fa-users"></i></li>
                                                    <li>50 Students</li>
                                                    <li><i class="fas fa-file-alt"></i></li>
                                                    <li>85</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="course-footer-text text-center">
                                            <h4>
                                                <a href="Booking?service=by_course&skId=${skill.skillId}">More information</a>
                                            </h4>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="explore-more text-center aos " data-aos="fade-up">
                        <a href="Booking?service=all_course" class="btn bg-explore">Show All Categories</a>
                    </div>
                </div>
            </section>


            <section class="rating-instructor-four">
                <div class="container">
                    <div class="section-header h-four text-center aos " data-aos="fade-up">
                        <span>EXPERT</span>
                        <h2>Top Rating Instructor</h2>
                        <p class="sub-title">“Study, learn more, learn forever .”
                            ― V.I.Lenin</p>
                    </div>
                    <div class="instructor-four-face aos " data-aos="fade-up">
                        <div class="row">

                            <c:forEach items="${list}" var="o" begin="0" end="3">
                                <div class="col-lg-3 col-md-6">
                                    <div class="large-team">
                                        <div class="student-img">
                                            <a href="mentorprofile?id=${o.account_id}"><img src="assets/img/user/${o.avatar}" alt></a>
                                            <div class="rating-student-four">


                                            </div>
                                        </div>
                                        <div class="team-name">
                                            <h4>
                                                <a href="mentorprofile?id=${o.account_id}">${o.fullname}</a>
                                            </h4>
                                            <span class="designation">Mentor</span>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="explore-more text-center aos " data-aos="fade-up">
                        <a href="profile.html" class="btn bg-explore">Show All</a>
                    </div>
                </div>
            </section>


            <section class="share-knowledge-three share-knowledge-four">
                <div class="container">
                    <div class="side-four">
                        <img src="assets/img/img-4.png" alt>
                    </div>
                    <div class="row">
                        <div class="col-md-6 d-flex align-items-center">
                            <div class="knowledge-img-three aos " data-aos="fade-up">
                                <img src="assets/img/join-4.png" alt>
                            </div>
                        </div>
                        <div class="col-md-6 d-flex align-items-center">
                            <div class="join-us-all aos " data-aos="fade-up">
                                <div class="join-us-heading">
                                    <h2>Want to share your knowledge? <br>Join usa Mentor</h2>
                                    <p>High-definition video is video of higher resolution and quality than standard-definition. While there is no standardized meaning for high-definition, generally any video.</p>
                                </div>
                                <div class="join-two-face">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-12">
                                            <div class="best-course-three">
                                                <div class="best-course-icon d-flex align-items-center ">
                                                    <i class="fa fa-check" aria-hidden="true"></i>
                                                    <h4>Best Courses</h4>
                                                </div>
                                                <p>Courses for all levels cover technical skills, creative techniques, business strategies, and more. We have collected all of the necessary effective study.</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-12">
                                            <div class="best-course-three">
                                                <div class="best-course-icon d-flex align-items-center ">
                                                    <i class="fa fa-check" aria-hidden="true"></i>
                                                    <h4>Top rated Instructors</h4>
                                                </div>
                                                <p>Courses for all levels cover technical skills, creative techniques, business strategies, and more. We have collected all of the necessary effective study.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="explore-more ">
                                        <a href="search.html" class="btn bg-explore">Read More</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>





            <section class="new-course new-course-four">
                <div class="container">
                    <div class="new-course-background">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 d-flex align-items-end">
                                <div class="new-course-img aos " data-aos="fade-up">
                                    <img src="assets/img/stay-turn-1.png" alt="new course">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 d-flex align-items-center">
                                <div class="every-new-course aos " data-aos="fade-up">
                                    <div class="new-course-text">
                                        <span>Subscribe</span>
                                        <h1>Stay tuned!</h1>
                                        <p class="page-sub-text ">Get the latest articles and business updates that you need to know, you’ll even get special recommendations weekly.</p>
                                    </div>
                                    <div class="course-mail">
                                        <form action="https://mentoring.dreamguystech.com/html/template/search.html">
                                            <div class="input-group mb-3 subscribe-form">
                                                <input type="text" class="form-control course-text-bg" placeholder="Your Email">
                                                <a href="search.html" class="btn bg-course-subscribe">
                                                    Subscribe
                                                </a>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="sty-bottom">
                                        <p class="sty-bottom-text ">Your email is safe with us, we dont spam.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>


            <footer class="footer footer-two footer-four">

                <div class="footer-top footer-two-top aos " data-aos="fade-up">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 col-md-12">
                                <div class="footer-logo">
                                    <img src="assets/img/logo-5.png" alt="logo">
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">

                                <div class="footer-widget footer-about">
                                    <div class="footer-about-content">
                                        <h2 class="footer-title">About Mentoring</h2>
                                        <p class="footer-sub-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut consequat mauris Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut consequat mauris </p>
                                    </div>
                                    <div class="footer-list">
                                        <ul class="footer-social-list">
                                            <li>
                                                <a href>Facebook</a>
                                            </li>
                                            <li>
                                                <a href>Instagram </a>
                                            </li>
                                            <li>
                                                <a href>Linkedin </a>
                                            </li>
                                            <li>
                                                <a href>Pinterest</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                            </div>
                            <div class="col-lg-4 col-md-6">

                                <div class="subscriber-two">
                                    <h2 class="footer-title">Subscribe</h2>
                                    <form action="https://mentoring.dreamguystech.com/html/template/search.html">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="E-email address">
                                            <a href="search.html" class="btn bg-path d-flex align-items-center">
                                                <i class="fas fa-arrow-up"></i>
                                            </a>
                                        </div>
                                        <div class="bottom-border-two"></div>
                                    </form>
                                </div>

                            </div>
                            <div class="col-lg-2 col-md-6">

                                <div class="footer-widget footer-menu">
                                    <h2 class="footer-title">For Mentee</h2>
                                    <ul>
                                        <li><a href="search.html">Search Mentors</a></li>
                                        <li><a href="login.jsp">Login</a></li>
                                        <li><a href="register.jsp">Register</a></li>
                                        <li><a href="booking.html">Booking</a></li>
                                        <li><a href="dashboard-mentee.html">Mentee Dashboard</a></li>
                                    </ul>
                                </div>

                            </div>
                            <div class="col-lg-2 col-md-6">

                                <div class="footer-widget footer-menu">
                                    <h2 class="footer-title">For Mentors</h2>
                                    <ul>
                                        <li><a href="appointments.html">Appointments</a></li>
                                        <li><a href="chat.html">Chat</a></li>
                                        <li><a href="login.html">Login</a></li>
                                        <li><a href="register.jsp">Register</a></li>
                                        <li><a href="dashboard.html">Mentor Dashboard</a></li>
                                    </ul>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>


                <div class="footer-bottom ">
                    <div class="container">

                        <div class="copyright-border"></div>
                        <div class="copyright ">
                            <div class="row align-items-center">
                                <div class="col-md-6 ">
                                    <div class="copyright-text">
                                        <p class="mb-0">&copy; 2022 Mentoring. All rights reserved.</p>
                                    </div>
                                </div>
                                <div class="col-md-6 ">
                                    <div class="term-privacy">
                                        <div class="social-icon">
                                            <ul class="align-items-center">
                                                <li>
                                                    <a href="javascript:void(0);">Terms</a>
                                                </li>
                                                <li>
                                                    <a href="javascript:void(0);">Privacy </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:void(0);">Cookies </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="back-to-top show">
                            <a class="back-to-top-icon align-items-center justify-content-center d-flex show" href="#top"><i class="fa fa-arrow-up" aria-hidden="true"></i></a>
                        </div>
                    </div>
                </div>

            </footer>

        </div>


        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/owl.carousel.min.js"></script>

        <script src="assets/plugins/slick/slick.js"></script>

        <script src="assets/plugins/aos/aos.js"></script>

        <script src="assets/js/script.js"></script>
    </body>

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/index-five.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:31:24 GMT -->
</html>

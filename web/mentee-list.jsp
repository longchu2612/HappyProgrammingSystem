<%-- 
    Document   : mentee-list
    Created on : Jun 3, 2024, 10:12:33 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <!-- Mirrored from mentoring.dreamguystech.com/html/template/mentee-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:08 GMT -->
    <head>
        <meta charset="utf-8" />
        <title>Mentoring</title>
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=0"
            />

        <link
            rel="shortcut icon"
            type="image/x-icon"
            href="assets/img/favicon.png"
            />

        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />

        <link
            rel="stylesheet"
            href="assets/plugins/fontawesome/css/fontawesome.min.css"
            />
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css" />

        <link rel="stylesheet" href="assets/css/style.css" />
    </head>
    <body>
        <div class="main-wrapper">
            <jsp:include page="layout_header.jsp"/>

            <div class="breadcrumb-bar">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-8 col-12">
                            <nav aria-label="breadcrumb" class="page-breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">
                                        Mentee List
                                    </li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">Mentee List</h2>
                        </div>
                        <div class="col-md-4 col-12">
                            <form class="search-form custom-search-form">
                                <div class="input-group">
                                    <input
                                        type="text"
                                        placeholder="Search Mentees..."
                                        class="form-control"
                                        />
                                    <button type="submit" class="btn btn-primary">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </div>
                            </form>
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
                                        <li>
                                            <a href="dashboard.html"
                                               ><i class="fas fa-home"></i>Dashboard
                                                <span><i class="fas fa-chevron-right"></i></span
                                                ></a>
                                        </li>
                                        <li>
                                            <a href="bookings.html"
                                               ><i class="fas fa-clock"></i>Bookings
                                                <span><i class="fas fa-chevron-right"></i></span
                                                ></a>
                                        </li>
                                        <li>
                                            <a href="schedule-timings.html"
                                               ><i class="fas fa-hourglass-start"></i>Schedule Timings
                                                <span><i class="fas fa-chevron-right"></i></span
                                                ></a>
                                        </li>
                                        <li>
                                            <a href="chat.html"
                                               ><i class="fas fa-comments"></i>Messages
                                                <span><i class="fas fa-chevron-right"></i></span
                                                ></a>
                                        </li>
                                        <li>
                                            <a href="blog.html" class="active"
                                               ><i class="fab fa-blogger-b"></i>Blog
                                                <span><i class="fas fa-chevron-right"></i></span
                                                ></a>
                                        </li>
                                        <li>
                                            <a href="profile.html"
                                               ><i class="fas fa-user-cog"></i>Profile
                                                <span><i class="fas fa-chevron-right"></i></span
                                                ></a>
                                        </li>
                                        <li>
                                            <a href="login.html"
                                               ><i class="fas fa-sign-out-alt"></i>Logout
                                                <span><i class="fas fa-chevron-right"></i></span
                                                ></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-7 col-lg-8 col-xl-9">
                            <div class="row row-grid">
                                <div class="col-md-6 col-lg-4 col-xl-3">
                                    <div class="card widget-profile user-widget-profile">
                                        <div class="card-body">
                                            <div class="pro-widget-content">
                                                <div class="profile-info-widget">
                                                    <a
                                                        href="profile-mentee.html"
                                                        class="booking-user-img"
                                                        >
                                                        <img
                                                            src="assets/img/user/user.jpg"
                                                            alt="User Image"
                                                            />
                                                    </a>
                                                    <div class="profile-det-info">
                                                        <h3>
                                                            <a href="profile-mentee.html">Richard Wilson</a>
                                                        </h3>
                                                        <div class="mentee-details">
                                                            <h5><b>Mentee ID :</b> 16</h5>
                                                            <h5 class="mb-0">
                                                                <i class="fas fa-map-marker-alt"></i> Alabama,
                                                                USA
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mentee-info">
                                                <ul>
                                                    <li>Phone <span>+1 952 001 8563</span></li>
                                                    <li>Age <span>38 Years, Male</span></li>
                                                    <li>Blood Group <span>AB+</span></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-4 col-xl-3">
                                    <div class="card widget-profile user-widget-profile">
                                        <div class="card-body">
                                            <div class="pro-widget-content">
                                                <div class="profile-info-widget">
                                                    <a
                                                        href="profile-mentee.html"
                                                        class="booking-user-img"
                                                        >
                                                        <img
                                                            src="assets/img/user/user1.jpg"
                                                            alt="User Image"
                                                            />
                                                    </a>
                                                    <div class="profile-det-info">
                                                        <h3>
                                                            <a href="profile-mentee.html">Charlene Reed</a>
                                                        </h3>
                                                        <div class="mentee-details">
                                                            <h5><b>Mentee ID :</b> 01</h5>
                                                            <h5 class="mb-0">
                                                                <i class="fas fa-map-marker-alt"></i> North
                                                                Carolina, USA
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mentee-info">
                                                <ul>
                                                    <li>Phone <span>+1 828 632 9170</span></li>
                                                    <li>Age <span>29 Years, Female</span></li>
                                                    <li>Blood Group <span>O+</span></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-4 col-xl-3">
                                    <div class="card widget-profile user-widget-profile">
                                        <div class="card-body">
                                            <div class="pro-widget-content">
                                                <div class="profile-info-widget">
                                                    <a
                                                        href="profile-mentee-2.html"
                                                        class="booking-user-img"
                                                        >
                                                        <img
                                                            src="assets/img/user/user2.jpg"
                                                            alt="User Image"
                                                            />
                                                    </a>
                                                    <div class="profile-det-info">
                                                        <h3>Travis Trimble</h3>
                                                        <div class="mentee-details">
                                                            <h5><b>Mentee ID :</b> 02</h5>
                                                            <h5 class="mb-0">
                                                                <i class="fas fa-map-marker-alt"></i> Maine, USA
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mentee-info">
                                                <ul>
                                                    <li>Phone <span>+1 207 729 9974</span></li>
                                                    <li>Age <span>23 Years, Male</span></li>
                                                    <li>Blood Group <span>B+</span></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-4 col-xl-3">
                                    <div class="card widget-profile user-widget-profile">
                                        <div class="card-body">
                                            <div class="pro-widget-content">
                                                <div class="profile-info-widget">
                                                    <a href="#" class="booking-user-img">
                                                        <img
                                                            src="assets/img/user/user3.jpg"
                                                            alt="User Image"
                                                            />
                                                    </a>
                                                    <div class="profile-det-info">
                                                        <h3>Carl Kelly</h3>
                                                        <div class="mentee-details">
                                                            <h5><b>Mentee ID :</b> 03</h5>
                                                            <h5 class="mb-0">
                                                                <i class="fas fa-map-marker-alt"></i> Indiana,
                                                                USA
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mentee-info">
                                                <ul>
                                                    <li>Phone <span>+1 260 724 7769</span></li>
                                                    <li>Age <span>32 Years, Male</span></li>
                                                    <li>Blood Group <span>A+</span></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-4 col-xl-3">
                                    <div class="card widget-profile user-widget-profile">
                                        <div class="card-body">
                                            <div class="pro-widget-content">
                                                <div class="profile-info-widget">
                                                    <a href="#" class="booking-user-img">
                                                        <img
                                                            src="assets/img/user/user4.jpg"
                                                            alt="User Image"
                                                            />
                                                    </a>
                                                    <div class="profile-det-info">
                                                        <h3>Michelle Fairfax</h3>
                                                        <div class="mentee-details">
                                                            <h5><b>Mentee ID :</b> 04</h5>
                                                            <h5 class="mb-0">
                                                                <i class="fas fa-map-marker-alt"></i> Indiana,
                                                                USA
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mentee-info">
                                                <ul>
                                                    <li>Phone <span>+1 504 368 6874</span></li>
                                                    <li>Age <span>25 Years, Female</span></li>
                                                    <li>Blood Group <span>B+</span></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-4 col-xl-3">
                                    <div class="card widget-profile user-widget-profile">
                                        <div class="card-body">
                                            <div class="pro-widget-content">
                                                <div class="profile-info-widget">
                                                    <a href="#" class="booking-user-img">
                                                        <img
                                                            src="assets/img/user/user5.jpg"
                                                            alt="User Image"
                                                            />
                                                    </a>
                                                    <div class="profile-det-info">
                                                        <h3>Gina Moore</h3>
                                                        <div class="mentee-details">
                                                            <h5><b>Mentee ID :</b> 05</h5>
                                                            <h5 class="mb-0">
                                                                <i class="fas fa-map-marker-alt"></i> Florida,
                                                                USA
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mentee-info">
                                                <ul>
                                                    <li>Phone <span>+1 954 820 7887</span></li>
                                                    <li>Age <span>25 Years, Female</span></li>
                                                    <li>Blood Group <span>AB-</span></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-4 col-xl-3">
                                    <div class="card widget-profile user-widget-profile">
                                        <div class="card-body">
                                            <div class="pro-widget-content">
                                                <div class="profile-info-widget">
                                                    <a href="#" class="booking-user-img">
                                                        <img
                                                            src="assets/img/user/user6.jpg"
                                                            alt="User Image"
                                                            />
                                                    </a>
                                                    <div class="profile-det-info">
                                                        <h3>Elsie Gilley</h3>
                                                        <div class="mentee-details">
                                                            <h5><b>Mentee ID :</b> 06</h5>
                                                            <h5 class="mb-0">
                                                                <i class="fas fa-map-marker-alt"></i> Kentucky,
                                                                USA
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mentee-info">
                                                <ul>
                                                    <li>Phone <span>+1 315 384 4562</span></li>
                                                    <li>Age <span>14 Years, Female</span></li>
                                                    <li>Blood Group <span>O-</span></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-4 col-xl-3">
                                    <div class="card widget-profile user-widget-profile">
                                        <div class="card-body">
                                            <div class="pro-widget-content">
                                                <div class="profile-info-widget">
                                                    <a href="#" class="booking-user-img">
                                                        <img
                                                            src="assets/img/user/user7.jpg"
                                                            alt="User Image"
                                                            />
                                                    </a>
                                                    <div class="profile-det-info">
                                                        <h3>Joan Gardner</h3>
                                                        <div class="mentee-details">
                                                            <h5><b>Mentee ID :</b> 07</h5>
                                                            <h5 class="mb-0">
                                                                <i class="fas fa-map-marker-alt"></i>
                                                                California, USA
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mentee-info">
                                                <ul>
                                                    <li>Phone <span>+1 707 2202 603</span></li>
                                                    <li>Age <span>25 Years, Female</span></li>
                                                    <li>Blood Group <span>A-</span></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-4 col-xl-3">
                                    <div class="card widget-profile user-widget-profile">
                                        <div class="card-body">
                                            <div class="pro-widget-content">
                                                <div class="profile-info-widget">
                                                    <a href="#" class="booking-user-img">
                                                        <img
                                                            src="assets/img/user/user8.jpg"
                                                            alt="User Image"
                                                            />
                                                    </a>
                                                    <div class="profile-det-info">
                                                        <h3>Daniel Griffing</h3>
                                                        <div class="mentee-details">
                                                            <h5><b>Mentee ID :</b> 07</h5>
                                                            <h5 class="mb-0">
                                                                <i class="fas fa-map-marker-alt"></i> New
                                                                Jersey, USA
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mentee-info">
                                                <ul>
                                                    <li>Phone <span>+1 973 773 9497</span></li>
                                                    <li>Age <span>28 Years, Male</span></li>
                                                    <li>Blood Group <span>O+</span></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-4 col-xl-3">
                                    <div class="card widget-profile user-widget-profile">
                                        <div class="card-body">
                                            <div class="pro-widget-content">
                                                <div class="profile-info-widget">
                                                    <a href="#" class="booking-user-img">
                                                        <img
                                                            src="assets/img/user/user9.jpg"
                                                            alt="User Image"
                                                            />
                                                    </a>
                                                    <div class="profile-det-info">
                                                        <h3>Walter Roberson</h3>
                                                        <div class="mentee-details">
                                                            <h5><b>Mentee ID :</b> 09</h5>
                                                            <h5 class="mb-0">
                                                                <i class="fas fa-map-marker-alt"></i> Florida,
                                                                USA
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mentee-info">
                                                <ul>
                                                    <li>Phone <span>+1 850 358 4445</span></li>
                                                    <li>Age <span>28 Years, Male</span></li>
                                                    <li>Blood Group <span>A+</span></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-4 col-xl-3">
                                    <div class="card widget-profile user-widget-profile">
                                        <div class="card-body">
                                            <div class="pro-widget-content">
                                                <div class="profile-info-widget">
                                                    <a href="#" class="booking-user-img">
                                                        <img
                                                            src="assets/img/user/user10.jpg"
                                                            alt="User Image"
                                                            />
                                                    </a>
                                                    <div class="profile-det-info">
                                                        <h3>Robert Rhodes</h3>
                                                        <div class="mentee-details">
                                                            <h5><b>Mentee ID :</b> 10</h5>
                                                            <h5 class="mb-0">
                                                                <i class="fas fa-map-marker-alt"></i>
                                                                California, USA
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mentee-info">
                                                <ul>
                                                    <li>Phone <span>+1 858 259 5285</span></li>
                                                    <li>Age <span>19 Years, Male</span></li>
                                                    <li>Blood Group <span>B+</span></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-4 col-xl-3">
                                    <div class="card widget-profile user-widget-profile">
                                        <div class="card-body">
                                            <div class="pro-widget-content">
                                                <div class="profile-info-widget">
                                                    <a href="#" class="booking-user-img">
                                                        <img
                                                            src="assets/img/user/user11.jpg"
                                                            alt="User Image"
                                                            />
                                                    </a>
                                                    <div class="profile-det-info">
                                                        <h3>Harry Williams</h3>
                                                        <div class="mentee-details">
                                                            <h5><b>Mentee ID :</b> 11</h5>
                                                            <h5 class="mb-0">
                                                                <i class="fas fa-map-marker-alt"></i> Colorado,
                                                                USA
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mentee-info">
                                                <ul>
                                                    <li>Phone <span>+1 303 607 7075</span></li>
                                                    <li>Age <span>9 Years, Male</span></li>
                                                    <li>Blood Group <span>A-</span></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="blog-pagination mt-4">
                                <nav>
                                    <ul class="pagination justify-content-center">
                                        <li class="page-item disabled">
                                            <a class="page-link" href="#" tabindex="-1"
                                               ><i class="fas fa-angle-double-left"></i
                                                ></a>
                                        </li>
                                        <li class="page-item">
                                            <a class="page-link" href="#">1</a>
                                        </li>
                                        <li class="page-item active">
                                            <a class="page-link" href="#"
                                               >2 <span class="sr-only">(current)</span></a
                                            >
                                        </li>
                                        <li class="page-item">
                                            <a class="page-link" href="#">3</a>
                                        </li>
                                        <li class="page-item">
                                            <a class="page-link" href="#"
                                               ><i class="fas fa-angle-double-right"></i
                                                ></a>
                                        </li>
                                    </ul>
                                </nav>
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
                                        <img src="assets/img/logo.png" alt="logo" />
                                    </div>
                                    <div class="footer-about-content">
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                                            sed do eiusmod tempor incididunt ut labore et dolore magna
                                            aliqua.
                                        </p>
                                        <div class="social-icon">
                                            <ul>
                                                <li>
                                                    <a href="#" target="_blank"
                                                       ><i class="fab fa-facebook-f"></i>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#" target="_blank"
                                                       ><i class="fab fa-twitter"></i>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#" target="_blank"
                                                       ><i class="fab fa-linkedin-in"></i
                                                        ></a>
                                                </li>
                                                <li>
                                                    <a href="#" target="_blank"
                                                       ><i class="fab fa-instagram"></i
                                                        ></a>
                                                </li>
                                                <li>
                                                    <a href="#" target="_blank"
                                                       ><i class="fab fa-dribbble"></i>
                                                    </a>
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
                                        <li>
                                            <a href="dashboard-mentee.html">Mentee Dashboard</a>
                                        </li>
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
                                            <p>
                                                3556 Beech Street, San Francisco,<br />
                                                California, CA 94108
                                            </p>
                                        </div>
                                        <p>
                                            <i class="fas fa-phone-alt"></i>
                                            +1 315 369 5943
                                        </p>
                                        <p class="mb-0">
                                            <i class="fas fa-envelope"></i>
                                            <a
                                                href="https://mentoring.dreamguystech.com/cdn-cgi/l/email-protection"
                                                class="__cf_email__"
                                                data-cfemail="7518101b011a071c1b1235100d14180519105b161a18"
                                                >[email&#160;protected]</a
                                            >
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
                                        <p class="mb-0">
                                            &copy; 2020 Mentoring. All rights reserved.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
        </div>

        <script
            data-cfasync="false"
            src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"
        ></script>
        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <script src="assets/js/script.js"></script>
    </body>

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/mentee-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:09 GMT -->
</html>


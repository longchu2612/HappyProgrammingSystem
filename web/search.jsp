<%-- 
    Document   : search
    Created on : May 26, 2024, 11:33:11 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">



<head>
    <meta charset="utf-8">
    <title>CodeCoach</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">

    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

    <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">

    <link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css">

    <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>

    <div class="main-wrapper">




        <div class="breadcrumb-bar">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-md-8 col-12">
                        <nav aria-label="breadcrumb" class="page-breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            </ol>
                        </nav>
                        <h2 class="breadcrumb-title">2245 matches found for : Mentors In Florida</h2>
                    </div>
                    <div class="col-md-4 col-12 d-md-block d-none">
                        <div class="sort-by">
                            <span class="sort-title">Sort by</span>
                            <span class="sortby-fliter">
                                <select class="select">
                                    <option>Select</option>
                                    <option class="sorting">Rating</option>
                                    <option class="sorting">Popular</option>
                                    <option class="sorting">Latest</option>
                                    <option class="sorting">Free</option>
                                </select>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12 col-lg-4 col-xl-3 theiaStickySidebar">

                        <div class="card search-filter">
                            <div class="card-header">
                                <h4 class="card-title mb-0">Search Filter</h4>
                            </div>
                            <div class="card-body">
                                <div class="filter-widget">
                                    <div class="cal-icon">
                                        <input type="text" class="form-control datetimepicker"
                                            placeholder="Select Date">
                                    </div>
                                </div>
                                <div class="filter-widget">
                                    <h4>Gender</h4>
                                    <div>
                                        <label class="custom_check">
                                            <input type="checkbox" name="gender_type" checked>
                                            <span class="checkmark"></span> Male
                                        </label>
                                    </div>
                                    <div>
                                        <label class="custom_check">
                                            <input type="checkbox" name="gender_type">
                                            <span class="checkmark"></span> Female
                                        </label>
                                    </div>
                                </div>
                                <div class="filter-widget">
                                    <h4>Select Courses</h4>
                                    <div>
                                        <label class="custom_check">
                                            <input type="checkbox" name="select_specialist" checked>
                                            <span class="checkmark"></span> Digital Marketer
                                        </label>
                                    </div>
                                    <div>
                                        <label class="custom_check">
                                            <input type="checkbox" name="select_specialist" checked>
                                            <span class="checkmark"></span> UNIX, Calculus, Trigonometry
                                        </label>
                                    </div>
                                    <div>
                                        <label class="custom_check">
                                            <input type="checkbox" name="select_specialist">
                                            <span class="checkmark"></span> Computer Programming
                                        </label>
                                    </div>
                                    <div>
                                        <label class="custom_check">
                                            <input type="checkbox" name="select_specialist">
                                            <span class="checkmark"></span> ASP.NET,Computer Gaming
                                        </label>
                                    </div>
                                    <div>
                                        <label class="custom_check">
                                            <input type="checkbox" name="select_specialist">
                                            <span class="checkmark"></span> HTML, Css
                                        </label>
                                    </div>
                                    <div>
                                        <label class="custom_check">
                                            <input type="checkbox" name="select_specialist">
                                            <span class="checkmark"></span> VB, VB.net
                                        </label>
                                    </div>
                                </div>
                                <div class="btn-search">
                                    <button type="button" class="btn btn-block w-100">Search</button>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-12 col-lg-8 col-xl-9">

                        <div class="card">
                            <div class="card-body">
                                <div class="mentor-widget">
                                    <div class="user-info-left">
                                        <div class="mentor-img">
                                            <a href="profile.html">
                                                <img src="assets/img/user/user.jpg" class="img-fluid" alt="User Image">
                                            </a>
                                        </div>
                                        <div class="user-info-cont">
                                            <h4 class="usr-name"><a href="profile.html">Ruby Perrin</a></h4>
                                            <p class="mentor-type">Digital Marketer</p>
                                            <div class="rating">
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star"></i>
                                                <span class="d-inline-block average-rating">(17)</span>
                                            </div>
                                            <div class="mentor-details">
                                                <p class="user-location"><i class="fas fa-map-marker-alt"></i> Florida,
                                                    USA</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="user-info-right">
                                        <div class="user-infos">
                                            <ul>
                                                <li><i class="far fa-comment"></i> 17 Feedback</li>
                                                <li><i class="fas fa-map-marker-alt"></i> Florida, USA</li>
                                                <li><i class="far fa-money-bill-alt"></i> $300 - $1000 <i
                                                        class="fas fa-info-circle" data-bs-toggle="tooltip"
                                                        title="Lorem Ipsum"></i> </li>
                                            </ul>
                                        </div>
                                        <div class="mentor-booking">
                                            <a class="apt-btn" href="booking.html">Book Appointment</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="card">
                            <div class="card-body">
                                <div class="mentor-widget">
                                    <div class="user-info-left">
                                        <div class="mentor-img">
                                            <a href="profile.html">
                                                <img src="assets/img/user/user1.jpg" class="img-fluid" alt="User Image">
                                            </a>
                                        </div>
                                        <div class="user-info-cont">
                                            <h4 class="usr-name"><a href="profile.html">Darren Elder</a></h4>
                                            <p class="mentor-type">Digital Marketer</p>
                                            <div class="rating">
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star"></i>
                                                <span class="d-inline-block average-rating">(35)</span>
                                            </div>
                                            <div class="mentor-details">
                                                <p class="user-location"><i class="fas fa-map-marker-alt"></i> Newyork,
                                                    USA</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="user-info-right">
                                        <div class="user-infos">
                                            <ul>
                                                <li><i class="far fa-comment"></i> 35 Feedback</li>
                                                <li><i class="fas fa-map-marker-alt"></i> Newyork, USA</li>
                                                <li><i class="far fa-money-bill-alt"></i> $50 - $300 <i
                                                        class="fas fa-info-circle" data-bs-toggle="tooltip"
                                                        title="Lorem Ipsum"></i></li>
                                            </ul>
                                        </div>
                                        <div class="mentor-booking">
                                            <a class="apt-btn" href="booking.html">Book Appointment</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="card">
                            <div class="card-body">
                                <div class="mentor-widget">
                                    <div class="user-info-left">
                                        <div class="mentor-img">
                                            <a href="profile.html">
                                                <img src="assets/img/user/user2.jpg" class="img-fluid" alt="User Image">
                                            </a>
                                        </div>
                                        <div class="user-info-cont">
                                            <h4 class="usr-name"><a href="profile.html">Deborah Angel</a></h4>
                                            <p class="mentor-type">UNIX, Calculus, Trigonometry</p>
                                            <div class="rating">
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star"></i>
                                                <span class="d-inline-block average-rating">(27)</span>
                                            </div>
                                            <div class="mentor-details">
                                                <p class="user-location"><i class="fas fa-map-marker-alt"></i> Georgia,
                                                    USA</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="user-info-right">
                                        <div class="user-infos">
                                            <ul>
                                                <li><i class="far fa-comment"></i> 35 Feedback</li>
                                                <li><i class="fas fa-map-marker-alt"></i> Newyork, USA</li>
                                                <li><i class="far fa-money-bill-alt"></i> $100 - $400 <i
                                                        class="fas fa-info-circle" data-bs-toggle="tooltip"
                                                        title="Lorem Ipsum"></i></li>
                                            </ul>
                                        </div>
                                        <div class="mentor-booking">
                                            <a class="apt-btn" href="booking.html">Book Appointment</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="card">
                            <div class="card-body">
                                <div class="mentor-widget">
                                    <div class="user-info-left">
                                        <div class="mentor-img">
                                            <a href="profile.html">
                                                <img src="assets/img/user/user4.jpg" class="img-fluid" alt="User Image">
                                            </a>
                                        </div>
                                        <div class="user-info-cont">
                                            <h4 class="usr-name"><a href="profile.html">Sofia Brient</a></h4>
                                            <p class="mentor-type">Computer Programmin</p>
                                            <div class="rating">
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star"></i>
                                                <span class="d-inline-block average-rating">(4)</span>
                                            </div>
                                            <div class="mentor-details">
                                                <p class="user-location"><i class="fas fa-map-marker-alt"></i>
                                                    Louisiana, USA</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="user-info-right">
                                        <div class="user-infos">
                                            <ul>
                                                <li><i class="far fa-comment"></i> 4 Feedback</li>
                                                <li><i class="fas fa-map-marker-alt"></i> Newyork, USA</li>
                                                <li><i class="far fa-money-bill-alt"></i> $150 - $250 <i
                                                        class="fas fa-info-circle" data-bs-toggle="tooltip"
                                                        title="Lorem Ipsum"></i></li>
                                            </ul>
                                        </div>
                                        <div class="mentor-booking">
                                            <a class="apt-btn" href="booking.html">Book Appointment</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="card">
                            <div class="card-body">
                                <div class="mentor-widget">
                                    <div class="user-info-left">
                                        <div class="mentor-img">
                                            <a href="profile.html">
                                                <img src="assets/img/user/user5.jpg" class="img-fluid" alt="User Image">
                                            </a>
                                        </div>
                                        <div class="user-info-cont">
                                            <h4 class="usr-name"><a href="profile.html">Katharine Berthold</a></h4>
                                            <p class="mentor-type">ASP.NET, Computer Gaming</p>
                                            <div class="rating">
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star"></i>
                                                <span class="d-inline-block average-rating">(52)</span>
                                            </div>
                                            <div class="mentor-details">
                                                <p class="user-location"><i class="fas fa-map-marker-alt"></i> Texas,
                                                    USA</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="user-info-right">
                                        <div class="user-infos">
                                            <ul>
                                                <li><i class="far fa-comment"></i> 52 Feedback</li>
                                                <li><i class="fas fa-map-marker-alt"></i> Texas, USA</li>
                                                <li><i class="far fa-money-bill-alt"></i> $100 - $500 <i
                                                        class="fas fa-info-circle" data-bs-toggle="tooltip"
                                                        title="Lorem Ipsum"></i></li>
                                            </ul>
                                        </div>
                                        <div class="mentor-booking">
                                            <a class="apt-btn" href="booking.html">Book Appointment</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="load-more text-center">
                            <a class="btn btn-primary btn-sm" href="javascript:void(0);">Load More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>




    </div>


    <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="assets/js/jquery-3.6.0.min.js"></script>

    <script src="assets/js/bootstrap.bundle.min.js"></script>

    <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
    <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

    <script src="assets/plugins/select2/js/select2.min.js"></script>

    <script src="assets/js/moment.min.js"></script>
    <script src="assets/js/bootstrap-datetimepicker.min.js"></script>

    <script src="assets/js/script.js"></script>
</body>

</html>

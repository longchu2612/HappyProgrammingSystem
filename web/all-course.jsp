<%-- 
    Document   : search
    Created on : May 26, 2024, 11:33:11 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
                                    <li class="breadcrumb-item"><a href="home">Back to home</a></li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">${listSize} courses in system:</h2>
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

                            <form action="Booking" method="POST">
                                <input type="hidden" name="service" value="filter_skill"/>
                                <div class="card search-filter">
                                    <div class="card-header">
                                        <h4 class="card-title mb-0">Filter</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="filter-widget">
                                            <h4>Select Courses</h4>
                                            <c:forEach var="skill" items="${requestScope.listSkill}">
                                                <div>
                                                    <label class="custom_check">
                                                        <input type="checkbox" value="${skill.skillId}" name="select_specialist" 
                                                               <c:forEach var="selectedSkill" items="${requestScope.selectedSkills}">
                                                                   <c:if test="${skill.skillId == selectedSkill}">
                                                                       checked
                                                                   </c:if>
                                                               </c:forEach>
                                                               />
                                                        <span class="checkmark"></span> ${skill.skillName}
                                                    </label>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <div class="btn-search">
                                            <button type="submit" class="btn btn-block w-100">Search</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-md-12 col-lg-8 col-xl-9">
                            <c:if test="${listM.isEmpty()}">
                                <div class="card">
                                    <div class="card-body">
                                        <p class="alert text-danger">This skill currently has no course, please come back later</p>
                                    </div>
                                </div>
                            </c:if>
                            <c:forEach items="${listM}" var="mentor">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="mentor-widget">
                                            <div class="user-info-left">
                                                <div class="mentor-img">
                                                    <a href="#">
                                                        <img src="${mentor.avatar}" class="img-fluid" alt="User Image">
                                                    </a>
                                                </div>
                                                <div class="user-info-cont">
                                                    <h4 class="usr-name"><a href="#">${mentor.fullname}</a></h4>
                                                    <p class="mentor-type">
                                                        <c:forEach items="${mentor.listSkill}" var="s">
                                                        <p class="py-2 mx-1 btn btn-outline-dark">${s.skillName}</p>
                                                    </c:forEach>
                                                    </p>
                                                    <div class="rating">
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star"></i>
                                                        <span class="d-inline-block average-rating">(17)</span>
                                                    </div>
                                                    <div class="mentor-details">
                                                        <p class="user-location"><i class="fas fa-map-marker-alt"></i> ${mentor.address}</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="user-info-right">
                                                <div class="user-infos">
                                                    <ul>
                                                        <li><i class="far fa-comment"></i> 17 Feedback</li>
                                                        <li><i class="fas fa-map-marker-alt"></i> ${mentor.address}</li>
                                                        <li><i class="far fa-money-bill-alt"></i>  <i
                                                                class="fas fa-info-circle" data-bs-toggle="tooltip"
                                                                title="Lorem Ipsum"></i> </li>
                                                    </ul>
                                                </div>
                                                <div class="mentor-booking">
                                                    <!--                                                    <form action="book_schedule?service=course_details" method="get">
                                                                                                            <input type="hidden" name="mentorId" value="">
                                                                                                            <input type="hidden" name="cvId" value="">-->
                                                    <button class="btn btn-primary" onclick="window.location.href = 'book_schedule?mentorId=${mentor.id}&cvId=${mentor.cvId}'">Details</button>
                                                    <!--                                                    </form>-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
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

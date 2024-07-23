<%-- 
    Document   : myRequestMentee
    Created on : Jul 21, 2024, 11:11:48 AM
    Author     : asus
--%>

<%-- 
    Document   : myRequest
    Created on : Jul 20, 2024, 11:27:16 AM
    Author     : asus
--%>

<%-- 
    Document   : listSchedule
    Created on : Jun 7, 2024, 3:55:57 AM
    Author     : asus
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date, dao.ScheduleDAO" %>
<%@ page import="model.Request" %>
<%@ page import="model.Account" %>
<%@ page import="model.Skill" %>
<%@ page import="model.Schedule" %>
<%@ page import="model.Request_Course" %>

<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/bookings.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:08 GMT -->
    <head>
        <meta charset="utf-8">
        <title>Mentoring</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <style>
            .icon-button {
                border: none;
                background: none;
                font-size: 1.2rem; /* Adjusted font size for smaller icons */
                color: #007bff;
                cursor: pointer;
                transition: transform 0.3s, color 0.3s;
                padding: 0.5rem; /* Added padding for better click area */
            }

            .icon-button:hover {
                transform: scale(1.1);
                color: #0056b3;
            }

            .icon-button.view-schedule {
                color: #28a745;
            }

            .icon-button.view-schedule:hover {
                color: #218838;
            }
            .modal {
                display: none; /* Ban đầu ẩn modal */
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgb(0,0,0);
                background-color: rgba(0,0,0,0.4);
                padding-top: 60px;
            }

            .modal-content {
                background-color: #fefefe;
                margin: 5% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
                max-width: 500px;
                border-radius: 10px;
            }
            .modal-header, .modal-body, .modal-footer {
                padding: 10px;
            }
            .modal-header {
                font-size: 20px;
                font-weight: bold;
            }
            .modal-footer {
                text-align: right;
            }
            .modal-footer button {
                margin-left: 10px;
            }
        </style>

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
                                        <li><a href="dashboard.html"><i class="fas fa-home"></i>Dashboard <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="bookings.html" class="active"><i class="fas fa-clock"></i>Bookings <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="schedule-timings.html"><i class="fas fa-hourglass-start"></i>Schedule Timings <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="chat.html"><i class="fas fa-comments"></i>Messages <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="invoices.html"><i class="fas fa-file-invoice"></i>Invoices <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="reviews.html"><i class="fas fa-eye"></i>Reviews <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="blog.html"><i class="fab fa-blogger-b"></i>Blog <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="profile.html"><i class="fas fa-user-cog"></i>Profile <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="login.html"><i class="fas fa-sign-out-alt"></i>Logout <span><i class="fas fa-chevron-right"></i></span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>


                        <div class="col-md-7 col-lg-8 col-xl-9">
                            <h3 class="pb-3">My Request</h3>

                            <div class="tab-pane show active" id="mentee-list">
                                <div class="card card-table">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-hover table-center mb-0">
                                                <thead>
                                                    <tr>
                                                        <th>Name Of Mentor</th>
                                                        <th>Skill</th>
                                                        <th>Create Date</th>
                                                        <th>Status</th>
                                                        <th>Note</th>
                                                        <th>Update</th>
                                                        <th>Payment</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${requestScope.listRequestOfMentee}" var="request_course">
                                                        <tr>

                                                            <td>
                                                                <h2 class="table-avatar">
                                                                    <a href="#" class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="assets/img/user/user2.jpg" alt="User Image"></a>
                                                                    <a href="#">${request_course.getMentor().getAccount_name()}</a>
                                                                </h2>
                                                            </td>

                                                            <td>
                                                                ${request_course.getSkill().getName()}
                                                            </td>
                                                            <td>
                                                                ${request_course.getRequest().getCreatedDate()}
                                                            </td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${request_course.getStatus() == '1'}">
                                                                        <p class="text-primary">Pending</p>
                                                                    </c:when>
                                                                    <c:when test="${request_course.getStatus() == '2'}">
                                                                        <p class="text-success">Accept</p>
                                                                    </c:when>
                                                                    <c:when test="${request_course.getStatus() == '3'}">
                                                                        <p class="text-danger">Reject</p>
                                                                    </c:when>
                                                                    <c:when test="${request_course.getStatus() == '5'}">
                                                                        <p class="text-primary">Open</p>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        Unknown Status
                                                                    </c:otherwise>

                                                                </c:choose>

                                                            </td>
                                                            <td>
                                                                <button type="button" class="icon-button" onclick="displayNote('${request_course.getNote()}')">
                                                                    <i class="fas fa-sticky-note"></i>
                                                                </button>
                                                            </td>
                                                            <td>
<!--                                                                <button type="button" class="btn btn-outline-secondary" onclick="window.location.href = 'update_request_mentor?request_id=${request_course.getRepc_id()}'">Details</button>-->

                                                                <c:choose>
                                                                    <c:when test="${request_course.getStatus() == '1'}">
                                                                        No Action
                                                                    </c:when>
                                                                    <c:when test="${request_course.getStatus() == '2'}">
                                                                        No Action
                                                                    </c:when>
                                                                    <c:when test="${request_course.getStatus() == '3'}">
                                                                        <a href="update_request_detail?request_id=${request_course.getRequest().getId()}&mentor_id=${request_course.getMentor().getAccount_id()}&skill_id=${request_course.getSkill().getSkillId()}" class="btn btn-outline-secondary">
                                                                            <i class="fas fa-edit"></i> 
                                                                        </a>
                                                                        <a href="updateSchedulePage.jsp?request_id=${request_course.getRequest().getId()}" class="btn btn-outline-secondary">
                                                                            <i class="fas fa-calendar-day"></i>
                                                                        </a>
                                                                        <a href="updateStatusServlet?request_id=${request_course.getRequest().getId()}" class="icon-button" title="Update Status">
                                                                            <i class="fas fa-check"></i>
                                                                        </a>
                                                                    </c:when>
                                                                    <c:when test="${request_course.getStatus() == '5'}">

                                                                    </c:when>

                                                                </c:choose>
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            <div id="note-modal" class="modal">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        Note
                                                    </div>
                                                    <div id="modal-body" class="modal-body">
                                                        <!-- Nội dung ghi chú sẽ được hiển thị ở đây -->
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button class="btn btn-outline-secondary" onclick="closeModal()">OK</button>
                                                        <button class="btn btn-outline-secondary" onclick="closeModal()">Cancel</button>
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
                                            <a href="https://mentoring.dreamguystech.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="dbb6beb5afb4a9b2b5bc9bbea3bab6abb7bef5b8b4b6">[email&#160;protected]</a>
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
        <script>

                                                            function viewRequest(requestId, skillId) {
                                                                window.location.href = 'view_request_detail?requestId=' + requestId + '&skillId=' + skillId;
                                                            }
                                                            function viewSchedule(scheduleId) {
                                                                window.location.href = 'view_schedule_detail?scheduleId=' + scheduleId;
                                                            }

                                                            function submitRequest(action, requestId) {
                                                                var reason = prompt("Please enter the reason for " + action + ":");

                                                                if (reason !== null && reason.trim() !== "") {
                                                                    // Tạo dữ liệu cần gửi
                                                                    var data = new URLSearchParams();
                                                                    data.append("action", action);
                                                                    data.append("requestId", requestId);
                                                                    data.append("reason", reason);

                                                                    // Sử dụng fetch API để gửi yêu cầu POST đến servlet
                                                                    fetch('my_request', {
                                                                        method: 'POST',
                                                                        headers: {
                                                                            'Content-Type': 'application/x-www-form-urlencoded'
                                                                        },
                                                                        body: data
                                                                    })
                                                                            .then(response => {
                                                                                // Sau khi xử lý yêu cầu, chuyển hướng tới trang JSP mong muốn
                                                                                window.location.href = 'my_request';
                                                                            })
                                                                            .catch(error => {
                                                                                console.error('Error:', error);
                                                                                alert("An error occurred while processing the request.");
                                                                            });
                                                                } else {
                                                                    alert("Reason is required to proceed.");
                                                                }
                                                            }

                                                            function displayNote(note) {
                                                                if (note && note.trim() !== "") {
                                                                    document.getElementById('modal-body').innerText = note;
                                                                    document.getElementById('note-modal').style.display = "block"; // Hiển thị modal khi có nội dung
                                                                }
                                                            }
                                                            function closeModal() {
                                                                document.getElementById('note-modal').style.display = "none"; // Ẩn modal
                                                            }

                                                            window.onclick = function (event) {
                                                                var modal = document.getElementById('note-modal');
                                                                if (event.target == modal) {
                                                                    modal.style.display = "none";
                                                                }
                                                            }


        </script>
    </body>

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/bookings.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:08 GMT -->
</html>




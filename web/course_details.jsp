<%-- 
    Document   : booking
    Created on : Jun 25, 2024, 7:22:44 PM
    Author     : catmi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="helper.ScheduleHelper" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.List" %>
<%@page import="model.Slot" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
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
                                    <li class="breadcrumb-item"><a href="Booking?service=all_skill">Back to courses</a></li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12 d-flex">
                            <div class="card col-6">
                                <div class="card-body">
                                    <h2>Mentor Information:</h2>
                                    <div class="booking-user-info">
                                        <a href="#" class="booking-user-img">
                                            <img src="${requestScope.mentor.avatar}" alt="User Image">
                                        </a>
                                        <div class="booking-info">
                                            <h4><a href="#">${requestScope.mentor.fullname}</a></h4>
                                            <div class="rating">
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star-half-alt filled"></i>
                                                <i class="fas fa-star"></i>
                                                <span class="d-inline-block average-rating">35</span>
                                            </div>
                                            <p class="text-muted mb-0"><Strong>Profession:</Strong> ${requestScope.mentor_cv.job}</p>
                                            <p class="text-muted mb-0"><Strong>Date of birth:</Strong> ${requestScope.mentor.dateOfBirth}</p>
                                            <p class="text-muted mb-0"><Strong>Phone:</Strong> ${requestScope.mentor.phone}</p>
                                            <p class="text-muted mb-0"><Strong>Email address:</Strong> ${requestScope.mentor.email}</p>
                                            <p class="text-muted mb-0"><i class="fas fa-map-marker-alt"></i> ${requestScope.mentor.address}</p>
                                            <p class="text-muted mb-0"><i class="far fa-money-bill-alt"></i> ${requestScope.mentor_cv.rate}/hours</p>
                                            <div class="d-flex">
                                                <p class="text-muted mb-0"><Strong>Skills: </Strong>
                                                        <c:forEach items="${listS}" var="s">
                                                            ${s.skillName},
                                                    </c:forEach>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card col-6">
                                <div class="card-body">
                                    <div class="booking-user-info">
                                        <div class="booking-info">
                                            <div>
                                                <Strong><i class=""></i>Introduction:</Strong>
                                                <p class="mb-0"> ${requestScope.mentor_cv.introduction}</p>
                                            </div>
                                            <div>
                                                <Strong>Achievements:</Strong>
                                                <p class="mb-0"> ${requestScope.mentor_cv.achievements}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <form id="updateStatusSchedule" action="#" method="Post"> 

                            <div class="row form-row">
                                <div class="col-12 col-md-2 mb-3">
                                    <label>Month:</label>
                                    <select class="form-select" name="selectMonth" aria-label="Default select example">
                                        <option value="1" ${requestScope.month == 1 ? 'selected' : ''}>January </option>
                                        <option value="2" ${requestScope.month == 2 ? 'selected' : ''}>February</option>
                                        <option value="3" ${requestScope.month == 3 ? 'selected' : ''}>March</option>
                                        <option value="4" ${requestScope.month == 4 ? 'selected' : ''}>April</option>
                                        <option value="5" ${requestScope.month == 5 ? 'selected' : ''}>May</option>
                                        <option value="6" ${requestScope.month == 6 ? 'selected' : ''}>June</option>
                                        <option value="7" ${requestScope.month == 7 ? 'selected' : ''}>July</option>
                                        <option value="8" ${requestScope.month == 8 ? 'selected' : ''}>August</option>
                                        <option value="9" ${requestScope.month == 9 ? 'selected' : ''}>September</option>
                                        <option value="10" ${requestScope.month == 10 ? 'selected' : ''} >October</option>
                                        <option value="11" ${requestScope.month == 11 ? 'selected' : ''}>November</option>
                                        <option value="12" ${requestScope.month == 12 ? 'selected' : ''}>December</option>
                                    </select>
                                </div>
                                <div class="col-12 col-md-12">

                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th class="text-center">
                                                    Year 2024
                                                </th>
                                                <th>Monday</th>
                                                <th>Tuesday</th>
                                                <th>Wednesday</th>
                                                <th>Thursday</th>
                                                <th>Friday</th>
                                                <th>Saturday</th>
                                                <th>Sunday</th>
                                            </tr>

                                        </thead>
                                        <tbody>
                                            <%
                                               List<Slot> slots= (List<Slot>) request.getAttribute("slots");
                                            %>

                                            <tr>
                                                <td>Slot 1 (7h30 --> 9h30)</td>
                                                <td><input type="checkbox" id="mon1" name="slot_1" value="1" data-slot="1" data-day-index="0" <%= ScheduleHelper.isCheckedSlot(slots, 1, 1) %> disabled  ></td>
                                                <td><input type="checkbox" id="tue1" name="slot_1" value="2" data-slot="1" data-day-index="1" <%= ScheduleHelper.isCheckedSlot(slots, 1, 2) %> disabled ></td>
                                                <td><input type="checkbox" id="wed1" name="slot_1" value="3" data-slot="1" data-day-index="2" <%= ScheduleHelper.isCheckedSlot(slots, 1, 3)%> disabled ></td>
                                                <td><input type="checkbox" id="thu1" name="slot_1" value="4" data-slot="1" data-day-index="3" <%= ScheduleHelper.isCheckedSlot(slots, 1, 4)%> disabled ></td>
                                                <td><input type="checkbox" id="fri1" name="slot_1" value="5" data-slot="1" data-day-index="4" <%= ScheduleHelper.isCheckedSlot(slots, 1, 5)%> disabled ></td>
                                                <td><input type="checkbox" id="sat1" name="slot_1" value="6" data-slot="1" data-day-index="5" <%= ScheduleHelper.isCheckedSlot(slots, 1, 6)%> disabled ></td>
                                                <td><input type="checkbox" id="sun1" name="slot_1" value="7" data-slot="1" data-day-index="6" <%= ScheduleHelper.isCheckedSlot(slots, 1, 7)%> disabled ></td>
                                            </tr>


                                            <tr>
                                                <td>Slot 2 (9h45 --> 11h45)</td>
                                                <td><input type="checkbox" id="mon2" name="slot_2" value ="1" data-slot="2" data-day-index="0" <%= ScheduleHelper.isCheckedSlot(slots, 2, 1) %> disabled ></td>
                                                <td><input type="checkbox" id="tue2" name="slot_2" value ="2"  data-slot="2" data-day-index="1" <%= ScheduleHelper.isCheckedSlot(slots, 2, 2) %> disabled></td>
                                                <td><input type="checkbox" id="wed2" name="slot_2" value ="3" data-slot="2" data-day-index="2" <%= ScheduleHelper.isCheckedSlot(slots, 2, 3) %> disabled></td>
                                                <td><input type="checkbox" id="thu2" name="slot_2" value ="4" data-slot="2" data-day-index="3" <%= ScheduleHelper.isCheckedSlot(slots, 2, 4)%> disabled></td>
                                                <td><input type="checkbox" id="fri2" name="slot_2" value ="5"  data-slot="2" data-day-index="4" <%= ScheduleHelper.isCheckedSlot(slots, 2, 5)%> disabled></td>
                                                <td><input type="checkbox" id="sat2" name="slot_2" value ="6" data-slot="2" data-day-index="5" <%= ScheduleHelper.isCheckedSlot(slots, 2, 6)%> disabled></td>
                                                <td><input type="checkbox" id="sun2" name="slot_2" value ="7" data-slot="2" data-day-index="6" <%= ScheduleHelper.isCheckedSlot(slots, 2, 7)%> disabled></td>
                                            </tr>


                                            <tr>
                                                <td>Slot 3 (13h30 --> 15h30)</td>
                                                <td><input type="checkbox" id="mon3" name="slot_3" value ="1" data-slot="3" data-day-index="0" <%= ScheduleHelper.isCheckedSlot(slots, 3, 1) %> disabled ></td>
                                                <td><input type="checkbox" id="tue3" name="slot_3" value ="2" data-slot="3" data-day-index="1" <%= ScheduleHelper.isCheckedSlot(slots, 3, 2) %> disabled></td>
                                                <td><input type="checkbox" id="wed3" name="slot_3" value ="3" data-slot="3" data-day-index="2" <%= ScheduleHelper.isCheckedSlot(slots, 3, 3) %> disabled></td>
                                                <td><input type="checkbox" id="thu3" name="slot_3" value ="4" data-slot="3" data-day-index="3" <%= ScheduleHelper.isCheckedSlot(slots, 3, 4)%> disabled></td>
                                                <td><input type="checkbox" id="fri3" name="slot_3" value ="5" data-slot="3" data-day-index="4" <%= ScheduleHelper.isCheckedSlot(slots, 3, 5)%> disabled></td>
                                                <td><input type="checkbox" id="sat3" name="slot_3" value ="6" data-slot="3" data-day-index="5" <%= ScheduleHelper.isCheckedSlot(slots, 3, 6)%> disabled></td>
                                                <td><input type="checkbox" id="sun3" name="slot_3" value ="7" data-slot="3" data-day-index="6" <%= ScheduleHelper.isCheckedSlot(slots, 3, 7)%> disabled></td>
                                            </tr>


                                            <tr>
                                                <td>Slot 4 (16h --> 18h)</td>
                                                <td><input type="checkbox" id="mon4" name="slot_4" value ="1" data-slot="4" data-day-index="0" <%= ScheduleHelper.isCheckedSlot(slots, 4,1) %> disabled ></td>
                                                <td><input type="checkbox" id="tue4" name="slot_4" value ="2" data-slot="4" data-day-index="1" <%= ScheduleHelper.isCheckedSlot(slots, 4,2) %> disabled></td>
                                                <td><input type="checkbox" id="wed4" name="slot_4" value ="3" data-slot="4" data-day-index="2" <%= ScheduleHelper.isCheckedSlot(slots, 4,3) %> disabled></td>
                                                <td><input type="checkbox" id="thu4" name="slot_4" value ="4" data-slot="4" data-day-index="3" <%= ScheduleHelper.isCheckedSlot(slots, 4, 4)%> disabled></td>
                                                <td><input type="checkbox" id="fri4" name="slot_4" value ="5" data-slot="4" data-day-index="4" <%= ScheduleHelper.isCheckedSlot(slots, 4, 5)%> disabled></td>
                                                <td><input type="checkbox" id="sat4" name="slot_4" value ="6" data-slot="4" data-day-index="5" <%= ScheduleHelper.isCheckedSlot(slots, 4, 6)%> disabled></td>
                                                <td><input type="checkbox" id="sun4" name="slot_4" value ="7" data-slot="4" data-day-index="6" <%= ScheduleHelper.isCheckedSlot(slots, 4, 7)%> disabled></td>
                                            </tr>


                                            <tr>
                                                <td>Slot 5 (19h --> 21h)</td>
                                                <td><input type="checkbox" id="mon5" name="slot_5" value="1" data-slot="5" data-day-index="0" <%= ScheduleHelper.isCheckedSlot(slots, 5,1) %> disabled ></td>
                                                <td><input type="checkbox" id="tue5" name="slot_5" value="2" data-slot="5" data-day-index="1" <%= ScheduleHelper.isCheckedSlot(slots, 5, 2) %> disabled></td>
                                                <td><input type="checkbox" id="wed5" name="slot_5" value ="3" data-slot="5" data-day-index="2" <%= ScheduleHelper.isCheckedSlot(slots, 5, 3) %> disabled></td>
                                                <td><input type="checkbox" id="thu5" name="slot_5" value ="4" data-slot="5" data-day-index="3" <%= ScheduleHelper.isCheckedSlot(slots, 5, 4)%> disabled></td>
                                                <td><input type="checkbox" id="fri5" name="slot_5" value ="5" data-slot="5" data-day-index="4" <%= ScheduleHelper.isCheckedSlot(slots, 5, 5)%> disabled></td>
                                                <td><input type="checkbox" id="sat5" name="slot_5" value ="6" data-slot="5" data-day-index="5" <%= ScheduleHelper.isCheckedSlot(slots, 5, 6)%> disabled></td>
                                                <td><input type="checkbox" id="sun5" name="slot_5" value ="7" data-slot="5" data-day-index="6" <%= ScheduleHelper.isCheckedSlot(slots, 5, 7)%> disabled></td>
                                            </tr>

                                        </tbody>

                                    </table>
                                </div>
                            </div>
                        </form>
                    </div>
                    <form action="request?service=create_request" method="post">
                        <input type="hidden" name="mentorId" value="${requestScope.mentor_cv.accountID}">
                        <input type="hidden" name="cvId" value="${requestScope.mentor_cv.id}">
                        <button type="submit" class="btn btn-block btn-course">Create request</button>
                    </form>
                </div>
            </div>


            <jsp:include page="footer.jsp"></jsp:include>

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

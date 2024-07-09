<%-- 
    Document   : request-booking
    Created on : Jul 3, 2024, 7:31:58 PM
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
<html>
    <head>
        <meta charset="utf-8">
        <title>Create request</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">

    </head>
    <body>

        <div class="main-wrapper m-5">

            <jsp:include page="header.jsp"/>

            <div class="container">
                <div class="container-fluid">
                    <form action="request?service=add" method="post" onsubmit="return validateForm()">
                        <div class="row">
                            <div class="card">
                                <div class="card-body">
                                    <h2 class="text-center text-danger">Request to ${acc.fullname}</h2>

                                    <div class="form-group">
                                        <label for="title" class="form-label"><h3>Title:</h3></label>
                                        <input type="text" class="form-control" id="title" name="title" required value="${req.title}">
                                    </div>
                                    <div class="form-group">
                                        <label for="skills" class="form-label"><h3>Skill:</h3></label>
                                        <div class="d-flex">
                                            <c:forEach items="${listS}" var="s">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" id="skill-${s.skillId}" name="skills" value="${s.skillId}">
                                                    <label class="form-check-label" for="skill-${s.skillId}">${s.skillName}</label>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="deadline" class="form-label"><h3>Deadline:</h3></label>
                                        <input type="datetime-local" class="form-control" id="deadline" name="deadline" required value="${req.deadline}">
                                    </div>
                                    <div class="form-group">
                                        <label for="content" class="form-label"><h3>Content:</h3></label>
                                        <textarea class="form-control" id="content" name="content" rows="5" required>${req.content}</textarea>
                                    </div>
                                    <div id="updateStatusSchedule"> 

                                        <div class="row form-row">
                                            <div class="col-12 col-md-2 mb-3">
                                                <label>Month:</label>
                                                <select class="form-select" id="selectMonth" name="selectMonth" aria-label="Default select example">
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
                                            <div class="col-12 col-md-2 mb-3">
                                                <label>Week:</label>
                                                <select class="form-select" id="selectWeek" name="selectWeek" aria-label="Default select example">
                                                    <!-- Weeks will be populated here by JavaScript -->
                                                </select>
                                            </div>
                                            <div class="col-12 col-md-8 mb-3 d-flex">
                                                <div class="form-group">
                                                    <label class="form-label">From:</label>
                                                    <input class="form-control" type="date" id="fromDate" name="fromDate" disabled>
                                                </div>
                                                <div class="form-group mx-2">
                                                    <label class="form-label">To:</label>
                                                    <input class="form-control" type="date" id="toDate" name="toDate" disabled>
                                                </div>
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

                                                        <tr>
                                                            <td>Slot 1 (7h30 --> 9h30)</td>
                                                            <td><input type="checkbox" id="mon1" name="slot_1" value="1" data-slot="1" data-day-index="0" ></td>
                                                            <td><input type="checkbox" id="tue1" name="slot_1" value="2" data-slot="1" data-day-index="1" ></td>
                                                            <td><input type="checkbox" id="wed1" name="slot_1" value="3" data-slot="1" data-day-index="2" ></td>
                                                            <td><input type="checkbox" id="thu1" name="slot_1" value="4" data-slot="1" data-day-index="3" ></td>
                                                            <td><input type="checkbox" id="fri1" name="slot_1" value="5" data-slot="1" data-day-index="4" ></td>
                                                            <td><input type="checkbox" id="sat1" name="slot_1" value="6" data-slot="1" data-day-index="5" ></td>
                                                            <td><input type="checkbox" id="sun1" name="slot_1" value="7" data-slot="1" data-day-index="6" ></td>
                                                        </tr>


                                                        <tr>
                                                            <td>Slot 2 (9h45 --> 11h45)</td>
                                                            <td><input type="checkbox" id="mon2" name="slot_2" value ="1" data-slot="2" data-day-index="0" ></td>
                                                            <td><input type="checkbox" id="tue2" name="slot_2" value ="2"  data-slot="2" data-day-index="1"></td>
                                                            <td><input type="checkbox" id="wed2" name="slot_2" value ="3" data-slot="2" data-day-index="2"  ></td>
                                                            <td><input type="checkbox" id="thu2" name="slot_2" value ="4" data-slot="2" data-day-index="3"  ></td>
                                                            <td><input type="checkbox" id="fri2" name="slot_2" value ="5"  data-slot="2" data-day-index="4"  ></td>
                                                            <td><input type="checkbox" id="sat2" name="slot_2" value ="6" data-slot="2" data-day-index="5"  ></td>
                                                            <td><input type="checkbox" id="sun2" name="slot_2" value ="7" data-slot="2" data-day-index="6"  ></td>
                                                        </tr>


                                                        <tr>
                                                            <td>Slot 3 (13h30 --> 15h30)</td>
                                                            <td><input type="checkbox" id="mon3" name="slot_3" value ="1" data-slot="3" data-day-index="0"  ></td>
                                                            <td><input type="checkbox" id="tue3" name="slot_3" value ="2" data-slot="3" data-day-index="1"  ></td>
                                                            <td><input type="checkbox" id="wed3" name="slot_3" value ="3" data-slot="3" data-day-index="2"  ></td>
                                                            <td><input type="checkbox" id="thu3" name="slot_3" value ="4" data-slot="3" data-day-index="3"  ></td>
                                                            <td><input type="checkbox" id="fri3" name="slot_3" value ="5" data-slot="3" data-day-index="4"  ></td>
                                                            <td><input type="checkbox" id="sat3" name="slot_3" value ="6" data-slot="3" data-day-index="5" ></td>
                                                            <td><input type="checkbox" id="sun3" name="slot_3" value ="7" data-slot="3" data-day-index="6"  ></td>
                                                        </tr>


                                                        <tr>
                                                            <td>Slot 4 (16h --> 18h)</td>
                                                            <td><input type="checkbox" id="mon4" name="slot_4" value ="1" data-slot="4" data-day-index="0"  ></td>
                                                            <td><input type="checkbox" id="tue4" name="slot_4" value ="2" data-slot="4" data-day-index="1"  ></td>
                                                            <td><input type="checkbox" id="wed4" name="slot_4" value ="3" data-slot="4" data-day-index="2"  ></td>
                                                            <td><input type="checkbox" id="thu4" name="slot_4" value ="4" data-slot="4" data-day-index="3"  ></td>
                                                            <td><input type="checkbox" id="fri4" name="slot_4" value ="5" data-slot="4" data-day-index="4"  ></td>
                                                            <td><input type="checkbox" id="sat4" name="slot_4" value ="6" data-slot="4" data-day-index="5"  ></td>
                                                            <td><input type="checkbox" id="sun4" name="slot_4" value ="7" data-slot="4" data-day-index="6"  ></td>
                                                        </tr>


                                                        <tr>
                                                            <td>Slot 5 (19h --> 21h)</td>
                                                            <td><input type="checkbox" id="mon5" name="slot_5" value="1" data-slot="5" data-day-index="0"  ></td>
                                                            <td><input type="checkbox" id="tue5" name="slot_5" value="2" data-slot="5" data-day-index="1"  ></td>
                                                            <td><input type="checkbox" id="wed5" name="slot_5" value ="3" data-slot="5" data-day-index="2"  ></td>
                                                            <td><input type="checkbox" id="thu5" name="slot_5" value ="4" data-slot="5" data-day-index="3"  ></td>
                                                            <td><input type="checkbox" id="fri5" name="slot_5" value ="5" data-slot="5" data-day-index="4"  ></td>
                                                            <td><input type="checkbox" id="sat5" name="slot_5" value ="6" data-slot="5" data-day-index="5"  ></td>
                                                            <td><input type="checkbox" id="sun5" name="slot_5" value ="7" data-slot="5" data-day-index="6"  ></td>
                                                        </tr>

                                                    </tbody>

                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="d-none">
                            <input name="mentorId" value="${acc.account_id}">
                            <input name="amount" value="${cv.rate}">
                        </div>
                        <h3 class="text-success">${mess}</h3>
                        <div class="d-flex justify-content-around mb-5">
                            <button type="submit" class="btn btn-primary" name="action" value="draft" onclick="saveDraft()">Save Draft</button>
                            <button type="submit" class="btn btn-success" name="action" value="submit" >Submit</button>
                            <a href="Booking" class="btn btn-danger">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <script src="assets/js/script.js"></script>
        <script src="assets/js/date-change.js"></script>
        <script>
            function saveDraft(){
                alert("Your request has been saved.");
            }
            function submitOrder(){
                alert("Your request has been sent.");
            }
        </script>
    </body>
</html>

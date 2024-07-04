<%-- 
    Document   : list-schedule
    Created on : Jun 6, 2024, 12:30:04 AM
    Author     : asus
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/admin/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:31 GMT -->
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Mentoring - Dashboard</title>

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <link rel="stylesheet" href="assets/css/feathericon.min.css">

        <link rel="stylesheet" href="assets/plugins/morris/morris.css">

        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body>

        <div class="main-wrapper">

            <jsp:include page="admin-header.jsp"></jsp:include>


            <jsp:include page="admin-sidebar.jsp"></jsp:include>


            <div class="page-wrapper">
                <div class="content container-fluid">

                    <div class="page-header">
                        <div class="row">
                            <div class="col-sm-12">
                                <h3 class="page-title">Manage Schedule</h3>

                            </div>
                        </div>
                    </div>

                    <form id="statusForm" action="manage_schedule" method="Post"> 
                        <div class="row">
                            <div class="col-md-3 mb-3 d-flex align-items-center">
                                <label for="statusFilter">Status:</label>
                                <select class="form-select ms-3" name="selectStatus" id="statusFilter" aria-label="Default select example">
                                    <option value="1" ${requestScope.status == '1' ? 'selected' : ''}>Pending</option>
                                    <option value="2" ${requestScope.status == '2' ? 'selected' : ''}>Accept</option>
                                    <option value="3" ${requestScope.status == '3' ? 'selected' : ''}>Reject</option>
                                </select>
                            </div>
                        </div>
                    </form>
                    <div class="row">
                        <div class="col-md-12">

                            <div class="card card-table">

                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-center mb-0">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Mentor Name</th>
                                                    <th>Create Time</th>
                                                    <th>Month</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${accounts}" var="a" varStatus="stat">
                                                    <tr>

                                                        <td>${stat.count}</td>


                                                        <td>${a.getFullname()}</td>
                                                        <td>
                                                            ${a.getSchedules().getCreateTime()}

                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${a.getSchedules().getMonth() == 1}">January</c:when>
                                                                <c:when test="${a.getSchedules().getMonth() == 2}">February</c:when>
                                                                <c:when test="${a.getSchedules().getMonth() == 3}">March</c:when>
                                                                <c:when test="${a.getSchedules().getMonth() == 4}">April</c:when>
                                                                <c:when test="${a.getSchedules().getMonth() == 5}">May</c:when>
                                                                <c:when test="${a.getSchedules().getMonth() == 6}">June</c:when>
                                                                <c:when test="${a.getSchedules().getMonth() == 7}">July</c:when>
                                                                <c:when test="${a.getSchedules().getMonth() == 8}">August</c:when>
                                                                <c:when test="${a.getSchedules().getMonth() == 9}">September</c:when>
                                                                <c:when test="${a.getSchedules().getMonth() == 10}">October</c:when>
                                                                <c:when test="${a.getSchedules().getMonth() == 11}">November</c:when>
                                                                <c:when test="${a.getSchedules().getMonth() == 12}">December</c:when>
                                                                <c:otherwise>Unknown Month</c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${a.getSchedules().getStatus() == '1'}">
                                                                    <p class="text-primary">Pending</p>
                                                                </c:when>
                                                                <c:when test="${a.getSchedules().getStatus() == '2'}">
                                                                    <p class="text-success">Accept</p>
                                                                </c:when>
                                                                <c:when test="${a.getSchedules().getStatus() == '3'}">
                                                                    <p class="text-danger">Reject</p>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    Unknown Status
                                                                </c:otherwise>
                                                            </c:choose>

                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${a.getSchedules().getStatus() == '1'}">
                                                                    <button type="button" class="btn btn-outline-success" onclick="window.location.href = 'update_schedule?id=${a.getAccount_id()}&sessionId=${a.getSchedules().getSessionId()}&schedule_id=${a.getSchedules().getId()}&month=${a.getSchedules().getMonth()}'" >Detail</button>
                                                                </c:when>
                                                                <c:when test="${a.getSchedules().getStatus() == '2'}">
                                                                    <button type="button" class="btn btn-outline-success" onclick="window.location.href = 'update_schedule?id=${a.getAccount_id()}&sessionId=${a.getSchedules().getSessionId()}&schedule_id=${a.getSchedules().getId()}&month=${a.getSchedules().getMonth()}'" >Detail</button>
                                                                </c:when>
                                                                <c:when test="${a.getSchedules().getStatus() == '3'}">
                                                                    <button type="button" class="btn btn-outline-success" onclick="window.location.href = 'update_schedule?id=${a.getAccount_id()}&sessionId=${a.getSchedules().getSessionId()}&schedule_id=${a.getSchedules().getId()}&month=${a.getSchedules().getMonth()}'" >Detail</button>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    Unknown Status
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                    </tr>
                                                </c:forEach>





                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!--        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                 Modal body content 
                                This is the modal body content.
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>-->


        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/feather.min.js"></script>

        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

        <script src="assets/plugins/raphael/raphael.min.js"></script>

        <script src="assets/plugins/morris/morris.min.js"></script>

        <script src="assets/js/chart.morris.js"></script>

        <script src="assets/js/script.js"></script>
        <script>
                                                                          document.getElementById('statusFilter').addEventListener('change', function () {
                                                                              document.getElementById('statusForm').submit();
                                                                          });

        </script>

    </body>

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/admin/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:33:02 GMT -->
</html>


<%-- 
    Document   : mentor-details
    Created on : Jun 24, 2024, 5:25:41 AM
    Author     : catmi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>${mentor.fullname}'s information</title>

        <link rel="shortcut icon" type="image/x-icon" href="admin/assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <link rel="stylesheet" href="assets/css/feathericon.min.css">

        <link rel="stylesheet" href="assets/plugins/datatables/datatables.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/mycss.css">
    </head>
    <body>

        <div class="main-wrapper">

            <jsp:include page="admin-header.jsp"></jsp:include>

            <jsp:include page="admin-sidebar.jsp"></jsp:include>


                <div class="page-wrapper">
                    <div class="content container-fluid">

                        <div class="row">
                            <div class="col-sm-12">
                                <form>
                                    <div class="row">
                                        <div class="d-flex justify-content-between">
                                            <div class="form-group">
                                                <img src="${mentor.avatar}" alt="Mentor avatar" 
                                                 class="rounded-circle"
                                                 height="150px" width="150px"/>
                                        </div>
                                        <div class="mx-5">
                                            <button class="btn btn-success"><a class="text-white" href="MentorList">Back</a></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="font-weight-600 text-uppercase">Full Name:</label>
                                            <p class="form-control">${mentor.fullname}</p>
                                        </div>
                                        <div class="form-group">
                                            <label class="font-weight-600 text-uppercase">Gender:</label>
                                            <p class="form-control">${mentor.sex == true ?"Male":"Female"}</p>
                                        </div>
                                        <div class="form-group">
                                            <label class="font-weight-600 text-uppercase">Address:</label>
                                            <p class="form-control">${mentor.address}</p>
                                        </div>
                                        <div class="form-group">
                                            <label class="font-weight-600 text-uppercase">Date of Birth:</label>
                                            <p class="form-control">${mentor.dateOfBirth}</p>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="font-weight-600 text-uppercase">Job:</label>
                                            <p class="form-control">${cv.job}</p>
                                        </div>
                                        <div class="form-group">
                                            <label class="font-weight-600 text-uppercase">Phone number:</label>
                                            <p class="form-control">${mentor.phone}</p>
                                        </div>
                                        <div class="form-group">
                                            <label class="font-weight-600 text-uppercase">Email address:</label>
                                            <p class="form-control">${mentor.email}</p>
                                        </div>
                                        <div class="form-group">
                                            <label class="font-weight-600 text-uppercase">Skills:</label>
                                            <div class="d-flex">
                                                <c:forEach items="${listS}" var="sk">
                                                    <p class="py-2 mx-1 btn btn-outline-dark">${sk}</p>
                                                </c:forEach>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <label class="font-weight-600 text-uppercase">Introduction:</label>
                                        <textarea style="resize: none;" class="form-control" rows="4" readonly>${cv.introduction}</textarea>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <label class="font-weight-600 text-uppercase">Achievements:</label>
                                        <textarea style="resize: none;" class="form-control" rows="4" readonly >${cv.achievements}</textarea>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>


        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/feather.min.js"></script>

        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

        <script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="assets/plugins/datatables/datatables.min.js"></script>

        <script src="assets/js/script.js"></script>
        <script src="assets/js/MyJS.js"></script>
    </body>
</html>
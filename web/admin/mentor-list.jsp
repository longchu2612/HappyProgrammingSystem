<%-- 
    Document   : mentor
    Created on : Jun 5, 2024, 8:59:08 AM
    Author     : catmi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Mentor List</title>

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

                        <div class="page-header">
                            <div class="row">
                                <div class="col-sm-12">
                                    <h3 class="page-title">List of Mentor</h3>
                                    <div class="row">
                                        <form action="MentorList" method="post">
                                            <input type="hidden" name="service" value="search">
                                            <div class="col-sm-6 d-flex">
                                                <input id="searchbox-mentorlist" class="p-1 rounded-2" type="search" name="txtSearch" 
                                                       placeholder="Search in here..." value="${txtSearch}">
                                            <button class="btn btn-success" type="submit"><i class="fa fa-search"></i></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="datatable table table-hover table-center mb-0 text-center">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>ID</th>
                                                    <th>Full Name</th>
                                                    <th>Username</th>
                                                    <th>Profession</th>
                                                    <th>Number of Request</th>
                                                    <th>Rating</th>
                                                    <th colspan="2">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${mentors}" var="mentor" varStatus="count">
                                                    <tr>
                                                        <td>${count.index+1}</td>
                                                        <td>${mentor.id}</td>
                                                        <td>${mentor.fullname}</td>
                                                        <td>${mentor.username}</td>
                                                        <td>${mentor.job}</td>
                                                        <td>${mentor.numOfReq}</td>
                                                        <td>${mentor.rating} / 5</td>
                                                        <td>
                                                            <form action="MentorList?service=setStatus&id=${mentor.id}&status=${mentor.status}" method="post">
                                                                <button class="btn btn-outline-danger" type="submit" >
                                                                    <c:if test="${mentor.status == 1}">
                                                                        Active
                                                                    </c:if>
                                                                    <c:if test="${mentor.status == 0}">
                                                                        Inactive
                                                                    </c:if>
                                                                </button>
                                                            </form>
                                                        </td>
                                                        <td>
                                                            <!--<button class="btn btn-outline-success" type="button" id="detailsButton">
                                                                <a href="MentorList?service=details&id=${mentor.id}">Details</a>
                                                            </button>-->
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


        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/feather.min.js"></script>

        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

        <script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="assets/plugins/datatables/datatables.min.js"></script>

        <script src="assets/js/script.js"></script>
        <script src="assets/js/myscript.js"></script>
    </body>
</html>

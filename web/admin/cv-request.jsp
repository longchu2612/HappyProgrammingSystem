<%-- 
    Document   : cv-request
    Created on : Jun 17, 2024, 9:36:32 AM
    Author     : catmi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Apply CV Request</title>

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
                                    <h3 class="page-title">Apply CV List</h3>
                                    <div class="row">

                                        <div>

                                        </div>
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
                                                        <th>Full Name</th>
                                                        <th>Profession</th>
                                                        <th>Details</th>
                                                        <th>Status</th>
                                                        <th>Note</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${cvList}" var="cv" varStatus="count">
                                                    <tr>
                                                        <td>${count.index+1}</td>
                                                        <td>${cv.fullname}</td>
                                                        <td>${cv.job}</td>
                                                        <td>
                                                            <button class="btn btn-secondary">
                                                                <a class="text-white" href="ListRequest?service=details&cvId=${cv.id}&accId=${cv.accountID}">Details</a>
                                                            </button>
                                                        </td>
                                                        <td class="
                                                            <c:choose>
                                                                <c:when test='${cv.status == "Approve"}'>text-success</c:when>
                                                                <c:when test='${cv.status == "Reject"}'>text-danger</c:when>
                                                                <c:otherwise>text-warning</c:otherwise>
                                                            </c:choose>">${cv.status}
                                                        </td>
                                                        <c:if test="${cv.status != 'Pending'}">
                                                            <td class="
                                                                   <c:choose>
                                                                       <c:when test='${cv.status == "Approve"}'>text-success</c:when>
                                                                       <c:when test='${cv.status == "Reject"}'>text-danger</c:when>
                                                                   </c:choose>">
                                                                ${cv.note}
                                                            </td>
                                                        </c:if>
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
    </body>
</html>

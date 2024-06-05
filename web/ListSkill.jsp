<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>List Skill</title>

        <link rel="shortcut icon" type="image/x-icon" href="admin/assets/img/favicon.png"/>
        <link rel="stylesheet" type="text/css" href="admin/assets/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="admin/assets/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="admin/assets/css/feathericon.min.css" />
        <link rel="stylesheet" type="text/css" href="admin/assets/plugins/datatables/datatables.min.css"/>
        <link rel="stylesheet" type="text/css" href="admin/assets/css/style.css" />
    </head>
    <body>
        <div class="main-wrapper">

            <jsp:include page="admin/admin-header.jsp"></jsp:include>

            <jsp:include page="admin/admin-sidebar.jsp"></jsp:include>

                <!--Start content-->
                <div class="page-wrapper">
                    <div class="content container-fluid">
                        <div class="page-header">
                            <div class="row">
                                <div class="col-sm-12">
                                    <h2 class="page-title">List of Skill</h2>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 d-flex">
                                    <input id="searchbox-listskill" class="p-1 rounded-2" type="search" placeholder="Skill name...">
                                    <button class="btn btn-success" type="submit" onclick=""><i class="fa fa-search"></i></button>
                                </div>
                                <div class="col-sm-6 text-end">
                                    <button class="btn btn-success" onclick="window.location.href = 'AddNewSkill.jsp'">
                                        <i class="fa fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card">
                                    <div class="card-body">
                                        <table class="datatable table table-hover table-center mb-0 text-center">
                                            <thead class="font-weight-bold">
                                                <tr>
                                                    <th>#</th>
                                                    <th>SKill ID</th>
                                                    <th>Skill Name</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${listSkill}" var="skill" varStatus="count">
                                                <tr>
                                                    <td>${count.index+1}</td>
                                                    <td>${skill.skillId}</td>
                                                    <td>${skill.skillName}</td>
                                                    <td>
                                                        <button id="btnStatus" class="btn btn-outline-danger" >
                                                            <c:if test="${skill.status == 1}">
                                                                Active
                                                            </c:if>
                                                            <c:if test="${skill.status == 0}">
                                                                Inactive
                                                            </c:if>
                                                        </button>
                                                    </td>
                                                    <td>
                                                        <button class="btn btn-outline-primary">
                                                            <a href="ListSkill?task=detail&skillId=${skill.skillId}">Update</a>
                                                        </button>
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
            <!--End content-->
        </div>

        <script src="admin/assets/js/jquery-3.6.0.min.js"></script>

        <script src="admin/assets/js/bootstrap.bundle.min.js"></script>

        <script src="admin/assets/js/feather.min.js"></script>

        <script src="admin/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

        <script src="admin/assets/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="admin/assets/plugins/datatables/datatables.min.js"></script>

        <script src="admin/assets/js/script.js"></script>

    </body>
</html>

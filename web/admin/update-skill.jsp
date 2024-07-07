<%-- 
    Document   : AddNewSkill
    Created on : May 25, 2024, 8:13:08 AM
    Author     : catmi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Skill</title>
        <link rel="shortcut icon" type="image/x-icon" href="admin/assets/img/favicon.png"/>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="assets/css/feathericon.min.css" />
        <link rel="stylesheet" type="text/css" href="assets/plugins/datatables/datatables.min.css"/>
        <link rel="stylesheet" type="text/css" href="assets/css/style.css" />
    </head>
    <body>
        <div class="main-wrapper">

            <jsp:include page="admin-header.jsp"></jsp:include>

            <jsp:include page="admin-sidebar.jsp"></jsp:include>

                <!--Start content-->
                <div class="page-wrapper">
                    <div class="content container-fluid">
                        <div class="page-header">
                            <div class="row">
                                <div class="col-sm-12">
                                    <h2 class="page-title">Update Skill:</h2>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="card-body">
                                        <form action="SkillList" method="post">
                                            <input type="hidden" name="service" value="update">
                                            <div class="form-group">
                                                <label class="col-form-label col-lg-2">Skill Id:</label>
                                                <div class="col-lg-5">
                                                    <input class="form-control" type="text" name="skillId"
                                                           value="${skill.skillId}" readonly>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-form-label col-lg-2">Skill Name:</label>
                                            <div class="col-lg-5">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" 
                                                           name="skillname" placeholder="Skill name"
                                                           value="${skill.skillName}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-form-label col-lg-2">Skill Status:</label>
                                            <div class="col-lg-5">
                                                <select name="status" class="form-control">
                                                    <option value="1" <c:if test="${skill.status == 1}">selected</c:if>>Active</option>
                                                    <option value="0" <c:if test="${skill.status != 1}">selected</c:if>>Inactive</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <button class="btn btn-success" type="submit">
                                                OK
                                            </button>
                                        </form>
                                        <div class="form-group">
                                            <h3 name='mess' style="color: red;">${mess}</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--End content-->
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

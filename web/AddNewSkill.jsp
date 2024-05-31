<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new skill</title>

        <link rel="shortcut icon" type="image/x-icon" href="admin/assets/img/favicon.png"/>
        <link rel="stylesheet" type="text/css" href="admin/assets/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="admin/assets/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="admin/assets/css/feathericon.min.css" />
        <link rel="stylesheet" type="text/css" href="admin/assets/plugins/datatables/datatables.min.css"/>
        <link rel="stylesheet" type="text/css" href="admin/assets/css/style.css" />
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
                                    <h2 class="page-title">Add new Skill</h2>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="card-body">
                                        <form action="addSkill" method="post">
                                            <div class="form-group">
                                                <label class="col-form-label col-lg-2">Skill Name:</label>
                                                <div class="col-lg-10">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" name="skillname" placeholder="Skill name">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-form-label col-lg-2">Skill Status:</label>
                                                <div class="col-lg-10">
                                                    <div class="form-check form-radio">
                                                        <input id="activeSkill" class="form-check-input" value="1" name="status" type="radio" checked>
                                                        <label class="form-check-label" for="activeSkill">Active</label>
                                                    </div>
                                                    <div class="form-check form-radio">
                                                        <input id="inactiveSkill" class="form-check-input" value="0" name="status" type="radio">
                                                        <label class="form-check-label" for="inactiveSkill">Inactive</label> 
                                                    </div>
                                                </div>
                                            </div>
                                            <!--                                        <div class="form-group">
                                                                                        <label class="col-form-label col-lg-2">Choose an image:</label>
                                                                                        <div class="col-lg-5">
                                                                                            <input type="file" id="fileInput" name="skillimage" accept="image/*">
                                                                                            <img id="uploadedImage" height="300px" width="300px" src="#" alt="Uploaded Image" style="display: none;">
                                                                                        </div>
                                                                                    </div>-->
                                            <button class="btn btn-success" type="submit">
                                                Add new skill
                                            </button>
                                            <div class="form-group">
                                                <h3 name='mess' style="color: red;">${mess}</h3>
                                        </div>
                                    </form>

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

        <!--        <script>
                    const imageInput = document.getElementById('fileInput');
                    const uploadedImage = document.getElementById('uploadedImage');
        
                    imageInput.addEventListener('change', (event) => {
                        const file = event.target.files[0];
                        if (file) {
                            const reader = new FileReader();
                            reader.onload = function (e) {
                                uploadedImage.src = e.target.result;
                                uploadedImage.style.display = 'block';
                            };
                            reader.readAsDataURL(file);
                        }
                    });
                </script>-->
    </body>
</html>

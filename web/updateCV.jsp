<%-- 
    Document   : updateCV
    Created on : May 19, 2024, 9:45:14 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" />
        <link rel="stylesheet" href="css/UpdateCV.css" />
    </head>
    <body>
        <div class="container rounded bg-white mt-5 mb-5">
            <div class="row">
                <div class="col-md-3 border-right">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="#"><span class="font-weight-bold">#account name</span><span class="text-black-50">#email</span><span> </span></div>
                </div>
                <div class="col-md-9 border-right">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="text-right">Update CV</h4>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-12"><label class="labels">Account name</label><input type="text" class="form-control" placeholder="Account" value=""></div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-6"><label class="labels">Name</label><input type="text" class="form-control" placeholder="Full name" value=""></div>
                            <div class="col-md-6"><label class="labels">Gender</label><br><input type="radio" name="gender" value="m" checked=""> Male <input type="radio" name="gender" value="fm" > Female</div>
                            <div class="col-md-12"><label class="labels">Date of birth</label><input type="date" class="form-control" value="" placeholder="Dob"></div>

                        </div>
                        <div class="row mt-3">
                            <div class="col-md-12"><label class="labels">Email</label><input type="text" class="form-control" placeholder="Email" value=""></div>
                            <div class="col-md-12"><label class="labels">job</label><input type="text" class="form-control" placeholder="Job" value=""></div>
                            <div class="col-md-12"><label class="labels">Mobile Number</label><input type="text" class="form-control" placeholder="Phone" value=""></div>
                            <div class="col-md-12"><label class="labels">Address</label><input type="text" class="form-control" placeholder="Address" value=""></div>
                            <div class="col-md-12"><label class="labels">Description</label><textarea class="form-control" placeholder="Description" rows="10"></textarea></div>
                        </div>
                        <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="button">Save Profile</button></div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

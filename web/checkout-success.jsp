<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="util.PaymentConfig"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title> Success </title>

        <link rel="shortcut icon" type="image/x-icon" href="admin/assets/img/favicon.png">

        <link rel="stylesheet" href="admin/assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="admin/assets/css/font-awesome.min.css">

        <link rel="stylesheet" href="admin/assets/css/feathericon.min.css">

        <link rel="stylesheet" href="admin/assets/css/style.css">
    </head>
    <body>
        <div class="main-wrapper">
            <div class="error-box">
                <h1 style="font-size: 100px;">Success</h1>

                <p class="h4 font-weight-normal">Your request is created successfully.</p>
                <a href="Booking" class="btn btn-success">Join another course</a>
                <a href="home" class="btn btn-primary">Back to HomePage</a>
            </div>
        </div>


        <script src="admin/assets/js/jquery-3.6.0.min.js"></script>

        <script src="admin/assets/js/bootstrap.bundle.min.js"></script>

        <script src="admin/assets/js/feather.min.js"></script>

        <script src="admin/assets/js/script.js"></script>
    </body>
</html>

<%-- 
    Document   : checkout-fail
    Created on : Jul 3, 2024, 7:32:38 AM
    Author     : catmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Not Enough Money</title>
        <link rel="shortcut icon" type="image/x-icon" href="admin/assets/img/favicon.png">

        <link rel="stylesheet" href="admin/assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="admin/assets/css/font-awesome.min.css">

        <link rel="stylesheet" href="admin/assets/css/feathericon.min.css">

        <link rel="stylesheet" href="admin/assets/css/style.css">
    </head>
    <body>
        <div class="main-wrapper">
            <div class="error-box">
                <img src="https://png.pngtree.com/png-vector/20220908/ourmid/pngtree-business-man-chasing-flying-money-png-image_6141932.png" alt="alt"/>
                <p class="h3 font-weight-normal">You haven't enough money to pay</p>
                <p class="h3 font-weight-normal">Do you want to recharge?</p>
                <form action="recharge.jsp">
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <a href="home" class="btn btn-danger">Cancel</a>
                </form>
            </div>
        </div>


        <script src="admin/assets/js/jquery-3.6.0.min.js"></script>

        <script src="admin/assets/js/bootstrap.bundle.min.js"></script>

        <script src="admin/assets/js/feather.min.js"></script>

        <script src="admin/assets/js/script.js"></script>
        
    </body>
</html>

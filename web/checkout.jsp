<%-- 
    Document   : checkout.jsp
    Created on : May 26, 2024, 5:29:51 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/checkout.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:23 GMT -->
    <head>
        <meta charset="utf-8">
        <title>Mentoring</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body>

        <div class="main-wrapper">

            <jsp:include page="header.jsp"/>

            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-7 col-lg-8">
                            <div class="card">
                                <div class="card-body">
                                    <form action="order?service=method" method="post">
                                        <div class="payment-widget">
                                            <h4 class="card-title">Payment Method</h4>

                                            <div class="payment-list">
                                                <label class="payment-radio credit-card-option">
                                                    <input type="radio" name="pay-method" value="wallet" checked>
                                                    <span class="checkmark"></span>
                                                    CodeCoach Wallet
                                                </label>
                                            </div>
                                            <div class="payment-list">
                                                <label class="payment-radio paypal-option">
                                                    <input type="radio" name="pay-method" value="vnpay">
                                                    <span class="checkmark"></span>
                                                    VNPay
                                                </label>
                                            </div>
                                            <div class="d-none">
                                                <input type="text" name="mentorId" value="${requestScope.mentorId}">
                                                <input type="text" name="total" value="${requestScope.total}">
                                            </div>
                                            <div class="terms-accept">
                                                <div class="custom-checkbox">
                                                    <input type="checkbox" id="terms_accept">
                                                    <label for="terms_accept">I have read and accepted <a href="#">Terms &amp; Conditions</a></label>
                                                </div>
                                            </div>
                                            <div class="submit-section mt-4">
                                                <button type="submit" class="btn btn-primary submit-btn">Confirm and Pay</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="footer.jsp"/>
        </div>


        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <script src="assets/js/script.js"></script>
    </body>

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/checkout.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:23 GMT -->
</html>

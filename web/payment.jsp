<%-- 
    Document   : payment
    Created on : Jun 27, 2024, 6:04:26 PM
    Author     : catmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

            <div class="breadcrumb-bar">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-12 col-12">
                            <nav aria-label="breadcrumb" class="page-breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="home">Home</a></li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">Payment Information</h2>
                        </div>
                    </div>
                </div>
            </div>


            <div class="content bg-business">
                <div class="container-fluids">
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <form action="pay" id="frmCreateOrder" method="post">
                                <div class="invoice-content">
                                    <div class="invoice-item">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="invoice-logo">
                                                    <img src="assets/img/logo.png" alt="logo">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="invoice-item">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="invoice-info">
                                                    <strong class="customer-text">Invoice From</strong>
                                                    <div class="invoice-details invoice-details-two">
                                                        <p>Darren Elder</p>
                                                        <p>806 Twin Willow Lane, Old Forge</p>
                                                        <p>Newyork, USA </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="invoice-info invoice-info2">
                                                    <strong class="customer-text">Invoice To</strong>
                                                    <div class="invoice-details">
                                                        <p>Darren Elder</p>
                                                        <p>806 Twin Willow Lane, Old Forge</p>
                                                        <p>Newyork, USA </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="invoice-item">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="invoice-info">
                                                    <strong class="customer-text">Course Name</strong>
                                                    <div class="invoice-details invoice-details-two">
                                                        Java and C#
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="invoice-item">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="table-responsive">
                                                    <table class="invoice-table-two table">
                                                        <tbody>
                                                            <tr>
                                                                <th>Subtotal:</th>
                                                                <td><span>$350</span></td>
                                                            </tr>
                                                            <tr>
                                                                <th>Discount:</th>
                                                                <td><span>-10%</span></td>
                                                            </tr>
                                                            <tr>
                                                                <th>Total Amount:</th>
                                                                <td><span>$315</span></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <input name="amount" type="hidden" value="10000" />
                                    <button type="submit" class="btn btn-secondary">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


            <jsp:include page="footer.jsp"></jsp:include>

        </div>


        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/script.js"></script>
        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script type="text/javascript">
            $("#frmCreateOrder").submit(function () {
                var postData = $("#frmCreateOrder").serialize();
                var submitUrl = $("#frmCreateOrder").attr("action");
                $.ajax({
                    type: "POST",
                    url: submitUrl,
                    data: postData,
                    dataType: 'JSON',
                    success: function (x) {
                        if (x.code === '00') {
                            if (window.vnpay) {
                                vnpay.open({width: 768, height: 600, url: x.data});
                            } else {
                                location.href = x.data;
                            }
                            return false;
                        } else {
                            alert(x.Message);
                        }
                    }
                });
                return false;
            });
        </script>
    </body>
</html>

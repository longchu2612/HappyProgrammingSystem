<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/invoices.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:21 GMT -->
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
                        <div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">

                            <jsp:include page="sidebar.jsp"/>

                        </div>
                        <div class="col-md-7 col-lg-8 col-xl-9">
                            <div class="card card-table">
                                <div class="card-body">

                                    <div class="table-responsive">
                                        <table class="table table-hover table-center mb-0">
                                            <thead>
                                                <tr>
                                                    <th>Request No.</th>
                                                    <th>Mentor</th>
                                                    <th>Skill</th>
                                                    <th>Amount</th>
                                                    <th>Status</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <a href="invoice-view.html">Request - No.1</a>
                                                    </td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile-mentee.html" class="avatar avatar-sm me-2">
                                                                <img class="avatar-img rounded-circle" src="assets/img/user/user2.jpg" alt="User Image">
                                                            </a>
                                                            <a href="profile-mentee.html">Tyrone Roberts <span>16</span></a>
                                                        </h2>
                                                    </td>
                                                    <td>C#</td>
                                                    <td>450$</td>
                                                    <td>Pending</td>
                                                    <td class="text-end">
                                                        <div class="table-action">
                                                            <a href="" class="btn btn-sm bg-info-light">
                                                                 View
                                                            </a>
                                                            <a href="checkout.jsp" class="btn btn-sm bg-primary-light">
                                                                <i class="fas fa-print"></i> Pay
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

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

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/invoices.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:21 GMT -->
</html>
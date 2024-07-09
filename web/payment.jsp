<%-- 
    Document   : payment
    Created on : Jun 27, 2024, 6:04:26 PM
    Author     : catmi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Payment</title>
        <link rel="stylesheet" href="admin/assets/css/bootstrap.min.css">
        <script src="assets/js/jquery-1.11.3.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="header clearfix">
                <h3 class="text-muted">VNPAY</h3>
            </div>
            <h3>Create new order</h3>
            <div class="table-responsive">
                <form action="pay" id="frmCreateOrder" method="post">        
                    <div class="form-group">
                        <label for="amount">Amount:</label>
                        <input class="form-control" data-val="true" data-val-number="The field Amount must be a number." 
                               data-val-required="The Amount field is required." id="amount" max="100000000" min="1" name="amount" type="number" value="${amount}" />
                    </div>
                    <input type="hidden" name="recharge" value="payment">
                    <button type="submit" class="btn btn-primary" href>Submit</button>
                    <a class="btn btn-danger" href="home">Cancel</a>
                </form>
            </div>
        </div>

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

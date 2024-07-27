<%-- 
    Document   : header
    Created on : May 21, 2024, 11:29:08 PM
    Author     : asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="header  header-four">
    <div class="header-fixed">
        <nav class="navbar navbar-expand-lg header-nav scroll-sticky">
            <div class="container">
                <div class="navbar-header">
                    <a id="mobile_btn" href="javascript:void(0);">
                        <span class="bar-icon">
                            <span></span>
                            <span></span>
                            <span></span>
                        </span>
                    </a>
                    <a href="home" class="navbar-brand logo">
                        <img src="assets/img/logo-7.png" class="img-fluid" alt="Logo">
                    </a>
                </div>
                <div class="main-menu-wrapper">
                    <div class="menu-header">
                        <a href="home" class="menu-logo">
                            <img src="assets/img/logo-7.png" class="img-fluid" alt="Logo">
                        </a>
                        <a id="menu_close" class="menu-close" href="javascript:void(0);">
                            <i class="fas fa-times"></i>
                        </a>
                    </div>
                    <c:if test="${sessionScope.account != null}">
                        <ul class="main-nav">
                            <c:if test="${sessionScope.account.role.role_id == 1}">
                                <li class="has-submenu">

                                    <a href>Wallet <i class="fas fa-chevron-down"></i></a>
                                    <ul class="submenu">
                                        <li><a>Balance: <span id="balance">${sessionScope.account.balance == null ? 0 : sessionScope.account.balance}</span> VND</a></li>
                                        <li><a>Hold: <span id="hold">${sessionScope.account.hold == null ? 0 : sessionScope.account.hold}</span> VND</a></li>
                                        <li><a>Available: <span id="available">${(sessionScope.account.balance == null ? 0 : sessionScope.account.balance)
                                                                                 - (sessionScope.account.hold == null ? 0 : sessionScope.account.hold)}</span> VND</a></li>
                                        <li><a href="">Volatility</a></li>
                                        <li><a href="recharge.jsp">Recharge</a></li>
                                    </ul>
                                </li>
                                <li class="has-submenu">
                                    <a href>Hello, ${sessionScope.account.fullname} <i class="fas fa-chevron-down"></i></a>
                                    <ul class="submenu">
                                        <li><a href="${pageContext.request.contextPath}/">Home Mentee</a></li>
                                        <li><a href="profile">Profile</a></li>

                                        <li><a href="Booking">Search Mentor</a></li>
                                        <li><a href="my_request_mentee">My request</a></li>
                                        <li><a href="changepass.jsp">Change Password</a></li>
                                        <li><a href="#">Profile Settings</a></li>
                                        <li><a href="account?action=logout">Logout</a></li>
                                    </ul>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.account.role.role_id == 2}">
                                <li class="has-submenu">
                                    <a href>Wallet <i class="fas fa-chevron-down"></i></a>
                                    <ul class="submenu">
                                        <li><a>Balance: ${sessionScope.account.balance} VND</a></li>
                                        <li><a href="">Volatility</a></li>
                                        <li><a href="recharge.jsp">Recharge</a></li>
                                    </ul>
                                </li>
                                <li class="has-submenu">
                                    <a href>Schedule <i class="fas fa-chevron-down"></i></a>
                                    <ul class="submenu">
                                        <li><a href="createSchedule.jsp">Create schedule</a></li>
                                        <li><a href="schedule_mentor">Schedule Timing</a></li>
                                        <li><a href="my_schedule">My Schedule</a></li>
                                    </ul>
                                </li>
                                <li class="has-submenu">
                                    <a href>Hello, ${sessionScope.account.fullname}<i class="fas fa-chevron-down"></i></a>
                                    <ul class="submenu">
                                        <li><a href="${pageContext.request.contextPath}/">Home Mentor</a></li>
                                        <li><a href="my_request">My Request</a></li>
                                        <li><a href="profile">My Profile</a></li>
                                        <li><a href="profile">My CV</a></li>
                                        <li><a href="profile">My Request CV</a></li>
                                        <li><a href="changepass.jsp">Change Password</a></li>
                                        <li><a href="account?action=logout">Logout</a></li>
                                    </ul>
                                </li>
                            </c:if>
                        </ul>
                    </c:if>
                </div>
                <c:if test="${sessionScope.account == null}">
                    <ul class="nav header-navbar-rht">
                        <li class="nav-item">
                            <a class="nav-link header-login-two" href="login.jsp">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link header-login" href="register.jsp">Sign up</a>
                        </li>
                    </ul>
                </c:if>
            </div>
        </nav>
    </div>
</header>

<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>-->
<script>
//    function updateWalletInfo() {
//        var token = getTokenFromSessionOrCookie(); // Hàm này tùy thuộc vào cách bạn lưu và lấy token
//
//        $.ajax({
//            url: 'getAccountInfo', // Đảm bảo URL khớp với ánh xạ servlet
//            type: 'GET',
//            data: {token: token}, // Gửi token cùng với yêu cầu
//            success: function (data) {
//                $('#balance').text(data.balance);
//                $('#hold').text(data.hold);
//                $('#available').text(data.balance - data.hold);
//            },
//            error: function (xhr) {
//                if (xhr.status === 401) {
//                    // Check if redirect has already been triggered
//                    if (!sessionStorage.getItem('redirected')) {
//                        sessionStorage.setItem('redirected', 'true');
//                        window.location.href = '${pageContext.request.contextPath}/home';
//                    }
//                } else {
//                    console.log('Error fetching account info', xhr.status);
//                }
//            }
//        });
//    }
//    function getTokenFromSessionOrCookie() {
//        var name = "token=";
//        var decodedCookie = decodeURIComponent(document.cookie);
//        var ca = decodedCookie.split(';');
//        for (var i = 0; i < ca.length; i++) {
//            var c = ca[i];
//            while (c.charAt(0) === ' ') {
//                c = c.substring(1);
//            }
//            if (c.indexOf(name) === 0) {
//                return c.substring(name.length, c.length);
//            }
//        }
//        return "";
//    }
//
//    // Call the updateWalletInfo function when the page loads
//    $(document).ready(function () {
//        updateWalletInfo();
////        // Set interval to update info every 10 seconds
//        setInterval(updateWalletInfo, 10000);
//    });
</script>

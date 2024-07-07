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
                    <ul class="main-nav">
                        <c:if test="${sessionScope.account.role.role_id == 2}">
                            <li class="has-submenu">
                                <a href>Mentor <i class="fas fa-chevron-down"></i></a>
                                <ul class="submenu">
                                    <li><a href="dashboard.html">Mentor Dashboard</a></li>
                                    <li><a href="profile">Profile</a></li>
                                    <li><a href="createSchedule.jsp">Invoices</a></li>
                                    <li><a href="schedule_mentor">Schedule Timing</a></li>
                                    <li><a href="invoices.html">Invoices</a></li>
                                    <li><a href="my-schedule.jsp">My Schedule</a></li>
                                </ul>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.account.role.role_id == 1}">
                            <li class="has-submenu">
                                <a href>Mentee <i class="fas fa-chevron-down"></i></a>
                                <ul class="submenu">
                                    <li><a href="Booking">Search Mentor</a></li>
                                    <li><a href="profile.html">mentee Profile</a></li>
                                    <li><a href="bookings-mentee.html">Bookings</a></li>
                                    <li><a href="checkout.html">Checkout</a></li>
                                    <li><a href="booking-success.html">Booking Success</a></li>
                                    <li><a href="dashboard-mentee.html">Mentee Dashboard</a></li>
                                    <li><a href="profile-settings-mentee.jsp">Profile Settings</a></li>
                                    <li><a href="changepass.jsp">Change Password</a></li>
                                </ul>
                            </li>
                        </c:if>
                    </ul>
                </div>
                <c:if test="${sessionScope.account != null}">
                    <ul class="nav header-navbar-rht">
                        <li class="nav-item">
                            <a class="nav-link header-login-two" href="profile">Hello, ${sessionScope.account.fullname}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link header-login" href="account?action=logout">Logout</a>
                        </li>
                    </ul>
                </c:if>
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

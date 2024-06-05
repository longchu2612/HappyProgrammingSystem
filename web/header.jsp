<%-- 
    Document   : header
    Created on : May 21, 2024, 11:29:08 PM
    Author     : asus
--%>

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
                    <a href="index.html" class="navbar-brand logo">
                        <img src="assets/img/logo-6.png" class="img-fluid" alt="Logo">
                    </a>
                </div>
                <div class="main-menu-wrapper">
                    <div class="menu-header">
                        <a href="index.html" class="menu-logo">
                            <img src="assets/img/logo-6.png" class="img-fluid" alt="Logo">
                        </a>
                        <a id="menu_close" class="menu-close" href="javascript:void(0);">
                            <i class="fas fa-times"></i>
                        </a>
                    </div>
                    <ul class="main-nav">
                        <li class="active has-submenu">
                            <a href="index.html">Home <i class="fas fa-chevron-down"></i></a>
                            <ul class="submenu">
                                <li><a href="index.html">Home</a></li>
                                <li><a href="index-two.html">Home 2</a></li>
                                <li><a href="index-three.html">Home 3</a></li>
                                <li><a href="index-four.html">Home 4</a></li>
                                <li class="active"><a href="index-five.html">Home 5</a></li>
                                <li><a href="index-six.html">Home 6</a></li>
                                <li><a href="index-seven.html">Home 7</a></li>
                            </ul>
                        </li>
                        <li class="has-submenu">
                            <a href>Mentor <i class="fas fa-chevron-down"></i></a>
                            <ul class="submenu">
                                <li><a href="dashboard.html">Mentor Dashboard</a></li>
                                <li><a href="bookings.html">Bookings</a></li>
                                <li><a href="schedule-timings.html">Schedule Timing</a></li>
                                <li><a href="mentee-list.html">Mentee List</a></li>
                                <li><a href="profile-mentee.html">mentor Profile</a></li>
                                <li class="has-submenu">
                                    <a href="blog.html">Blog</a>
                                    <ul class="submenu">
                                        <li><a href="blog.html">Blog</a></li>
                                        <li><a href="blog-details.html">Blog View</a></li>
                                        <li><a href="add-blog.html">Add Blog</a></li>
                                        <li><a href="edit-blog.html">Edit Blog</a></li>
                                    </ul>
                                </li>
                                <li><a href="chat.html">Chat</a></li>
                                <li><a href="invoices.html">Invoices</a></li>
                                <li><a href="profile-settings.html">Profile Settings</a></li>
                                <li><a href="reviews.html">Reviews</a></li>
                                <li><a href="mentor-register.html">Mentor Register</a></li>
                            </ul>
                        </li>
                        <li class="has-submenu">
                            <a href>Mentee <i class="fas fa-chevron-down"></i></a>
                            <ul class="submenu">
                                <li class="has-submenu">
                                    <a href="#">Mentors</a>
                                    <ul class="submenu">
                                        <li><a href="map-grid.html">Map Grid</a></li>
                                        <li><a href="map-list.html">Map List</a></li>
                                    </ul>
                                </li>
                                <li><a href="search.html">Search Mentor</a></li>
                                <li><a href="profile.html">mentee Profile</a></li>
                                <li><a href="bookings-mentee.html">Bookings</a></li>
                                <li><a href="checkout.html">Checkout</a></li>
                                <li><a href="booking-success.html">Booking Success</a></li>
                                <li><a href="dashboard-mentee.html">Mentee Dashboard</a></li>
                                <li><a href="favourites.html">Favourites</a></li>
                                <li><a href="chat-mentee.html">Chat</a></li>
                                <li><a href="profile-settings-mentee.jsp">Profile Settings</a></li>
                                <li><a href="changepass.jsp">Change Password</a></li>
                            </ul>
                        </li>
                        <li class="has-submenu">
                            <a href>Pages <i class="fas fa-chevron-down"></i></a>
                            <ul class="submenu">
                                <li><a href="voice-call.html">Voice Call</a></li>
                                <li><a href="video-call.html">Video Call</a></li>
                                <li><a href="search.html">Search Mentors</a></li>
                                <li><a href="components.html">Components</a></li>
                                <li class="has-submenu">
                                    <a href="invoices.html">Invoices</a>
                                    <ul class="submenu">
                                        <li><a href="invoices.html">Invoices</a></li>
                                        <li><a href="invoice-view.html">Invoice View</a></li>
                                    </ul>
                                </li>
                                <li><a href="blank-page.html">Starter Page</a></li>
                                <li><a href="login.jsp">Login</a></li>
                                <li><a href="register.jsp">Register</a></li>
                                <li><a href="forgot-password.html">Forgot Password</a></li>
                            </ul>
                        </li>
                        <li class="has-submenu">
                            <a href>Blog <i class="fas fa-chevron-down"></i></a>
                            <ul class="submenu">
                                <li><a href="blog-list.html">Blog List</a></li>
                                <li><a href="blog-grid.html">Blog Grid</a></li>
                                <li><a href="blog-details.html">Blog Details</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="admin/index.html" target="_blank">Admin</a>
                        </li>
                        <li class="login-link">
                            <a href="login.html">Login / Signup</a>
                        </li>
                    </ul>
                </div>
                <ul class="nav header-navbar-rht">
                    <li class="nav-item">
                        <a class="nav-link header-login-two" href="login.html">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link header-login" href="register.html">Sign up</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</header>

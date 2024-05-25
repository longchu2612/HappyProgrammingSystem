<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/profile-settings.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:21 GMT -->

    <head>
        <meta charset="utf-8">
        <title>Update CV of mentor</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">

        <link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css">

        <link rel="stylesheet" href="assets/css/style.css">

        <link rel="stylesheet" href="css/UpdateCV.css" />
    </head>

    <body>
        <form action="profile" method="post" enctype='multipart/form-data'>
            <div class="main-wrapper">
                <header class="header">
                    <div class="header-fixed">
                        <nav class="navbar navbar-expand-lg header-nav">
                            <div class="navbar-header">
                                <a id="mobile_btn" href="javascript:void(0);">
                                    <span class="bar-icon">
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                    </span>
                                </a>
                                <a href="index.html" class="navbar-brand logo">
                                    <img src="assets/img/logo.png" class="img-fluid" alt="Logo">
                                </a>
                            </div>
                            <div class="main-menu-wrapper">
                                <div class="menu-header">
                                    <a href="index.html" class="menu-logo">
                                        <img src="assets/img/logo.png" class="img-fluid" alt="Logo">
                                    </a>
                                    <a id="menu_close" class="menu-close" href="javascript:void(0);">
                                        <i class="fas fa-times"></i>
                                    </a>
                                </div>
                                <ul class="main-nav">
                                    <li class="has-submenu">
                                        <a href="index.html">Home <i class="fas fa-chevron-down"></i></a>
                                        <ul class="submenu">
                                            <li><a href="index.html">Home</a></li>
                                            <li><a href="index-two.html">Home 2</a></li>
                                            <li><a href="index-three.html">Home 3</a></li>
                                            <li><a href="index-four.html">Home 4</a></li>
                                            <li><a href="index-five.html">Home 5</a></li>
                                            <li><a href="index-six.html">Home 6</a></li>
                                            <li><a href="index-seven.html">Home 7</a></li>
                                        </ul>
                                    </li>
                                    <li class="has-submenu active">
                                        <a href>Mentor <i class="fas fa-chevron-down"></i></a>
                                        <ul class="submenu">
                                            <li><a href="dashboard.html">Mentor Dashboard</a></li>
                                            <li><a href="bookings.html">Bookings</a></li>
                                            <li><a href="schedule-timings.html">Schedule Timing</a></li>
                                            <li><a href="mentee-list.html">Mentee List</a></li>
                                            <li><a href="profile-mentee.html">Mentee Profile</a></li>
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
                                            <li class="active"><a href="profile-settings.html">Profile Settings</a></li>
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
                                            <li><a href="profile.html">Mentor Profile</a></li>
                                            <li><a href="bookings-mentee.html">Bookings</a></li>
                                            <li><a href="checkout.html">Checkout</a></li>
                                            <li><a href="booking-success.html">Booking Success</a></li>
                                            <li><a href="dashboard-mentee.html">Mentee Dashboard</a></li>
                                            <li><a href="favourites.html">Favourites</a></li>
                                            <li><a href="chat-mentee.html">Chat</a></li>
                                            <li><a href="profile-settings-mentee.html">Profile Settings</a></li>
                                            <li><a href="change-password.html">Change Password</a></li>
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
                                            <li><a href="login.html">Login</a></li>
                                            <li><a href="register.html">Register</a></li>
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

                                <li class="nav-item dropdown has-arrow logged-item">
                                    <a href="#" class="dropdown-toggle nav-link" data-bs-toggle="dropdown">
                                        <span class="user-img">
                                            <img class="rounded-circle" src="${ac.getAvatar()}" alt="User Image"  style="border-radius: 50%" width="31">
                                        </span>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-end">
                                        <div class="user-header">
                                            <div class="avatar avatar-sm">
                                                <img src="${ac.getAvatar()}" alt="User Image"  style="border-radius: 50%"
                                                     class="avatar-img rounded-circle">
                                            </div>
                                            <div class="user-text">
                                                <h6>${ac.getAccount_name()}</h6>
                                                <p class="text-muted mb-0">Mentor</p>
                                            </div>
                                        </div>
                                        <a class="dropdown-item" href="dashboard.html">Dashboard</a>
                                        <a class="dropdown-item" href="profile-settings.html">Profile Settings</a>
                                        <a class="dropdown-item" href="login.html">Logout</a>
                                    </div>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </header>


                <div class="breadcrumb-bar">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col-md-12 col-12">
                                <nav aria-label="breadcrumb" class="page-breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Profile Settings</li>
                                    </ol>
                                </nav>
                                <h2 class="breadcrumb-title">Profile Settings</h2>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="content">
                    <div class="container-fluid">
                        <div class="row">

                            <div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">

                                <div class="profile-sidebar">
                                    <div class="user-widget">
                                        <div class="pro-avatar"><image src="${ac.getAvatar()}" alt="User Image" style="height: 100px; width: 100px; border-radius: 50%"></div>
                                        <div class="user-info-cont">
                                            <h4 class="usr-name"><input type="text" class="account-name" name="account" value="${ac.getAccount_name()}"></h4>
                                        </div>
                                    </div>
                                    <div class="custom-sidebar-nav">
                                        <ul>
                                            <li><a href="dashboard.html"><i class="fas fa-home"></i>Dashboard <span><i
                                                            class="fas fa-chevron-right"></i></span></a></li>
                                            <li><a href="bookings.html"><i class="fas fa-clock"></i>Bookings <span><i
                                                            class="fas fa-chevron-right"></i></span></a></li>
                                            <li><a href="schedule-timings.html"><i class="fas fa-hourglass-start"></i>Schedule Timings <span><i class="fas fa-chevron-right"></i></span></a></li>
                                            <li><a href="chat.html"><i class="fas fa-comments"></i>Messages <span><i
                                                            class="fas fa-chevron-right"></i></span></a></li>
                                            <li><a href="blog.html"><i class="fab fa-blogger-b"></i>Blog <span><i
                                                            class="fas fa-chevron-right"></i></span></a></li>
                                            <li><a href="profile.html"><i class="fas fa-user-cog"></i>Profile <span><i
                                                            class="fas fa-chevron-right"></i></span></a></li>
                                            <li><a href="login.html"><i class="fas fa-sign-out-alt"></i>Logout <span><i
                                                            class="fas fa-chevron-right"></i></span></a></li>
                                        </ul>
                                    </div>
                                </div>

                            </div>

                            <div class="col-md-7 col-lg-8 col-xl-9">
                                <div class="card">
                                    <div class="card-body">

                                        <div class="row form-row">
                                            <div class="col-12 col-md-12">
                                                <div class="form-group">
                                                    <div class="change-avatar" id="AvatarFileUpload">
                                                        <div class="selected-image-holder">
                                                            <img src="${ac.getAvatar()}" alt="User Image" style="height: 100px; width: 100px; margin-right: 15px">
                                                        </div>
                                                        <div class="upload-img">
                                                            <div class="change-photo-btn">
                                                                <span><i class="fa fa-upload"></i> Upload Photo</span>
                                                                <input type="file" name="avatar" class="upload">
                                                            </div>
                                                            <small class="form-text text-muted">Allowed PNG. Max size of 2MB</small>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Full Name</label>
                                                    <input type="text" name="fullname" class="form-control" value="${ac.getFullname()}">
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Sex</label><br>
                                                    <p>
                                                        <input type="radio" name="sex" value="m" ${male}> Male &emsp;
                                                        <input type="radio" name="sex" value="f" ${female}> Female
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Date of Birth</label>
                                                    <div class="form-group">
                                                        <input type="date" name="dob" class="form-control"
                                                               value="${ac.getDateOfBirth()}">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="email" name="email" class="form-control"
                                                           value="${ac.getEmail()}">
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Phone number</label>
                                                    <input type="text" name="phone" value="${ac.getPhone()}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <input type="text" name="address" class="form-control" value="${ac.getAddress()}">
                                                </div>
                                            </div>
                                            <div class="col-12" style="background: #E4E4E4">
                                                <div class="form-group"  style="text-align: center; margin: auto; padding: 10px">
                                                    <button name="do" type="submit" class="btn btn-primary submit-btn" value="cv"> + Create CV </button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="submit-section" style="padding: 10px">
                                            <button name="do" type="submit" class="btn btn-primary submit-btn" value="save">Save Changes</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <footer class="footer">

                    <div class="footer-top">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-3 col-md-6">

                                    <div class="footer-widget footer-about">
                                        <div class="footer-logo">
                                            <img src="assets/img/logo.png" alt="logo">
                                        </div>
                                        <div class="footer-about-content">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                                incididunt ut labore et dolore magna aliqua. </p>
                                            <div class="social-icon">
                                                <ul>
                                                    <li>
                                                        <a href="#" target="_blank"><i class="fab fa-facebook-f"></i> </a>
                                                    </li>
                                                    <li>
                                                        <a href="#" target="_blank"><i class="fab fa-twitter"></i> </a>
                                                    </li>
                                                    <li>
                                                        <a href="#" target="_blank"><i class="fab fa-linkedin-in"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="#" target="_blank"><i class="fab fa-dribbble"></i> </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-lg-3 col-md-6">

                                    <div class="footer-widget footer-menu">
                                        <h2 class="footer-title">For Mentee</h2>
                                        <ul>
                                            <li><a href="search.html">Search Mentors</a></li>
                                            <li><a href="login.html">Login</a></li>
                                            <li><a href="register.html">Register</a></li>
                                            <li><a href="booking.html">Booking</a></li>
                                            <li><a href="dashboard-mentee.html">Mentee Dashboard</a></li>
                                        </ul>
                                    </div>

                                </div>
                                <div class="col-lg-3 col-md-6">

                                    <div class="footer-widget footer-menu">
                                        <h2 class="footer-title">For Mentors</h2>
                                        <ul>
                                            <li><a href="appointments.html">Appointments</a></li>
                                            <li><a href="chat.html">Chat</a></li>
                                            <li><a href="login.html">Login</a></li>
                                            <li><a href="register.html">Register</a></li>
                                            <li><a href="dashboard.html">Mentor Dashboard</a></li>
                                        </ul>
                                    </div>

                                </div>
                                <div class="col-lg-3 col-md-6">

                                    <div class="footer-widget footer-contact">
                                        <h2 class="footer-title">Contact Us</h2>
                                        <div class="footer-contact-info">
                                            <div class="footer-address">
                                                <span><i class="fas fa-map-marker-alt"></i></span>
                                                <p> 3556 Beech Street, San Francisco,<br> California, CA 94108 </p>
                                            </div>
                                            <p>
                                                <i class="fas fa-phone-alt"></i>
                                                +1 315 369 5943
                                            </p>
                                            <p class="mb-0">
                                                <i class="fas fa-envelope"></i>
                                                <a href="https://mentoring.dreamguystech.com/cdn-cgi/l/email-protection"
                                                   class="__cf_email__"
                                                   data-cfemail="5e333b302a312c3730391e3b263f332e323b703d3133">[email&#160;protected]</a>
                                            </p>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="footer-bottom">
                        <div class="container-fluid">

                            <div class="copyright">
                                <div class="row">
                                    <div class="col-12 text-center">
                                        <div class="copyright-text">
                                            <p class="mb-0">&copy; 2020 Mentoring. All rights reserved.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </form>

        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/plugins/select2/js/select2.min.js"></script>

        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>

        <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <script src="assets/js/script.js"></script>

        <script>
            // Main Wrapper Selector
            const avatarFileUpload = document.getElementById('AvatarFileUpload')
            // Preview Wrapper Selector
            const imageViewer = avatarFileUpload.querySelector('.selected-image-holder>img')
            // Image Input File Selector
            const imageInput = avatarFileUpload.querySelector('input[name="avatar"]')

            /** IF Selected Image has change */
            imageInput.addEventListener('change', e => {
                // Open File eader
                var reader = new FileReader();
                reader.onload = function () {
                    // Preview Image
                    imageViewer.src = reader.result;
                };
                // Read Selected Image as DataURL
                reader.readAsDataURL(e.target.files[0]);
            })
        </script>
    </body>

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/profile-settings.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:22 GMT -->

</html>
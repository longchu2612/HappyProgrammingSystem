<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <style>
            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button {
                /* display: none; <- Crashes Chrome on hover */
                -webkit-appearance: none;
                margin: 0; /* <-- Apparently some margin are still there even though it's hidden */
            }

            input[type=number] {
                -moz-appearance:textfield; /* Firefox */
            }
        </style>
    </head>

    <body>
        <form action="profile" method="post" enctype='multipart/form-data'>
            <div class="main-wrapper">
                <jsp:include page="header.jsp"></jsp:include>


                <div class="breadcrumb-bar">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col-md-12 col-12">
                                <nav aria-label="breadcrumb" class="page-breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="home">Home</a></li>
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
                                            <li><a href="schedule-timings.html"><i class="fas fa-hourglass-start"></i>Schedule Timings <span><i class="fas fa-chevron-right"></i></span></a></li>
                                            <li><a href="chat.html"><i class="fas fa-comments"></i>Messages <span><i
                                                            class="fas fa-chevron-right"></i></span></a></li>
                                            <li><a href="blog.html"><i class="fab fa-blogger-b"></i>Blog <span><i
                                                            class="fas fa-chevron-right"></i></span></a></li>
                                            <li><a href="profile"><i class="fas fa-user-cog"></i>Profile <span><i
                                                            class="fas fa-chevron-right"></i></span></a></li>
                                            <li><a href="account?action=logout2"><i class="fas fa-sign-out-alt"></i>Logout <span><i
                                                            class="fas fa-chevron-right"></i></span></a></li>
                                        </ul>
                                    </div>
                                </div>

                            </div>

                            <div class="col-md-7 col-lg-8 col-xl-9">
                                <div class="card">
                                    <div class="card-body">

                                        <div class="row form-row">
                                            <div class="col-12 col-md-12 d-flex justify-content-around">
                                                <div>
                                                    <c:choose>
                                                        <c:when test="${cv.status == 'Approve'}">
                                                            <p class="text-success"><span><i class="fa fa-unlock text-success"></i></span> ${cv.status}</p>
                                                                    </c:when>
                                                                    <c:when test="${cv.status == 'Reject'}">
                                                            <p class="text-danger"><span><i class="fa fa-lock text-danger"></i></span> ${cv.status}</p>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                            <p class="text-warning"><span><i class="fa fa-clock text-warning"></i></span> ${cv.status}</p>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-12">
                                                <div class="form-group">
                                                    <div class="change-avatar" id="AvatarFileUpload">
                                                        <div class="selected-image-holder">
                                                            <img id="userAvatar" src="${ac.getAvatar()}" alt="User Image" style="height: 100px; width: 100px; margin-right: 15px">
                                                        </div>
                                                        <div class="upload-img">
                                                            <div class="change-photo-btn">
                                                                <span><i class="fa fa-upload"></i> Upload Photo</span>
                                                                <input type="file" name="avatar" class="upload" id="avatarInput">
                                                            </div>
                                                            <small class="form-text text-muted">Allowed PNG, JPG. Max size of 2MB</small>
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
                                                    <input type="text" name="phone" value="${phone}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <input type="text" name="address" class="form-control" value="${ac.getAddress()}">
                                                </div>
                                            </div>
                                            <div class="submit-section" style="padding: 10px">
                                                &emsp; <button name="do" type="submit" class="btn btn-primary submit-btn" value="save-profile">Update profile</button>
                                            </div>
                                            <div class="col-12" style="background: #E4E4E4; padding: 10px">
                                                <div class="row">
                                                    <div class="col-12 col-md-6">
                                                        <div class="form-group">
                                                            <label>Job</label>
                                                            <input type="text" name="job" value="${cv.getJob()}" class="form-control">
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Rate ($/hrs)</label>
                                                            <input type="number" name="rate" value="${cv.getRate()}" class="form-control" min="1" step="1">
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-md-6">
                                                        <div class="form-group">
                                                            <label>Skills</label><br>
                                                            <div class="row">
                                                                <c:forEach items="${data}" var="sd">
                                                                    <div class="col-3 form-inline">
                                                                        <input type="checkbox" name="skill${sd.getId()}" value="${sd.getId()}" ${sd.getIs_checked()}> ${sd.getName()}
                                                                    </div>
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label>Introduction</label>
                                                        <textarea class="form-control" name="introduction" rows="10" placeholder="Introduction">${cv.getIntroduction()}</textarea>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label>Achievements</label>
                                                        <textarea class="form-control" name="achievements" rows="10" placeholder="Achievements">${cv.getAchievements()}</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="submit-section" style="padding: 10px">
                                            <button name="do" type="submit" class="btn btn-primary submit-btn" value="save">Update CV</button>
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



                                </div>
                                <div class="col-lg-3 col-md-6">



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

        <script>
            document.getElementById('avatarInput').addEventListener('change', function (event) {
                const file = event.target.files[0];
                if (file) {
                    // Ensure the file is a valid image type
                    const validImageTypes = ['image/jpeg', 'image/png'];
                    if (validImageTypes.includes(file.type) === false) {
                        alert('Please select a valid image file (PNG or JPG).');
                        location.reload(true);
                    }
                }
            });
        </script>
    </body>

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/profile-settings.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:22 GMT -->

</html>
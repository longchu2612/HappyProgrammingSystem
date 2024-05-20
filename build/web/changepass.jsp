<%-- 
    Document   : changepass
    Created on : May 18, 2024, 8:42:20 PM
    Author     : ngoqu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <h1>Change Password</h1>
    
                <form action="ChangePass" method="post">

                    <input type="hidden" name="username" value="${user.username}">

                    <div class="form-group">
                        <label for="oldPassword">Old Password</label>
                        <input type="password" class="form-control" name="oldPassword" id="oldPassword" placeholder="Enter your old password" required>
                    </div>

                    <div class="form-group">
                        <label for="newPassword">New Password</label>
                        <input type="password" class="form-control" name="newPassword" id="newPassword" placeholder="Enter your new password" required>
                    </div>

                    <div class="form-group">
                        <label for="confirmPassword">Confirm New Password</label>
                        <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="Confirm your new password" required>
                    </div>

                    <label>${msg}</label>
                    
                    <br>

                    <button type="submit" class="btn btn-primary">Change Password</button>
                </form>

            </div>

        </section>

    </body>

</html>

 
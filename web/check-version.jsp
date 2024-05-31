<%-- 
    Document   : check-version
    Created on : May 25, 2024, 3:02:14 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%= session.getServletContext().getMajorVersion() %>.
        <%= session.getServletContext().getMinorVersion() %>
    </body>
</html>

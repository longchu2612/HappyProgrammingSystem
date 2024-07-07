<%-- 
    Document   : index
    Created on : Jun 7, 2024, 11:55:16 PM
    Author     : ngoqu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%   request.getRequestDispatcher("home").forward(request, response);
        %>
    </body>
</html>

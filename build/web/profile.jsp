<%-- 
    Document   : profile
    Created on : Sep 25, 2019, 4:58:02 PM
    Author     : AMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
    </head>
    <body>
        <% 
            Object obj = session.getAttribute("username");
            if (obj == null) response.sendRedirect("/PRJ321x-A3/login.jsp");
            String username = (String)obj;
        %>
        <p>Username: <%= username %></p>
        <a href="/PRJ321x-A3/index.jsp">Back to Index</a>
    </body>
</html>

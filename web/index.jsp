<%-- 
    Document   : index
    Created on : Sep 25, 2019, 4:57:40 PM
    Author     : AMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
    </head>
    <body>
        <% 
            Object obj = session.getAttribute("username");
            if (obj == null) response.sendRedirect("/PRJ321x-A3/login.jsp");
        %>
        <a href="/PRJ321x-A3/welcome.jsp">Welcome</a><br />
        <a href="/PRJ321x-A3/profile.jsp">Profile</a><br />
        <a href="/PRJ321x-A3/userCounter.jsp">User Count</a>
        <% if (obj != null) { %>
        <br /><a href="/PRJ321x-A3/logoutProcess">Log out</a>
        <% } %>
    </body>
</html>

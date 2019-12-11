<%-- 
    Document   : login
    Created on : Sep 25, 2019, 4:56:06 PM
    Author     : AMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <% 
            Object obj = session.getAttribute("message");
            String message = obj == null ? "" : (String)obj;
        %>
        <form action="/PRJ321x-A3/loginProcess" method="POST">
            <div style="display: flex;">
                <div style="width: 100px;">Username</div>
                <div><input type="text" name="username" /></div>
            </div>
            <div style="display: flex;">
                <div style="width: 100px;">Password</div>
                <div><input type="password" name="password" /></div>
            </div>
            <div style="display: flex;">
                <div style="width: 100px;"></div>
                <div><input type="submit" value="Log in" /></div>
            </div>
        </form>
        <p style="color: red;"><%= message %></p>
        <%
            session.setAttribute("message", null);
        %>
    </body>
</html>

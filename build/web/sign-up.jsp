<%-- 
    Document   : signup
    Created on : Sep 25, 2019, 4:58:56 PM
    Author     : AMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up</title>
    </head>
    <body>
        <% 
            Object obj = session.getAttribute("message");
            String message = obj == null ? "" : (String)obj;
            obj = session.getAttribute("username check");
            String userCheck = obj == null ? "" : (String)obj;
            obj = session.getAttribute("password check");
            String passCheck = obj == null ? "" : (String)obj;
        %>
        <form action="/PRJ321x-A3/signupProcess" method="POST">
            <div style="display: flex;">
                <div style="width: 100px;">Username</div>
                <div><input type="text" name="username" /></div>
                <div style="color: red">&nbsp;<%= userCheck %></div>
            </div>
            <div style="display: flex;">
                <div style="width: 100px;">Password</div>
                <div><input type="password" name="password" /></div>
                <div style="color: red">&nbsp;<%= passCheck %></div>
            </div>
            <div style="display: flex;">
                <div style="width: 100px;"></div>
                <div><input type="submit" value="Submit" /></div>
            </div>
        </form>
        <p style="color: red;"><%= message %></p>
        <%
            session.setAttribute("message", null);
            session.setAttribute("username check", null);
            session.setAttribute("password check", null);
        %>
    </body>
</html>

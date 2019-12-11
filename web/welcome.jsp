<%-- 
    Document   : welcome
    Created on : Sep 25, 2019, 4:58:40 PM
    Author     : AMIN
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="entity.UserMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
    </head>
    <body>
        <% 
            Object obj = session.getAttribute("username");
            String title = "Welcome back!";
            if (session.isNew()) {
                title = "Welcome to the board";
            }
            UserMap map = UserMap.getInstance();
            if (map.getUserMap().isEmpty()) map.load();
        %>
        <h1><%= title %></h1>
        <a href="/PRJ321x-A3/index.jsp">Index</a><br />
        <a href="/PRJ321x-A3/login.jsp">Log in</a><br />
        <a href="/PRJ321x-A3/sign-up.jsp">Sign up</a>
        <% if (obj != null) { %>
        <br /><a href="/PRJ321x-A3/logoutProcess">Log out</a>
        <% } %>
        <% 
            obj = request.getServletContext().getAttribute("loggedIn");
            ArrayList<String> loggedIn = obj == null ? new ArrayList<>() : (ArrayList<String>)obj;
            request.getServletContext().setAttribute("loggedIn", loggedIn);
            request.getServletContext().setAttribute("loggedInCount", loggedIn.size());
        %>
    </body>
</html>

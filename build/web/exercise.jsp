<%-- 
    Document   : exercise
    Created on : 28 May 2025, 9:39:51 am
    Author     : User
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<html>
    <head>
        <title>Exercise Calorie Tracker</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    </head>
    <body class="container mt-4">
        <h2>Track Exercise Calories</h2>
        <form method="post" action="exerciseServlet">
            <div class="mb-3">
                <label for="exerciseName" class="form-label">Exercise Name</label>
                <input type="text" name="exerciseName" id="exerciseName" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Get Calorie Info</button>
        </form>

        <%
            String result = (String) request.getAttribute("result");
            if (result != null) {
        %>
        <div class="alert alert-info mt-3"><%= result%></div>
        <%
            }
        %>
    </body>
</html>

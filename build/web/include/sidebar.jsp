<%-- 
    Document   : include
    Created on : 28 May 2025, 8:17:17 am
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- sidebar.jsp -->
<style>
    .sidebar {
        background-color: #198754;
        color: white;
        padding: 20px;
        border-radius: 10px;
        height: 100vh;
        position: fixed;
        width: 220px;
        box-sizing: border-box;
    }
    .sidebar h5 {
        font-size: 1.5rem;
        margin-bottom: 30px;
        font-weight: bold;
    }
    .sidebar a {
        display: block;
        color: white;
        font-weight: 600;
        padding: 10px 15px;
        margin-bottom: 10px;
        border-radius: 8px;
        text-decoration: none;
        transition: background-color 0.3s;
    }
    .sidebar a:hover {
        background-color: #145c32; /* darker green */
        text-decoration: none;
    }
</style>

<div class="sidebar">
    <h5>Menu</h5>
    <a href="#" title="Home">Home</a>
    <a href="#" title="Nutrition Articles">Nutrition Articles</a>
    <a href="#" title="Health Tips">Health Tips</a>
    <a href="#" title="About Us">About Us</a>
    <a href="#" title="Contact">Contact</a>
</div>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <title>Skillgun Home Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #007bff;
            color: #fff;
            padding: 15px 20px;
            text-align: center;
        }
        nav {
            background-color: #0056b3;
            padding: 10px;
            text-align: center;
        }
        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
        }
        nav ul li {
            position: relative;
        }
        nav ul li a {
            color: #fff;
            text-decoration: none;
            padding: 10px 15px;
            display: block;
        }
        nav ul li a:hover {
            background-color: #007bff;
        }
        nav ul li:hover > ul {
            display: block;
        }
        nav ul ul {
            display: none;
            position: absolute;
            background-color: #0056b3;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 0;
        }
        nav ul ul li {
            width: 200px;
        }
        nav ul ul li a {
            padding: 10px;
        }
        .container {
            padding: 20px;
            text-align: center;
        }
        .card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            margin: 20px auto;
            max-width: 400px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card h3 {
            color: #007bff;
        }
        a.button {
            display: inline-block;
            padding: 10px 15px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
        }
        a.button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome to Skillgun!</h1>
    </header>
    
    <nav>
        <ul>
            
            <li><a href="home.jsp">Home</a></li>

            <li>
                <a href="#">Drives</a>
                <ul>
                    <li><a href="newPlacementDrive.jsp">New Placement Drive</a></li>
                    <li><a href="showDrives">show drives</a></li>
                    <li><a href="showDrives?status=Applied">Applied Drives</a></li>
                    <li><a href="showDrives?status=Canceled">Canceled Drives</a></li>
                    <li><a href="showDrives?status=Pending" class="buttons">View Pending Drives</a></li>
                    
                </ul>
            </li>

            <li><a href="Mockinterview.jsp">Mock Interview</a>
            </li>
            <li><a href="#">Study Materials</a>
            <ul>
                    <li><a href="javapdf.jsp">Java_Materials</a></li>
                    <li><a href="Python.jsp">Python_materials</a></li>
                    <li><a href="#">Dotnet_Materials</a></li>
                    
                </ul>
            </li>
            <li><a href="Profile.jsp">Profile</a></li>
            <li><a href="saleticket.jsp">Sale</a></li>
            <li><a href="BuyServlet">Buy</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </nav>
    
    <div class="container">
        <%
            if (session != null && session.getAttribute("user") != null) {
                String user = (String) session.getAttribute("user");
        %>
                <h2>Hello, <%= user %>! Welcome back!</h2>
        <% 
            } else {
                response.sendRedirect("login.jsp");
            }
        %>
        
        <div class="card">
            <h3>Start Your Learning Journey</h3>
            <p>Practice quizzes, prepare for interviews, and enhance your skills with Skillgun.</p>
            <a href="quizzes.jsp" class="button">Start Now</a>
        </div>
        
        <div class="card">
            <h3>Featured Topics</h3>
            <ul>
                <li><a href="java.jsp">Java</a></li>
                <li><a href="python.jsp">Python</a></li>
                <li><a href="datastructures.jsp">Data Structures</a></li>
                <li><a href="algorithms.jsp">Algorithms</a></li>
            </ul>
        </div>
    </div>
</body>
</html>

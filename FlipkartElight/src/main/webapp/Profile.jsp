<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        .profile-container {
            width: 100%;
            max-width: 600px;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .details {
            margin: 20px 0;
        }
        .details label {
            font-weight: bold;
            color: #555;
        }
        .details p {
            font-size: 16px;
            color: #666;
        }
        .logout-btn {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
        }
        .logout-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="profile-container">
        <h2>User Profile</h2>
        <div class="details">
            <% 
                
                if (session != null && session.getAttribute("user") != null) {
                    String userName = (String) session.getAttribute("user");
                    String userEmail = (String) session.getAttribute("email");
                    String userPhone = (String) session.getAttribute("phone");
                    String D_Of_B = (String) session.getAttribute("D_Of_B");
            %>
            <p><label>Name: </label> <%= userName %></p>
            <p><label>Email: </label> <%= userEmail %></p>
            <p><label>Phone: </label> <%= userPhone %></p>
            <p><label>Date_Of_Birth: </label> <%= D_Of_B %></p>
            
            <% 
                } else { 
                    response.sendRedirect("login.jsp");
                }
            %>
        </div>
        <a href="logout.jsp" class="logout-btn">Logout</a>
    </div>
</body>
</html>

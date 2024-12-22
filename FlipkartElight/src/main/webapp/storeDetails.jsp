<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mock Interview Details</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
    }
    .details {
        padding: 20px;
        background: #f9f9f9;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }
    h2 {
        color: #333;
    }
</style>
</head>
<body>
<div class="details">
    <h2>Mock Interview Attendee Details</h2>
    <p><strong>Name:</strong> <%= request.getParameter("name") %></p>
    <p><strong>Email:</strong> <%= request.getParameter("email") %></p>
    <p><strong>Phone:</strong> <%= request.getParameter("phone") %></p>
    <p><strong>Interview Date:</strong> <%= request.getParameter("date") %></p>
    <p><strong>Time Slot:</strong> <%= request.getParameter("timeSlot") %></p>
    <p><strong>Mode of Interview:</strong> <%= request.getParameter("mode") %></p>
    <p><strong>Subject:</strong> <%= request.getParameter("subject") %></p>
</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Results</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            padding: 30px;
        }
        .result-container {
            max-width: 700px;
            margin: auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h1 {
            color: #28a745;
        }
        .score {
            font-size: 2em;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="result-container">
        <h1>Thank You for Completing the Quiz!</h1>
        <% 
        String username = (String) session.getAttribute("name");
        if (username == null) {
            username = "Guest";
        }
        int score = 0;

        
        String[] correctAnswers = {
            "b", "a", "c", "d", "c", "b", "b", "a", "b", "a",
            "c", "a", "a", "b", "b", "c", "c", "c", "d", "a",
            "b", "b", "a", "a", "a",
            "b", "a", "a", "a", "d"
        };

        for (int i = 0; i < correctAnswers.length; i++) {
            String userAnswer = request.getParameter("q" + i);
            if (userAnswer != null && userAnswer.equals(correctAnswers[i])) {
                score++;
            }
        }
        %>
        <p>Hello, <%= username %>!</p>
        <div class="score">Your Score: <%= score %> out of 30</div>
        <div><a href="home.jsp" class="btn">Return to Home Page</a></div>
    </div>
</body>
</html>

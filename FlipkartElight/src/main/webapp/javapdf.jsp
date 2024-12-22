<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Java PDF Downloads</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        h1 {
            text-align: center;
            color: #333;
            margin: 20px 0;
        }

        ul {
            list-style-type: none;
            padding: 0;
            width: 50%;
            margin: 0 auto;
        }

        li {
            margin: 10px 0;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        li a {
            color: white;
            text-decoration: none;
            font-size: 18px;
        }

        li:hover {
            background-color: #45a049;
        }
        
        .buttons {
            display: inline-block;
            margin: 20px auto;
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-color: #4CAF50;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            text-align: center;
            transition: background-color 0.3s ease;
        }

        .buttons:hover {
            background-color: #45a049;
        }
         .container {
            text-align: center;
        }
        
    </style>
</head>
<body>
    <h1>Download Java PDFs</h1>
    <ul>
        <li><a href="download?filename=corejava.pdf">Core Java</a></li>
        <li><a href="download?filename=JJ2EE_.pdf">Advance Java</a></li>
        <li><a href="download?filename=mysql_material.pdf">MySQL</a></li>
    </ul>
    <div class="container">
    <a href="home.jsp" class="buttons">Return to home</a>
    </div>
</body>
</html>

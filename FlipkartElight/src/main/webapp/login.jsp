<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <style>
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #00c6ff, #0072ff);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background-color: #ffffff;
            padding: 50px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 100%;
            max-width: 350px;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        label {
            display: block;
            text-align: left;
            margin-bottom: 8px;
            font-weight: bold;
            color: #666;
        }

        input[type="text"], 
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #0072ff;
            outline: none;
        }

        .buttons-container {
            display: flex;
            justify-content: space-between;
            gap: 5px; 
        }

        .btn {
            width: 48%;
            padding: 10px;
            background-color: #0072ff;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            font-size: 18px;
            text-align: center;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #005bb5;
        }

        .register-btn {
    background-color: #28a745;
    text-decoration: none;
    text-align: center;        
    display: inline-block;     
    padding: 10px 10px;        
    line-height: 2.0;          
    vertical-align: middle;    
}


        .register-btn:hover {
            background-color: #218838;
        }

        .error {
            color: red;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form action="LoginServlet" method="post">
            
            <label for="email">Email:</label>
            <input type="text" id="email" name="email" placeholder="Enter your email" required>

            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>

            
            <div class="buttons-container">
                
                <input type="submit" value="Login" class="btn">

                
                <a href="Register.jsp" class="btn register-btn">Register</a>
                
                <a href="forgotPassword.jsp" style="display:block; margin-top: 15px; color: 
                #0072ff;">Forgot Password?</a>
                
            </div>
        </form>

        
        <% if (request.getAttribute("errorMessage") != null) { %>
            <p class="error"><%= request.getAttribute("errorMessage") %></p>
        <% } %>
    </div>
</body>
</html>

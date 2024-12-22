<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; }
        .container { margin-top: 50px; }
        input { width: 80%; padding: 10px; margin: 10px; }
        .btn { background-color: #0072ff; color: white; padding: 10px; cursor: pointer; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Reset Your Password</h2>
        <form action="ForgotPassword" method="post">
            <input type="email" name="email" placeholder="Enter your registered email" required>
            <input type="submit" value="Send Reset Code" class="btn">
        </form>
    </div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Reset Password</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; }
        .container { margin-top: 50px; }
        input { width: 80%; padding: 10px; margin: 10px; }
        .btn { background-color: #0072ff; color: white; padding: 10px; cursor: pointer; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Enter Reset Code & New Password</h2>
        <form action="ResetPasswordServlet" method="post">
            <input type="text" name="resetCode" placeholder="Enter reset code" required>
            <input type="password" name="newPassword" placeholder="Enter new password" required>
            <input type="submit" value="Reset Password" class="btn">
        </form>
    </div>
</body>
</html>

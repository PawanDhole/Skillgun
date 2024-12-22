<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>User Registration</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-image: url('images/image2.jpg'); /* Path to your image */
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	background-attachment: fixed;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.registration-container {
	width: 100%;
	max-width: 400px;
	background-color: rgba(255, 255, 255, 0.9);
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	color: #333;
}

label {
	display: block;
	margin-top: 15px;
	font-weight: bold;
	color: #555;
}

input[type="text"], input[type="email"], input[type="tel"], input[type="password"],
	input[type="date"] {
	width: 100%;
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type="submit"] {
	width: 48%;
	padding: 12px;
	background-color: #4CAF50;
	border: none;
	border-radius: 4px;
	color: white;
	font-size: 16px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #45a049;
}

.form-group {
	margin-bottom: 15px;
}

.note {
	font-size: 14px;
	color: #777;
	text-align: center;
	margin-top: 10px;
}

/* Styles for button and login link */
.button-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 20px;
}

.login-link {
	text-align: right;
	font-size: 14px;
	color: #4CAF50;
	text-decoration: none;
	padding: 12px;
	cursor: pointer;
}

.login-link:hover {
	color: #45a049;
}
</style>
</head>
<body>
	<div class="registration-container">
		<h2>Register</h2>
		<form action="RegisterServlet" method="post">
			<div class="form-group">
				<label for="name">Name:</label> <input type="text" id="name"
					name="name" required>
			</div>

			<div class="form-group">
				<label for="email">Email:</label> <input type="email" id="email"
					name="email" required>
			</div>

			<div class="form-group">
				<label for="phonenu">Phone Number:</label> <input type="tel"
					id="phonenu" name="phonenu" pattern="[0-9]{10}" required>
			</div>

			<div class="form-group">
				<label for="setpassword">Password:</label> <input type="password"
					id="setpassword" name="setpassword" required
					pattern="^(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,12}$"
					title="Password must be 8-12 characters long, contain at least one uppercase letter, and one number">
			</div>

			<div class="form-group">
				<label for="reenterpassword">Re-enter Password:</label> <input
					type="password" id="reenterpassword" name="reenterpassword"
					required>
			</div>


			<div class="form-group">
				<label for="dateofbirth">Date of Birth:</label> <input type="date"
					id="dateofbirth" name="dateofbirth" required>
			</div>

			<div class="button-container">
				<input type="submit" value="Register"> <a href="login.jsp"
					class="login-link"><p>if already registered please</p>Login</a>
			</div>
		</form>
		<p class="note">All fields are required</p>
	</div>
</body>
</html>

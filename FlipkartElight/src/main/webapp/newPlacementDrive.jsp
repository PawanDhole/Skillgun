<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>New Placement Drive</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f7f7f7;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	min-height: 100vh;
	margin: 0;
}

h2 {
	color: #4CAF50;
}

.container {
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 20px;
	width: 400px;
	margin-top: 20px;
}

form {
	display: flex;
	flex-direction: column;
}

label {
	margin-top: 10px;
	font-weight: bold;
}

input[type="text"], input[type="number"] {
	padding: 8px;
	margin-top: 5px;
	border-radius: 4px;
	border: 1px solid #ddd;
}


button, input[type="submit"], a.button {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 10px;
    border-radius: 4px;
    cursor: pointer;
    margin-top: 20px;
    text-decoration: none; /* Remove underline for links */
    display: inline-block; /* Ensure link behaves like a button */
    transition: background-color 0.3s ease;
    text-align: center;
}

button:hover, input[type="submit"]:hover, a.button:hover {
    background-color: #45a049;
}


.form-section {
	margin-bottom: 30px;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Add New Placement Drive</h2>
		<form action="addPlacement" method="post" class="form-section">
			<label>Company Name:</label> <input type="text" name="companyName"
				placeholder="Enter company name" required> <label>Company
				Address:</label> <input type="text" name="companyAddress"
				placeholder="Enter company address" required> <label>Position:</label>
			<input type="text" name="position" placeholder="Enter position"
				required> <label>Salary:</label> <input type="number"
				step="0.01" name="salary" placeholder="Enter salary" required>

			<label>Required Skills:</label> <input type="text"
				name="requiredSkills" placeholder="Enter required skills" required>

			<input type="submit" value="Add Placement Drive">
			<a href="showDrives" class="button">View All Placement Drives</a>


		</form>

		<h2>Remove Placement Drive</h2>
		<form action="deletePlacement" method="post">
			<label>Enter Company Name to Delete:</label> <input type="text"
				name="companyName" placeholder="Enter company name" required>
			<input type="submit" value="Remove"> <a href="home.jsp" class="button">Go
				to Home Page</a>
		</form>
	</div>
</body>
</html>

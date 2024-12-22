<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.flipkart.PlacementDrive"%>
<!DOCTYPE html>
<html>
<head>
    <title>Pending Placement Drives</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        h2 {
            text-align: center;
            margin: 20px 0;
            color: #333;
        }

        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        th, td {
            padding: 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
            text-align: center;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        td {
            text-align: center;
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

        .no-data {
            text-align: center;
            font-size: 18px;
            color: red;
        }

        a.button {
            background-color: #4CAF50;
            color: white;
            padding: 8px 12px;
            border-radius: 4px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        a.button:hover {
            background-color: #45a049;
        }

        a.cancel {
            background-color: #f44336;
        }

        a.cancel:hover {
            background-color: #d32f2f;
        }
    </style>
    <script>
        function confirmAction(event, action) {
            event.preventDefault(); // Prevent the default link behavior
            const userConfirmed = confirm(`Are you sure you want to ${action}?`);
            if (userConfirmed) {
                // If confirmed, proceed to the link
                window.location.href = event.target.href;
            }
        }
    </script>
</head>
<body>
    <h2>Pending Placement Drives</h2>
    <%
    List<PlacementDrive> drivesList = (List<PlacementDrive>) request.getAttribute("drivesList");

    if (drivesList != null && !drivesList.isEmpty()) {
    %>
    <table>
        <tr>
            <th>Company Name</th>
            <th>Company Address</th>
            <th>Position</th>
            <th>Salary</th>
            <th>Required Skills</th>
            <th>Action</th>
        </tr>

        <%
        for (PlacementDrive drive : drivesList) {
            String action = drive.getStatus().equals("Applied") ? "Cancel" : "Apply";
            String buttonClass = action.equals("Apply") ? "button" : "button cancel";
        %>

        <tr>
            <td><%=drive.getCompanyName()%></td>
            <td><%=drive.getCompanyAddress()%></td>
            <td><%=drive.getPosition()%></td>
            <td><%=drive.getSalary()%></td>
            <td><%=drive.getRequiredSkills()%></td>
            <td>
                <a
                    href="manageDrive?companyName=<%=drive.getCompanyName()%>&action=<%=action.toLowerCase()%>"
                    class="<%=buttonClass%>"
                    onclick="confirmAction(event, '<%=action.toLowerCase()%>')">
                    <%=action%>
                </a>
            </td>
        </tr>
        <%
        }
        %>
    </table>
    <%
    } else {
    %>
    <p class="no-data">No Pending placement drives found.</p>
    <%
    }
    %>
    <div style="text-align: center;">
        <a href="showDrives" class="buttons">Back to All Drives</a>
    </div>
</body>
</html>

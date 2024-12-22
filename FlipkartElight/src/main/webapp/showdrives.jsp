<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.flipkart.PlacementDrive"%>
<!DOCTYPE html>
<html>
<head>
    <title>Placement Drives</title>
    <style>
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }

        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
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

        a.buttons {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 20px;
            text-decoration: none; 
            display: inline-block; 
            transition: background-color 0.3s ease;
            text-align: center;
        }

        a.buttons:hover {
            background-color: #45a049;
        }

        .container {
            text-align: center;
        }
    </style>
    <script>
        function confirmAction(event, action) {
            event.preventDefault(); // Prevent default navigation
            const confirmationMessage = `Are you sure you want to ${action}?`;
            const userConfirmed = confirm(confirmationMessage);
            if (userConfirmed) {
                window.location.href = event.target.href; // Proceed if confirmed
            }
        }
    </script>
</head>
<body>
    <h2 style="text-align: center;">Available Placement Drives</h2>
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
            <th>Status</th>
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
            <td><%=drive.getStatus()%></td>
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
    <p style="text-align: center; color: red;">No placement drives available at the moment.</p>
    <%
    }
    %>
    <div class="container">
        <a href="home.jsp" class="buttons">Return to home</a>
        <a href="showDrives?status=Applied" class="buttons">View Applied Drives</a>
        <a href="showDrives?status=Canceled" class="buttons">View Cancelled Drives</a>
        <a href="showDrives?status=Pending" class="buttons">View Pending Drives</a>
    </div>
</body>
</html>

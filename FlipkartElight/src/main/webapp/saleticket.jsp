<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Sell Your Train Ticket</title>
    <script>
        function toggleForm() {
            var checkbox = document.getElementById("haveTicket");
            var form = document.getElementById("ticketForm");
            form.style.display = checkbox.checked ? "block" : "none";
        }
    </script>
    <style>
        #ticketForm { display: none; margin-top: 20px; }
    </style>
</head>
<body>
    <h3>Ticket Details</h3>
<form action="SellTicketServlet" method="post">
    <label>Train Number: <input type="text" name="trainNumber" required></label><br>
    <label>Date of Travel: <input type="date" name="travelDate" required></label><br>
    <label>PNR Number: <input type="text" name="pnr" required></label><br>
    <label>Class: <input type="text" name="ticketClass" required></label><br>
    <label>Boarding Station: <input type="text" name="boardingStation" required></label><br>
    <label>Leaving Station: <input type="text" name="leavingStation" required></label><br>
    <h3>Seller Information</h3>
    <label>Name: <input type="text" name="sellerName" required></label><br>
    <label>Contact Number: <input type="text" name="sellerContact" required></label><br>
    <button type="submit">Submit</button>
</form>

    
</body>
</html>

<%@ page import="java.util.ArrayList" %>
<%@ page import="com.flipkart.Ticket" %>
<%
    ArrayList<Ticket> tickets = (ArrayList<Ticket>) request.getAttribute("tickets");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Buy Tickets</title>
</head>
<body>
<a href="home.jsp">Home</a>
    <h1>Available Tickets</h1>
    
    <div>
        <% if (tickets != null && !tickets.isEmpty()) {
            for (Ticket ticket : tickets) { %>
                <div>
                    <p><strong>Train Number:</strong> <%= ticket.getTrainNumber() %></p>
                    <p><strong>Date of Travel:</strong> <%= ticket.getTravelDate() %></p>
                    <p><strong>PNR:</strong> <%= ticket.getPnr() %></p>
                    <p><strong>Class:</strong> <%= ticket.getTicketClass() %></p>
                    <p><strong>Boarding Station:</strong> <%= ticket.getBoardingStation() %></p>
                    <p><strong>Leaving Station:</strong> <%= ticket.getLeavingStation() %></p>
                    <p><strong>Seller:</strong> <%= ticket.getSellerName() %> (<%= ticket.getSellerContact() %>)</p>
                </div>
                <hr/>
                
        <%  }
        } else { %>
            <p>No tickets available.</p>
        <% } %>
    </div>
    
</body>
</html>

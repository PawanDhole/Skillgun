package com.flipkart;

import java.io.*;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SellTicketServlet")
public class SellTicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String trainNumber = request.getParameter("trainNumber");
        String travelDate = request.getParameter("travelDate");
        String pnr = request.getParameter("pnr");
        String ticketClass = request.getParameter("ticketClass");
        String sellerName = request.getParameter("sellerName");
        String sellerContact = request.getParameter("sellerContact");
        String boardingStation = request.getParameter("boardingStation");
        String leavingStation = request.getParameter("leavingStation");

        try (Connection con = Databaseconnectioncheck.getConnection()) {
            String query = "INSERT INTO tickets (train_number, travel_date, pnr, class, seller_name, seller_contact, boarding_station, leaving_station) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, trainNumber);
            ps.setString(2, travelDate);
            ps.setString(3, pnr);
            ps.setString(4, ticketClass);
            ps.setString(5, sellerName);
            ps.setString(6, sellerContact);
            ps.setString(7, boardingStation);
            ps.setString(8, leavingStation);

            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                response.getWriter().println("Ticket listed for sale successfully!");
                
            } else {
                response.getWriter().println("Failed to list the ticket.");
            }
        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}

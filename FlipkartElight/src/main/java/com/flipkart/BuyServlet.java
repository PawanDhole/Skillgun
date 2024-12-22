package com.flipkart;



import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/BuyServlet")
public class BuyServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = Databaseconnectioncheck.getConnection();
            String sql = "SELECT id, train_number, travel_date, pnr, class, seller_name, seller_contact, boarding_station, leaving_station FROM tickets";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            ArrayList<Ticket> tickets = new ArrayList<>();
            while (rs.next()) {
                Ticket ticket = new Ticket();
                ticket.setId(rs.getInt("id"));
                ticket.setTrainNumber(rs.getString("train_number"));
                ticket.setTravelDate(rs.getDate("travel_date"));
                ticket.setPnr(rs.getString("pnr"));
                ticket.setTicketClass(rs.getString("class"));
                ticket.setSellerName(rs.getString("seller_name"));
                ticket.setSellerContact(rs.getString("seller_contact"));
                ticket.setBoardingStation(rs.getString("boarding_station"));
                ticket.setLeavingStation(rs.getString("leaving_station"));
                tickets.add(ticket);
            }
            request.setAttribute("tickets", tickets);
            request.getRequestDispatcher("buy.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

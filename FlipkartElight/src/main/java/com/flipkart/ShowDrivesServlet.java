package com.flipkart;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/showDrives")
public class ShowDrivesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String statusFilter = request.getParameter("status"); // Get the status filter, if any
        List<PlacementDrive> drivesList = new ArrayList<>();

        String query = "SELECT company_name, company_address, position, salary, required_skills, status FROM placement_drives";
        if (statusFilter != null) {
            query += " WHERE status = ?";
        }

        try (Connection con = Databaseconnectioncheck.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {
            if (statusFilter != null) {
                stmt.setString(1, statusFilter);
            }
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                PlacementDrive drive = new PlacementDrive(
                    rs.getString("company_name"),
                    rs.getString("company_address"),
                    rs.getString("position"),
                    rs.getDouble("salary"),
                    rs.getString("required_skills"),
                    rs.getString("status")
                );
                drivesList.add(drive);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        request.setAttribute("drivesList", drivesList);

        if ("Applied".equalsIgnoreCase(statusFilter)) {
            request.getRequestDispatcher("applied.jsp").forward(request, response);
        } else if ("Canceled".equalsIgnoreCase(statusFilter)) {
            request.getRequestDispatcher("cancelled.jsp").forward(request, response);
        } else if ("Pending".equalsIgnoreCase(statusFilter)) {
            request.getRequestDispatcher("Pending.jsp").forward(request, response);
        }else {
            request.getRequestDispatcher("showdrives.jsp").forward(request, response);
        }
    }
}

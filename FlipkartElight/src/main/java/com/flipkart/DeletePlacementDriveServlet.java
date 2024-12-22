package com.flipkart;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deletePlacement")
public class DeletePlacementDriveServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String companyName = request.getParameter("companyName");

        try (Connection con = Databaseconnectioncheck.getConnection();
             PreparedStatement stmt = con.prepareStatement("DELETE FROM placement_drives WHERE company_name = ?")) {
            stmt.setString(1, companyName);
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Placement drive deleted successfully.");
            } else {
                System.out.println("No drive found with the given company name.");
            }

            response.sendRedirect("showDrives");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}

package com.flipkart;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addPlacement")
public class AddPlacementDriveServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String companyName = request.getParameter("companyName");
        String companyAddress = request.getParameter("companyAddress");
        String position = request.getParameter("position");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String requiredSkills = request.getParameter("requiredSkills");

        try (Connection con = Databaseconnectioncheck.getConnection();
             PreparedStatement stmt = con.prepareStatement(
                     "INSERT INTO placement_drives (company_name, company_address, position, salary, required_skills) VALUES (?, ?, ?, ?, ?)")) {
            stmt.setString(1, companyName);
            stmt.setString(2, companyAddress);
            stmt.setString(3, position);
            stmt.setDouble(4, salary);
            stmt.setString(5, requiredSkills);
            stmt.executeUpdate();

            response.sendRedirect("showDrives");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}

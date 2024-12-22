package com.flipkart;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/manageDrive")
public class ManageDriveServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String companyName = request.getParameter("companyName");
        String action = request.getParameter("action");

        if (companyName != null && action != null) {
            try (Connection con = Databaseconnectioncheck.getConnection()) {
                String updateQuery;
                
                
                if (action.equals("apply")) {
                    updateQuery = "UPDATE placement_drives SET status = 'Applied' WHERE company_name = ?";
                } else if (action.equals("cancel")) {
                    updateQuery = "UPDATE placement_drives SET status = 'Canceled' WHERE company_name = ?";
                } else {
                    response.sendRedirect("showDrives");
                    return;
                }

                try (PreparedStatement stmt = con.prepareStatement(updateQuery)) {
                    stmt.setString(1, companyName);
                    stmt.executeUpdate();
                }

                
                response.sendRedirect("showDrives");

            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
        } else {
            
            response.sendRedirect("showDrives");
        }
    }
}

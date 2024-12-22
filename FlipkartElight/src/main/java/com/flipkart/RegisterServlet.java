package com.flipkart;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phonenu");
        String password = request.getParameter("setpassword");
        String reenterPassword = request.getParameter("reenterpassword");
        String dateOfBirth = request.getParameter("dateofbirth");

        
        if (!password.equals(reenterPassword)) {
            response.getWriter().println("Passwords do not match.");
            return;
        }

        response.getWriter().println("Your data was sent to backend " + name);

        try {
            
            Connection con = Databaseconnectioncheck.getConnection();
            System.out.println("------------- connected");

            String query = "INSERT INTO RegisterEntityUser (name, email, phonenu, setpassword, reenterpassword, dateofbirth) VALUES (?, ?,?, ?, ?, ?)";
            
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, phone);
            pstmt.setString(4, password);
            pstmt.setString(5, reenterPassword);
            pstmt.setString(6, dateOfBirth);

            int result = pstmt.executeUpdate();

            if (result > 0) {
                response.getWriter().println("Registration successful for user: " + name);
                response.sendRedirect("login.jsp");
            } else {
                response.getWriter().println("Registration failed for user: " + name);
            }
            
            
            pstmt.close();
            con.close();
        } 
        catch (ClassNotFoundException e) {
            System.out.println("Driver not found: " + e.getMessage());
            response.getWriter().println("Error: " + e.getMessage());
        } 
        catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Registration failed for: " + name + ". Error: " + e.getMessage());
        }
    }
}

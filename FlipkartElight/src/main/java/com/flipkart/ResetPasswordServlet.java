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
import jakarta.servlet.http.HttpSession;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String resetCode = request.getParameter("resetCode");
        String newPassword = request.getParameter("newPassword");

        HttpSession session = request.getSession();
        String sessionCode = (String) session.getAttribute("resetCode");
        String email = (String) session.getAttribute("email");

        if (sessionCode != null && sessionCode.equals(resetCode)) {
            try (Connection con = Databaseconnectioncheck.getConnection()) {
                String updateQuery = "UPDATE RegisterEntityUser SET setpassword = ? WHERE email = ?";
                PreparedStatement pstmt = con.prepareStatement(updateQuery);
                pstmt.setString(1, newPassword);
                pstmt.setString(2, email);
                pstmt.executeUpdate();

                response.sendRedirect("login.jsp");
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("errorMessage", "Invalid reset code!");
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
        }
    }
}

package com.flipkart;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	
    	
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        

        try {
            
            Connection con = Databaseconnectioncheck.getConnection();

            
            String query = "SELECT * FROM RegisterEntityUser WHERE email = ? AND setpassword = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
           
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                
            	String name = rs.getString("name");
            	String Email = rs.getString("email");
            	String phonenu = rs.getString("phonenu");
            	String dateofbirth = rs.getString("dateofbirth");
                HttpSession session = request.getSession();
                session.setAttribute("user", name);
                session.setAttribute("email", Email); 
                session.setAttribute("phone",phonenu );
                session.setAttribute("D_Of_B",dateofbirth );
                
                
                
                response.sendRedirect("home.jsp");
            } else {
                
                request.setAttribute("errorMessage", "Invalid email or password!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

            
            rs.close();
            pstmt.close();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}

<%-- 
    Document   : forgotPasswordCheck
    Created on : 27 Apr 2025, 3:19:35 pm
    Author     : Masziana Soffian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Password Found</title>
</head>
<body>

<%
    String username = request.getParameter("username");
    String empId = request.getParameter("employeeId");

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hkms_db?useSSL=false&serverTimezone=UTC", "root", "");

        String sql = "SELECT password FROM users WHERE username = ? AND employee_id = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, username);
        stmt.setString(2, empId);

        rs = stmt.executeQuery();

        if (rs.next()) {
            String password = rs.getString("password");
%>
            <h2 style="text-align:center;">Your Password is: <span style="color:blue;"><%= password %></span></h2>
<%
        } else {
%>
            <h2 style="text-align:center; color:red;">Username and Employee ID do not match!</h2>
<%
        }

    } catch (Exception e) {
        out.println("<h2>Error: " + e.getMessage() + "</h2>");
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<br><br>
<form action="login.jsp" method="get">
    <input type="submit" value="Back to Login Page" style="padding:10px 20px; background-color:#4CAF50; color:white; border:none; cursor:pointer; font-size:16px;">
</form>

</body>
</html>

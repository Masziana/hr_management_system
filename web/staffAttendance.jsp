<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ include file="sidebarStaff.jsp" %>


<%
    String employeeID = (String) session.getAttribute("employeeID");
    String name = (String) session.getAttribute("name");

    String status = null;
    String message = null;

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        LocalDate today = LocalDate.now();
        String attendanceDate = today.toString();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/hr_db?useSSL=false&serverTimezone=UTC", "root", "");

            // Check if already clocked in
            PreparedStatement checkStmt = con.prepareStatement(
                "SELECT * FROM Attendance WHERE employeeID=? AND attendanceDate=?"
            );
            checkStmt.setString(1, employeeID);
            checkStmt.setString(2, attendanceDate);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                status = "already";
                message = "✖ You already clocked in today!";
            } else {
                // Insert new attendance
                PreparedStatement insertStmt = con.prepareStatement(
                    "INSERT INTO Attendance (employeeID, attendanceDate, status) VALUES (?, ?, ?)"
                );
                insertStmt.setString(1, employeeID);
                insertStmt.setString(2, attendanceDate);
                insertStmt.setString(3, "Present");

                insertStmt.executeUpdate();
                status = "success";
                message = "✔ You have clocked in successfully!";
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            status = "error";
            message = "Something went wrong. Please try again.";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Staff Clock In</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f0f6fc;
        }

        .clockin-container {
            max-width: 500px;
            margin: 100px auto;
            background: white;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .clockin-container h2 {
            color: #1f4e70;
            font-size: 24px;
            margin-bottom: 25px;
        }

        .message {
            font-size: 16px;
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 8px;
            font-weight: bold;
        }

        .success {
            background-color: #d4edda;
            color: #155724;
        }

        .error {
            background-color: #f8d7da;
            color: #721c24;
        }

        .clockin-button {
            background-color: #1f4e70;
            color: white;
            padding: 14px 28px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .clockin-button:disabled {
            background-color: #aaa;
            cursor: not-allowed;
        }

        .clockin-button:hover:not(:disabled) {
            background-color: #2e6a91;
        }
    </style>
</head>
<body>
<div class="content">
    <div class="clockin-container">
        <h2>Hi <%= name != null ? name : employeeID %> 👋</h2>

        <% if (status != null) { %>
            <div class="message <%= "success".equals(status) ? "success" : "error" %>">
                <%= message %>
            </div>
        <% } %>

        <form method="post" action="">
            <input type="hidden" name="employeeID" value="<%= employeeID %>">
            <button type="submit" class="clockin-button"
                    <%= "already".equals(status) ? "disabled" : "" %>>
                <%= "already".equals(status) ? "✅ Clocked In" : "🕒 Clock In Now" %>
            </button>
        </form>
    </div>
</div>
</body>
</html>

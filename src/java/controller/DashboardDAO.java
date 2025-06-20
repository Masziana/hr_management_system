package controller;

import java.sql.*;

public class DashboardDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/hr_db";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("JDBC Driver not found.");
        }
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public int getTotalEmployees() {
        return getCount("SELECT COUNT(*) FROM employee");
    }

    public int getTotalDepartments() {
        return getCount("SELECT COUNT(*) FROM department");
    }

    public int getLeaveApplied() {
        return getCount("SELECT COUNT(*) FROM leave_applications");
    }

    public int getLeaveApproved() {
        return getCount("SELECT COUNT(*) FROM leave_applications WHERE status = 'Approved'");
    }

    public int getLeaveRejected() {
        return getCount("SELECT COUNT(*) FROM leave_applications WHERE status = 'Rejected'");
    }

    private int getCount(String query) {
        int count = 0;
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
}


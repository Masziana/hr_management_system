package dao;

import java.sql.*;
import java.util.*;
import model.Leave;

public class LeaveDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/hr_db";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "";

    public LeaveDAO() {}

    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found", e);
        }
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    // ✅ Insert leave application
    public void applyLeave(Leave leave) {
        String sql = "INSERT INTO leave_applications (employeeID, leaveType, startDate, endDate, reason, status) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, leave.getEmployeeID());
            stmt.setString(2, leave.getLeaveType());
            stmt.setString(3, leave.getStartDate());
            stmt.setString(4, leave.getEndDate());
            stmt.setString(5, leave.getReason());
            stmt.setString(6, leave.getStatus());

            stmt.executeUpdate();
            System.out.println("✅ Leave application inserted successfully.");

        } catch (SQLException e) {
            System.err.println("❌ Error inserting leave application.");
            e.printStackTrace();
        }
    }

    // ✅ Retrieve all leaves
    public List<Leave> getAllLeaves() {
        List<Leave> list = new ArrayList<>();
        String sql = "SELECT * FROM leave_applications ORDER BY leaveID DESC";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Leave leave = new Leave();
                leave.setLeaveID(rs.getInt("leaveID"));
                leave.setEmployeeID(rs.getString("employeeID"));
                leave.setLeaveType(rs.getString("leaveType"));
                leave.setStartDate(rs.getString("startDate"));
                leave.setEndDate(rs.getString("endDate"));
                leave.setReason(rs.getString("reason"));
                leave.setStatus(rs.getString("status"));
                list.add(leave);
            }

            System.out.println("✅ Total leaves fetched: " + list.size());

        } catch (SQLException e) {
            System.err.println("❌ Error retrieving all leaves.");
            e.printStackTrace();
        }

        return list;
    }

    // ✅ Retrieve leaves by specific employee
    public List<Leave> getLeavesByEmployeeID(String employeeID) {
        List<Leave> leaves = new ArrayList<>();
        String sql = "SELECT * FROM leave_applications WHERE employeeID = ? ORDER BY leaveID DESC";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, employeeID);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Leave leave = new Leave();
                leave.setLeaveID(rs.getInt("leaveID"));
                leave.setEmployeeID(rs.getString("employeeID"));
                leave.setLeaveType(rs.getString("leaveType"));
                leave.setStartDate(rs.getString("startDate"));
                leave.setEndDate(rs.getString("endDate"));
                leave.setReason(rs.getString("reason"));
                leave.setStatus(rs.getString("status"));
                leaves.add(leave);
            }

            System.out.println("✅ Fetched " + leaves.size() + " leaves for employee ID: " + employeeID);

        } catch (SQLException e) {
            System.err.println("❌ Error retrieving leaves by employee ID.");
            e.printStackTrace();
        }

        return leaves;
    }

    // ✅ Update leave by ID
    public void updateLeave(Leave leave) {
        String sql = "UPDATE leave_applications SET employeeID=?, leaveType=?, startDate=?, endDate=?, reason=?, status=? WHERE leaveID=?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, leave.getEmployeeID());
            stmt.setString(2, leave.getLeaveType());
            stmt.setString(3, leave.getStartDate());
            stmt.setString(4, leave.getEndDate());
            stmt.setString(5, leave.getReason());
            stmt.setString(6, leave.getStatus());
            stmt.setInt(7, leave.getLeaveID());

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                System.out.println("✅ Leave updated for ID: " + leave.getLeaveID());
            } else {
                System.out.println("⚠️ No leave found to update with ID: " + leave.getLeaveID());
            }

        } catch (SQLException e) {
            System.err.println("❌ Error updating leave.");
            e.printStackTrace();
        }
    }

    // ✅ Delete leave by ID
    public void deleteLeave(int leaveID) {
        String sql = "DELETE FROM leave_applications WHERE leaveID=?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, leaveID);
            int rows = stmt.executeUpdate();

            if (rows > 0) {
                System.out.println("✅ Leave deleted for ID: " + leaveID);
            } else {
                System.out.println("⚠️ No leave found to delete with ID: " + leaveID);
            }

        } catch (SQLException e) {
            System.err.println("❌ Error deleting leave.");
            e.printStackTrace();
        }
    }

    // ✅ Get specific leave by ID
    public Leave getLeaveById(int leaveId) {
        Leave leave = null;
        String sql = "SELECT * FROM leave_applications WHERE leaveID = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, leaveId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                leave = new Leave();
                leave.setLeaveID(rs.getInt("leaveID"));
                leave.setEmployeeID(rs.getString("employeeID"));
                leave.setLeaveType(rs.getString("leaveType"));
                leave.setStartDate(rs.getString("startDate"));
                leave.setEndDate(rs.getString("endDate"));
                leave.setReason(rs.getString("reason"));
                leave.setStatus(rs.getString("status"));
                System.out.println("✅ Leave found for ID: " + leaveId);
            } else {
                System.out.println("⚠️ No leave found for ID: " + leaveId);
            }

        } catch (SQLException e) {
            System.err.println("❌ Error fetching leave by ID.");
            e.printStackTrace();
        }

        return leave;
    }
}

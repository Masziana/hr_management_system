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
            Class.forName("com.mysql.cj.jdbc.Driver"); // Recommended for portability
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found", e);
        }
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

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
            e.printStackTrace();
        }
    }

    public List<Leave> getAllLeaves() {
        List<Leave> list = new ArrayList<>();
        String sql = "SELECT * FROM leave_applications";

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
            e.printStackTrace();
        }

        return list;
    }

    /*public void updateLeaveStatus(int leaveID, String status) {
        String sql = "UPDATE leave_applications SET status=? WHERE leaveID=?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, status);
            stmt.setInt(2, leaveID);
            stmt.executeUpdate();
            System.out.println("✅ Leave status updated for ID: " + leaveID);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }*/

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

            stmt.executeUpdate();
            System.out.println("✅ Leave updated for ID: " + leave.getLeaveID());

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteLeave(int leaveID) {
        String sql = "DELETE FROM leave_applications WHERE leaveID=?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, leaveID);
            stmt.executeUpdate();
            System.out.println("✅ Leave deleted for ID: " + leaveID);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public Leave getLeaveById(int leaveId) {
        Leave leave = null;
        try {
            Connection conn = getConnection(); // however you get DB connection
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM leave_applications WHERE leaveID = ?");
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
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return leave;
    }

}

package dao;

import model.Department;
import com.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DepartmentDAO {
    private final Connection conn;

    // Constructor untuk inject connection dari luar (digunakan oleh EmployeeDAO)
    public DepartmentDAO(Connection conn) {
        this.conn = conn;
    }

    // Constructor default untuk standalone penggunaan
    public DepartmentDAO() {
        try {
            this.conn = DBConnection.getConnection();
        } catch (Exception e) {
            throw new RuntimeException("Failed to connect to DB", e);
        }
    }

    // Dapatkan semua department
    public List<Department> getAllDepartments() throws SQLException {
        List<Department> list = new ArrayList<>();
        String sql = "SELECT * FROM department";
        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Department dep = new Department();
                dep.setDepartmentID(rs.getInt("departmentID"));
                dep.setName(rs.getString("depName"));
                dep.setDescription(rs.getString("description"));
                list.add(dep);
            }
        }
        return list;
    }

    // Dapatkan department berdasarkan ID
    public Department getDepartmentById(int id) {
        String sql = "SELECT * FROM department WHERE departmentID = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Department d = new Department();
                    d.setDepartmentID(rs.getInt("departmentID"));
                    d.setName(rs.getString("depName"));
                    d.setDescription(rs.getString("description"));
                    return d;
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    // Tambah department baru
    public void addDepartment(Department d) throws SQLException {
        String sql = "INSERT INTO department (departmentID, depName, description) VALUES (?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, d.getDepartmentID());
            ps.setString(2, d.getName());
            ps.setString(3, d.getDescription());
            ps.executeUpdate();
        }
    }

    // Kemas kini maklumat department
    public void updateDepartment(Department d) {
        String sql = "UPDATE department SET depName = ?, description = ? WHERE departmentID = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, d.getName());
            ps.setString(2, d.getDescription());
            ps.setInt(3, d.getDepartmentID());
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Padam department berdasarkan ID
    public void deleteDepartment(int id) {
        String sql = "DELETE FROM department WHERE departmentID = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}

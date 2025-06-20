package dao;

import model.Employee;
import model.Department;
import com.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {
    private final Connection conn;
    private final DepartmentDAO departmentDAO;

    public EmployeeDAO() {
        try {
            this.conn = DBConnection.getConnection();
            this.departmentDAO = new DepartmentDAO(conn);
        } catch (Exception e) {
            throw new RuntimeException("Failed to connect to DB", e);
        }
    }

    public void addEmployee(Employee e) {
        String sql = "INSERT INTO employee (employeeID, empName, email, phoneNo, jobTitle, joinDate, departmentID) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, e.getEmployeeID());
            ps.setString(2, e.getName());
            ps.setString(3, e.getEmail());
            ps.setString(4, e.getPhoneNo());
            ps.setString(5, e.getJobTitle());
            ps.setDate(6, new java.sql.Date(e.getJoinDate().getTime()));
            ps.setInt(7, e.getDepartment().getDepartmentID());
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void updateEmployee(Employee e) throws SQLException {
        String sql = "UPDATE employee SET empName=?, email=?, phoneNo=?, jobTitle=?, joinDate=?, departmentID=? WHERE employeeID=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, e.getName());
            ps.setString(2, e.getEmail());
            ps.setString(3, e.getPhoneNo());
            ps.setString(4, e.getJobTitle());
            if (e.getJoinDate() != null) {
                ps.setDate(5, new java.sql.Date(e.getJoinDate().getTime()));
            } else {
                ps.setNull(5, java.sql.Types.DATE);
            }
            ps.setInt(6, e.getDepartment().getDepartmentID());
            ps.setString(7, e.getEmployeeID());
            ps.executeUpdate();
        }
    }

    public void deleteEmployee(String employeeId) {
        String sql = "DELETE FROM employee WHERE employeeID=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, employeeId);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public Employee getEmployeeById(String id) {
        Employee emp = null;
        String sql = "SELECT * FROM employee WHERE employeeID=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) emp = mapEmployee(rs);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return emp;
    }

    public List<Employee> getAllEmployees() {
        List<Employee> list = new ArrayList<>();
        String sql = "SELECT * FROM employee";
        try (Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) list.add(mapEmployee(rs));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    private Employee mapEmployee(ResultSet rs) throws SQLException {
        Employee emp = new Employee();
        emp.setEmployeeID(rs.getString("employeeID"));
        emp.setName(rs.getString("empName"));
        emp.setEmail(rs.getString("email"));
        emp.setPhoneNo(rs.getString("phoneNo"));
        emp.setJobTitle(rs.getString("jobTitle"));
        emp.setJoinDate(rs.getDate("joinDate"));

        int deptId = rs.getInt("departmentID");
        Department dept = departmentDAO.getDepartmentById(deptId);
        emp.setDepartment(dept);

        return emp;
    }
}
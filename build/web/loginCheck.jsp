<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<%
    // Ambil input dari borang login
    String employeeId = request.getParameter("employeeId");
    String password = request.getParameter("password");

    // Inisialisasi JDBC
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        // Load JDBC driver & sambung ke database
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hr_db?useSSL=false&serverTimezone=UTC", "root", "");

        // Semak user
        String sql = "SELECT * FROM users WHERE employee_id = ? AND password = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, employeeId);
        stmt.setString(2, password);

        rs = stmt.executeQuery();

        if (rs.next()) {
            // Dapatkan maklumat pengguna
            String username = rs.getString("username");
            String role = rs.getString("role");

            // Simpan dalam session (guna implicit object `session`)
            session.setAttribute("employeeID", employeeId);
            session.setAttribute("username", username);
            session.setAttribute("role", role);

            // Redirect ikut role
            if ("staff".equalsIgnoreCase(role)) {
                response.sendRedirect("staffDashboard.jsp");
            } else if ("manager".equalsIgnoreCase(role)) {
                response.sendRedirect("dashboard.jsp");
            } else {
                // Role tak dikenali
                response.sendRedirect("login.jsp?error=2");
            }

        } else {
            // Gagal login
            response.sendRedirect("login.jsp?error=1");
        }

    } catch (Exception e) {
        out.println("<h2>Ralat: " + e.getMessage() + "</h2>");
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



import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.util.DBConnection; // Pastikan DBConnection class ni wujud dan betul

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Dapatkan parameter dari form
        String empID = request.getParameter("employeeID");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String jobTitle = request.getParameter("jobTitle");
        String joinDate = request.getParameter("joinDate");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Sambung ke DB
            conn = DBConnection.getConnection();

            String sql = "UPDATE employee SET empName=?, email=?, phoneNo=?, jobTitle=?, joinDate=? WHERE employeeID=?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, phone);
            stmt.setString(4, jobTitle);
            stmt.setString(5, joinDate);
            stmt.setString(6, empID);

            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
                // Berjaya update, redirect semula ke servlet profile
                response.sendRedirect("MyProfileStaffServlet");
            } else {
                // Kalau tiada record diupdate (ID tak jumpa?)
                response.getWriter().println("Update failed. Employee ID not found.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}

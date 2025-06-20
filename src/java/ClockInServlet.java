
import com.util.DBConnection;
import model.Attendance;
import dao.AttendanceDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/ClockInServlet")
public class ClockInServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String employeeID = request.getParameter("employeeID");
        LocalDate today = LocalDate.now();
        String attendanceDate = today.toString();

        try {
            // Check kalau dah clock in
            Connection con = DBConnection.getConnection();
            PreparedStatement checkStmt = con.prepareStatement(
                "SELECT * FROM Attendance WHERE employeeID=? AND attendanceDate=?"
            );
            checkStmt.setString(1, employeeID);
            checkStmt.setString(2, attendanceDate);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Sudah clock in
                response.sendRedirect("staffAttendance.jsp?message=You already clocked in today!&status=already");
            } else {
                // Belum clock in – insert baru
                Attendance a = new Attendance();
                a.setEmployeeID(employeeID);
                a.setAttendanceDate(attendanceDate);
                a.setStatus("Present");

                AttendanceDAO.insert(a);
                response.sendRedirect("staffAttendance.jsp?message=Clock in successful!&status=success");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("staffAttendance.jsp?message=Something went wrong.&status=error");
        }
    }
}
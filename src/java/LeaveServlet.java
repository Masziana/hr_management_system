/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author ACER
 */
import dao.LeaveDAO;
import model.Leave;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.WebServlet;

@WebServlet("/LeaveServlet")
public class LeaveServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String action = request.getParameter("action");

    try {
        LeaveDAO dao = new LeaveDAO();

        if ("apply".equals(action)) {
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("employeeID") == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            // ✅ Use employeeID from session only
            String employeeID = (String) session.getAttribute("employeeID");

            Leave leave = new Leave();
            leave.setEmployeeID(employeeID);
            leave.setLeaveType(request.getParameter("leaveType"));
            leave.setStartDate(request.getParameter("startDate"));
            leave.setEndDate(request.getParameter("endDate"));
            leave.setReason(request.getParameter("reason"));
            leave.setStatus("Pending");

            dao.applyLeave(leave);

            session.setAttribute("successMessage", "Leave applied successfully!");
            response.sendRedirect("staffDashboard.jsp");
            return;
        }

        else if ("delete".equals(action)) {
            int leaveID = Integer.parseInt(request.getParameter("leaveId"));
            dao.deleteLeave(leaveID);
            response.sendRedirect("LeaveServlet?action=view");
        }

        else if ("update".equals(action)) {
            Leave leave = new Leave();
            leave.setLeaveID(Integer.parseInt(request.getParameter("leaveID")));
            leave.setEmployeeID(request.getParameter("employeeID")); // Optional: consider also securing this
            leave.setLeaveType(request.getParameter("leaveType"));
            leave.setStartDate(request.getParameter("startDate"));
            leave.setEndDate(request.getParameter("endDate"));
            leave.setReason(request.getParameter("reason"));
            leave.setStatus(request.getParameter("status"));

            dao.updateLeave(leave);
            response.sendRedirect("LeaveServlet?action=view");
        }

    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("error.jsp");
    }
}


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null || "view".equalsIgnoreCase(action)) {
            LeaveDAO dao = new LeaveDAO();
            List<Leave> leaves = null;
            leaves = dao.getAllLeaves();
            request.setAttribute("leaves", leaves);
            request.getRequestDispatcher("viewLeave.jsp").forward(request, response);
        } 
        else if ("edit".equalsIgnoreCase(action)) {
            int leaveId = Integer.parseInt(request.getParameter("leaveId"));
            LeaveDAO dao = new LeaveDAO();
            Leave leave = dao.getLeaveById(leaveId);  // <-- implement this method in DAO
            request.setAttribute("leave", leave);
            request.getRequestDispatcher("editLeave.jsp").forward(request, response);
        }
        else {
            response.sendRedirect("error.jsp");
        }
    }

}

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Leave, java.util.List, dao.LeaveDAO" %>
<%@ include file="sidebarStaff.jsp" %>


<%
    if (session == null || session.getAttribute("employeeID") == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String username = (String) session.getAttribute("username");
    String employeeID = (String) session.getAttribute("employeeID");

    LeaveDAO leaveDAO = new LeaveDAO();
    List<Leave> leaveList = leaveDAO.getLeavesByEmployeeID(employeeID);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Staff Dashboard - HR Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .sidebar {
            height: 100vh;
            width: 220px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #1f4e70;
            padding-top: 20px;
        }

        .sidebar h2 {
            color: #fff;
            text-align: center;
            margin-bottom: 30px;
        }

        .sidebar a {
            display: block;
            color: #fff;
            padding: 12px 20px;
            text-decoration: none;
            font-size: 16px;
        }

        .sidebar a:hover {
            background-color: #5a9acb;
        }

        .main-content {
            margin-left: 220px;
            padding: 30px;
            background-color: #f4f4f4;
            min-height: 100vh;
        }

        .welcome {
            font-size: 24px;
            font-weight: bold;
        }

        .card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            margin-top: 20px;
        }
    </style>
</head>
<body>


    <div class="main-content">
        <div class="welcome">Welcome, <%= username %> 👋</div>

        <!-- Leave Applications Section -->
        <div class="card">
            <h3>My Leave Applications</h3>
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Leave Type</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Reason</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (leaveList != null && !leaveList.isEmpty()) {
                            for (Leave l : leaveList) {
                    %>
                        <tr>
                            <td><%= l.getLeaveType() %></td>
                            <td><%= l.getStartDate() %></td>
                            <td><%= l.getEndDate() %></td>
                            <td><%= l.getReason() %></td>
                            <td>
                                <span class="badge 
                                    <%= l.getStatus().equalsIgnoreCase("Approved") ? "bg-success" :
                                         l.getStatus().equalsIgnoreCase("Rejected") ? "bg-danger" :
                                         "bg-warning text-dark" %>">
                                    <%= l.getStatus() %>
                                </span>
                            </td>
                        </tr>
                    <%
                            }
                        } else {
                    %>
                        <tr><td colspan="5" style="text-align: center;">No leave applications found.</td></tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

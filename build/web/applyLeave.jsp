<%-- 
    Document   : applyLeave
    Created on : 10 Jun 2025, 2:00:20 pm
    Author     : ACER
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ include file="sidebarStaff.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Apply for Leave</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

    <div class="content">
        <h2>Apply for Leave</h2>
        <form class="styled-form" action="LeaveServlet" method="post">
            <input type="hidden" name="action" value="apply">
            <label>Employee ID:</label>
            <input type="text" name="employeeID" required>

            <label>Leave Type:</label>
            <select name="leaveType" required>
                <option value="Annual">Annual</option>
                <option value="Medical">Medical</option>
                <option value="Emergency">Emergency</option>
            </select>

            <label>Start Date:</label>
            <input type="date" name="startDate" required>

            <label>End Date:</label>
            <input type="date" name="endDate" required>

            <label>Reason:</label>
            <input type="text" name="reason" required>

            <button type="submit">Submit Leave Application</button>
        </form>
    </div>
</body>
</html>


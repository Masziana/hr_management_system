<%@ page import="model.Leave" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="sidebar.jsp" %>

<%
    Leave leave = (Leave) request.getAttribute("leave");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Leave Application</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    
    <div class="content">
        <h2>Edit Leave</h2>
        <form action="LeaveServlet" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="leaveID" value="<%= leave.getLeaveID() %>">

            <label for="employeeID">Employee ID:</label>
            <input type="text" id="employeeID" name="employeeID" value="<%= leave.getEmployeeID() %>" ><br>

            <label for="leaveType">Leave Type:</label>
            <input type="text" id="leaveType" name="leaveType" value="<%= leave.getLeaveType() %>" ><br>

            <label for="startDate">Start Date:</label>
            <input type="date" id="startDate" name="startDate" value="<%= leave.getStartDate() %>" ><br>

            <label for="endDate">End Date:</label>
            <input type="date" id="endDate" name="endDate" value="<%= leave.getEndDate() %>" ><br>

            <label for="reason">Reason:</label>
            <textarea id="reason" name="reason" ><%= leave.getReason() %></textarea><br>

            <label for="status">Status:</label>
            <select name="status" id="status">
                <option value="Pending" <%= leave.getStatus().equals("Pending") ? "selected" : "" %>>Pending</option>
                <option value="Approved" <%= leave.getStatus().equals("Approved") ? "selected" : "" %>>Approved</option>
                <option value="Rejected" <%= leave.getStatus().equals("Rejected") ? "selected" : "" %>>Rejected</option>
            </select><br><br>

            <button type="submit">Update</button>
        </form>
    </div>
</body>
</html>

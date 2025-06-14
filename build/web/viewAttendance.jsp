<%-- 
    Document   : viewAttendance
    Created on : 9 Jun 2025, 10:39:02 pm
    Author     : Masziana
--%>

<%@ page import="java.util.*, dao.AttendanceDAO, model.Attendance" %>
<%@ include file="sidebar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Attendance</title>
    <link rel="stylesheet" href="css1.css"><%-- Make sure this file exists --%>

    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this attendance record?");
        }
    </script>
<style>
.header-bar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.btn-add {
    padding: 8px 14px;
    background-color: #1f4e70;
    color: white;
    border: none;
    border-radius: 4px;
    text-decoration: none;
    font-size: 14px;
    cursor: pointer;
    transition: background-color 0.3s;
    display: inline-block;
}

.btn-add:hover {
    background-color: #2e6a91;
}
</style>
</head>
<body>
    <div class="content">
<div class="header-bar">
    <h2>Attendance Records</h2>
    <a href="addAttendance.jsp" class="btn-add">+ Add New Attendance</a>
</div>

        <br><br>
        <table>
            <tr>
                <th>ID</th>
                <th>Employee ID</th>
                <th>Date</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            <%
                List<Attendance> list = AttendanceDAO.getAll();
                for (Attendance a : list) {
            %>
            <tr>
                <td><%= a.getAttendanceID() %></td>
                <td><%= a.getEmployeeID() %></td>
                <td><%= a.getAttendanceDate() %></td>
                <td><%= a.getStatus() %></td>
                <td>
                    <a href="/Project/EditAttendanceServlet?id=<%= a.getAttendanceID() %>" class="btn-update">Update</a>
                    <a href="/Project/DeleteAttendanceServlet?id=<%= a.getAttendanceID() %>"
                       class="btn-delete"
                       onclick="return confirmDelete();">Delete</a>
                </td>
            </tr>
            <% } %>
        </table>
    </div>
</body>
</html>

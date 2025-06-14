<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Employee" %>
<%@ include file="sidebarStaff.jsp" %>

<%
    Employee emp = (Employee) request.getAttribute("employee");
    if (emp == null) {
%>
    <div class="alert alert-danger">Unable to load employee profile.</div>
<%
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .main-content {
            margin-left: 220px; /* Adjust ikut sidebar width */
            padding: 20px;
        }
        .card {
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 10px;
        }
        table th {
            width: 200px;
            background-color: #f8f9fa;
        }
    </style>
</head>
<body>

<div class="main-content">
    <h2>My Profile</h2>

    <div class="card p-4">
        <table class="table table-bordered">
            <tr>
                <th>Employee ID</th>
                <td><%= emp.getEmployeeID() %></td>
            </tr>
            <tr>
                <th>Name</th>
                <td><%= emp.getName() %></td>
            </tr>
            <tr>
                <th>Email</th>
                <td><%= emp.getEmail() %></td>
            </tr>
            <tr>
                <th>Phone</th>
                <td><%= emp.getPhoneNo() %></td>
            </tr>
            <tr>
                <th>Job Title</th>
                <td><%= emp.getJobTitle() %></td>
            </tr>
            <tr>
                <th>Join Date</th>
                <td><%= emp.getJoinDate() %></td>
            </tr>
            <tr>
                <th>Department</th>
                <td><%= emp.getDepartment().getName() %></td>
            </tr>
        </table>
    </div>
</div>

</body>
</html>

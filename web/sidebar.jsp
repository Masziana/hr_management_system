<%-- 
    Document   : sidebar
    Created on : 10 Jun 2025, 2:20:18 am
    Author     : Masziana
--%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HR Management System</title>

    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f9fbfd;
        }

        .sidebar {
            width: 220px;
            background-color: #1f4e70;
            color: white;
            height: 100vh;
            padding: 30px 20px;
            position: fixed;
            top: 0;
            left: 0;
        }

        .sidebar h3 {
            text-align: center;
            font-weight: bold;
            font-size: 24px;
            margin-bottom: 40px;
        }

        .sidebar a {
            display: block;
            padding: 12px 18px;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            margin-bottom: 12px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .sidebar a i {
            margin-right: 12px;
        }

        .sidebar a:hover,
        .sidebar a.active {
            background-color: #2e6a91;
        }

        .content {
            margin-left: 240px;
            padding: 30px;
        }
    </style>
</head>
<body>

<%
    String uri = request.getRequestURI(); 
%>

<div class="sidebar">
    <h3>HR MS</h3>

    <a href="dashboard.jsp" class="<%= uri.contains("dashboard.jsp") ? "active" : "" %>">
        <i class="fas fa-home"></i> Dashboard
    </a>
    <a href="EmployeeServlet" class="<%= uri.contains("View_Employees.jsp") ? "active" : "" %>">
        <i class="fas fa-user"></i> Employee
    </a>
    <a href="DepartmentServlet" class="<%= uri.contains("View_Department.jsp") ? "active" : "" %>">
        <i class="fas fa-building"></i> Department
    </a>
    <a href="LeaveServlet" class="<%= uri.contains("viewLeave.jsp") ? "active" : "" %>">
        <i class="fas fa-running"></i> Leave
    </a>
    <a href="viewAttendance.jsp" class="<%= uri.contains("viewAttendance.jsp") ? "active" : "" %>">
        <i class="fas fa-check-square"></i> Attendance
    </a>
        
<a href="logout.jsp" class="<%= uri.contains("logout.jsp") ? "active" : "" %>">
    <i class="fas fa-sign-out-alt"></i> Logout
</a>

</div>

</body>
</html>


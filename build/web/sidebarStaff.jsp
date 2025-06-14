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
    <h3>STAFF HR</h3>

    <a href="staffDashboard.jsp" class="<%= uri.contains("staffDashboard.jsp") ? "" : "" %>">
        <i class="fas fa-home"></i> Dashboard
    </a>
    <a href="EmployeeServlet?action=profile" class="<%= uri.contains("profile") ? "active" : "" %>">
        <i class="fas fa-user"></i> My Profile
    </a>
    <a href="applyLeave.jsp" class="<%= uri.contains("applyLeave.jsp") ? "" : "" %>">
        <i class="fas fa-running"></i> Apply Leave
    </a>
    <a href="staffAttendance.jsp" class="<%= uri.contains("staffAttendance.jsp") ? "" : "" %>">
        <i class="fas fa-check-square"></i> Attendance
    </a>
    <a href="logout.jsp" class="<%= uri.contains("logout.jsp") ? "active" : "" %>">
    <i class="fas fa-sign-out-alt"></i> Logout
</a>
</div>

</body>
</html>


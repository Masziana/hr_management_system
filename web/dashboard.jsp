<%-- 
    Document   : dashboard
    Created on : 7 May 2025, 9:34:24 pm
    Author     : ACER
--%>
<%@ page import="controller.DashboardDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ include file="sidebar.jsp" %>



<html>
<head>
    <title>HRMS Dashboard</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <%
        DashboardDAO dashboardDAO = new DashboardDAO();

        int totalEmployees = dashboardDAO.getTotalEmployees();
        int totalDepartments = dashboardDAO.getTotalDepartments();
        int leaveApplied = dashboardDAO.getLeaveApplied();
        int leaveApproved = dashboardDAO.getLeaveApproved();
        int leaveRejected = dashboardDAO.getLeaveRejected();
    %>

<div class="content">
    <h1>Dashboard</h1>
    <div class="box-container">
        <div class="box blue">
            <div class="icon">👤</div>
            <div>
                <div class="label">Total Employees</div>
                <div class="value"><%= totalEmployees %></div>
            </div>
        </div>
        <div class="box green">
            <div class="icon">🏛️</div>
            <div>
                <div class="label">Total Departments</div>
                <div class="value"><%= totalDepartments %></div>
            </div>
        </div>
    </div>

    <h2>Leave Details</h2>
    <div class="box-container">
        <div class="box green">
            <div class="icon">📁</div>
            <div>
                <div class="label">Leave Applied</div>
                <div class="value"><%= leaveApplied %></div>
            </div>
        </div>
        <div class="box green">
            <div class="icon">✔️</div>
            <div>
                <div class="label">Leave Approved</div>
                <div class="value"><%= leaveApproved %></div>
            </div>
        </div>
        <div class="box red">
            <div class="icon">❌</div>
            <div>
                <div class="label">Leave Rejected</div>
                <div class="value"><%= leaveRejected %></div>
            </div>
        </div>
</div>

</body>
</html>


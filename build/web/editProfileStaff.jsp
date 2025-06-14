<%-- 
    Document   : editProfileStaff
    Created on : 14 Jun 2025, 2:29:39 pm
    Author     : Masziana Soffian
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Employee" %>
<%--<%@ include file="sidebarStaff.jsp" %>--%>

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
    <title>Edit My Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .main-content {
            margin-left: 220px;
            padding: 20px;
        }
    </style>
</head>
<body>

<div class="main-content">
    <h2>Edit My Profile</h2>

    <form action="UpdateProfileServlet" method="post">
        <div class="mb-3">
            <label>Employee ID</label>
            <input type="text" class="form-control" name="employeeID" value="<%= emp.getEmployeeID() %>" readonly>
        </div>
        <div class="mb-3">
            <label>Name</label>
            <input type="text" class="form-control" name="name" value="<%= emp.getName() %>" required>
        </div>
        <div class="mb-3">
            <label>Email</label>
            <input type="email" class="form-control" name="email" value="<%= emp.getEmail() %>" required>
        </div>
        <div class="mb-3">
            <label>Phone</label>
            <input type="text" class="form-control" name="phone" value="<%= emp.getPhoneNo() %>" required>
        </div>
        <div class="mb-3">
            <label>Job Title</label>
            <input type="text" class="form-control" name="jobTitle" value="<%= emp.getJobTitle() %>" required>
        </div>
        <div class="mb-3">
            <label>Join Date</label>
            <input type="date" class="form-control" name="joinDate" value="<%= emp.getJoinDate() %>" required>
        </div>
        <button type="submit" class="btn btn-primary">Update</button>
    </form>
</div>

</body>
</html>

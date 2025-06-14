<%-- 
    Document   : Edit_Department
    Created on : 8 Jun 2025, 3:37:49 pm
    Author     : User
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Department" %>
<%
    Department department = (Department) request.getAttribute("department");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Department</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f6f8;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .form-container {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 600px;
        }
        .form-container h3 {
            background-color: #003366;
            color: white;
            padding: 15px 20px;
            border-radius: 6px;
            font-weight: bold;
            margin-bottom: 25px;
            text-align: center;
        }
        .btn-success {
            background-color: #1f4e70;
            border: none;
        }
        .btn-secondary {
            margin-left: 10px;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h3>Update Department</h3>
    <form method="post" action="${pageContext.request.contextPath}/DepartmentServlet?action=update">
        <input type="hidden" name="departmentID" value="<%= department.getDepartmentID() %>">

        <div class="mb-3">
            <label class="form-label">Department Name</label>
            <input type="text" class="form-control" name="depName"
                   value="<%= department.getName() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Description</label>
            <textarea class="form-control" name="description" rows="4"><%= department.getDescription() %></textarea>
        </div>

        <div class="d-flex justify-content-end">
            <button type="submit" class="btn btn-success">Update Department</button>
        </div>
    </form>
</div>

</body>
</html>

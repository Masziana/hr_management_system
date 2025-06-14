<%-- 
    Document   : Delete_Employee
    Created on : 28 May 2025, 2:08:29 am
    Author     : User
--%>

<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Employee</title>
    <style>
        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }
        th {
            background-color: #0073e6;
            color: white;
        }
        a.delete-btn {
            color: red;
            text-decoration: none;
            font-weight: bold;
        }
        a.delete-btn:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<h2 style="text-align:center;">Employee List - Delete Record</h2>

<table align="center">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone No</th>
        <th>Job Title</th>
        <th>Join Date</th>
        <th>Department ID</th>
        <th>Action</th>
    </tr>
    <tr>
        <td>"employeeID"</td>
        <td>"name"</td>
        <td>"email"</td>
        <td>"phoneNo"</td>
        <td>jobTitle"</td>
        <td>"joinDate"</td>
        <td>"departmentID"</td>
        <td>
            <a class="delete-btn" href="DeleteEmployeeServlet?id="employeeID" onclick="return confirm('Are you sure you want to delete this employee?');">Delete</a>
        </td>
    </tr>
</table>

</body>
</html>


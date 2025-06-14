<%-- 
    Document   : View_Department
    Created on : 8 Jun 2025, 3:41:18 pm
    Author     : User
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.Department" %>
<%@ include file="sidebar.jsp" %>
<%
    List<Department> departments = (List<Department>) request.getAttribute("depList");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Department Management</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f2f4f7;
            display: flex;
            height: 100vh;
        }

        .sidebar {
            width: 220px;
            background-color: #1f4e70;
            color: white;
            padding-top: 30px;
            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
        }

        .sidebar .logo {
            text-align: center;
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 40px;
            letter-spacing: 1px;
        }

        .sidebar a {
            display: block;
            padding: 14px 25px;
            color: white;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.2s;
        }

        .sidebar a.active,
        .sidebar a:hover {
            background-color: #2e6a91;
        }

        .main {
            margin-left: 220px;
            padding: 40px;
            flex: 1;
            overflow-y: auto;
        }

        .main h1 {
            margin-bottom: 20px;
            color: #1f4e70;
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .add-button {
            background-color: #1f4e70;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.2s;
        }

        .add-button:hover {
            background-color: #2e6a91;
        }

        h3 {
            margin-top: 0;
            margin-bottom: 20px;
            color: #1f4e70;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 14px 16px;
            border-bottom: 1px solid #e0e0e0;
            text-align: left;
        }

        th {
            background-color: #1f4e70;
            color: white;
        }

        tr:hover {
            background-color: #f8f9fa;
        }

        .btn-update, .btn-delete {
            padding: 8px 14px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            text-decoration: none;
            color: white;
            margin-right: 6px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .btn-update {
            background-color: #28a745;
        }

        .btn-update:hover {
            background-color: #218838;
        }

        .btn-delete {
            background-color: #dc3545;
        }

        .btn-delete:hover {
            background-color: #c82333;
        }

        .no-data {
            text-align: center;
            padding: 20px;
            color: #777;
        }
    </style>
</head>
<body>

<div class="main">
    <div class="top-bar">
        <h2>Department Records</h2>
        <a class="add-button" href="Add_Department.jsp">+ Add Department</a>
    </div>

    <table>
        <tr>
            <th>Department Name</th>
            <th>Description</th>
            <th>Action</th>
        </tr>
        <%
            if (departments != null && !departments.isEmpty()) {
                for (Department d : departments) {
        %>
            <tr>
                <td><%= d.getName() %></td>
                <td><%= d.getDescription() %></td>
                <td>
                    <a class="btn-update" href="DepartmentServlet?action=edit&id=<%= d.getDepartmentID() %>">Update</a>
                    <a class="btn-delete" href="DepartmentServlet?action=delete&id=<%= d.getDepartmentID() %>"
                       onclick="return confirm('Are you sure you want to delete this department?');">Delete</a>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="3" class="no-data">No departments found.</td>
            </tr>
        <%
            }
        %>
    </table>
</div>
</body>
</html>

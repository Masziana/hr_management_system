<%-- 
    Document   : View_Employees
    Created on : 8 Jun 2025, 3:30:18 pm
    Author     : User
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="sidebar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Management</title>
    <meta charset="UTF-8">
    <style>
        *{box-sizing:border-box}

        /* ---------- Layout ---------- */
        body{
            margin:0;
            display:flex;
            height:100vh;
            font-family:'Segoe UI',sans-serif;
            background:#f2f4f7;
        }
        .sidebar{
            width:220px;
            background:#1f4e70;
            color:#fff;
            padding-top:30px;
            position:fixed;top:0;left:0;bottom:0;
        }
        .sidebar .logo{
            text-align:center;
            font-size:22px;
            font-weight:bold;
            margin-bottom:40px;
            letter-spacing:1px;
        }
        .sidebar a{
            display:block;
            padding:14px 25px;
            color:#fff;
            text-decoration:none;
            font-size:16px;
            transition:background .2s;
        }
        .sidebar a.active,.sidebar a:hover{background:#2e6a91}

        .main{
            margin-left:220px;
            padding:40px;
            flex:1;
            overflow-y:auto;
        }

        /* ---------- Header & CTA ---------- */
        .top-bar{
            display:flex;
            justify-content:space-between;
            align-items:center;
            margin-bottom:25px;
        }
        .top-bar h1{color:#1f4e70;margin:0}
        .add-button{
            background:#1f4e70;
            color:#fff;
            padding:10px 20px;
            border-radius:5px;
            text-decoration:none;
            transition:background .2s;
        }
        .add-button:hover{background:#2e6a91}

        /* ---------- Table ---------- */
        table{
            width:100%;
            border-collapse:collapse;
            background:#fff;
            border-radius:8px;
            box-shadow:0 2px 8px rgba(0,0,0,.1);
            overflow:hidden;
        }
        th,td{
            padding:14px 16px;
            border-bottom:1px solid #e0e0e0;
            text-align:left;
        }
        th{
            background:#1f4e70;
            color:#fff;
        }
        tr:hover{background:#f8f9fa}

        /* ---------- Action Buttons ---------- */
        .btn-update,.btn-delete{
            padding:8px 14px;
            border:none;
            border-radius:4px;
            font-size:14px;
            color:#fff;
            text-decoration:none;
            margin-right:6px;
            transition:background .2s;
        }
        .btn-update{background:#28a745}
        .btn-update:hover{background:#218838}
        .btn-delete{background:#dc3545}
        .btn-delete:hover{background:#c82333}
    </style>
</head>
<body>

<div class="main">
    <div class="top-bar">
        <h2>Employee Records</h2>
        <a class="add-button" href="EmployeeServlet?action=add">+ Add Employee</a>
    </div>

    <table>
        <tr>
            <th>Employee Name</th>
            <th>Email</th>
            <th>Phone No</th>
            <th>Job Title</th>
            <th>Action</th>
        </tr>
        <c:forEach var="e" items="${employees}">
            <tr>
                <td>${e.name}</td>
                <td>${e.email}</td>
                <td>${e.phoneNo}</td>
                <td>${e.jobTitle}</td>
                <td>
                    <a class="btn-update" href="EmployeeServlet?action=edit&employeeID=${e.employeeID}">Update</a>
                    <a class="btn-delete"
                       href="EmployeeServlet?action=delete&employeeID=${e.employeeID}"
                       onclick="return confirm('Are you sure you want to delete this employee?');">
                       Delete
                    </a>
                </td>
            </tr>
        </c:forEach>
        <c:if test="${empty employees}">
            <tr><td colspan="5" style="text-align:center;color:#777;padding:20px">No employees found.</td></tr>
        </c:if>
    </table>
</div>

</body>
</html>

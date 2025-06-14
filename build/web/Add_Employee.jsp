<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Employee</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f6f9fc;
            margin: 0;
            padding: 40px;
            color: #333;
        }

        .page-header {
            text-align: center;
            margin-bottom: 40px;
            background-color: #003366;
            color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .employee-card {
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            max-width: 800px;
            margin: auto;
            padding: 30px 40px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .card-section {
            display: flex;
            flex-direction: column;
        }

        .card-section label {
            font-weight: 600;
            margin-bottom: 6px;
        }

        .card-section input,
        .card-section select {
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            transition: border 0.3s;
        }

        .card-section input:focus,
        .card-section select:focus {
            border-color: #007bff;
            outline: none;
        }

        .action-row {
            grid-column: 1 / -1;
            text-align: right;
            margin-top: 10px;
        }

        .btn-submit {
            background: #1f4e70;
            border: none;
            color: white;
            padding: 14px 28px;
            font-size: 15px;
            border-radius: 10px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .btn-submit:hover {
            background: #2e6a91;
        }
    </style>
</head>
<body>

<h1 class="page-header">Add New Employee</h1>

<form action="EmployeeServlet" method="post" class="employee-card">
    <input type="hidden" name="action" value="insert">

    <div class="card-section">
        <label for="employeeID">Employee ID</label>
        <input type="text" name="employeeID" id="employeeID" placeholder="EMP0001" required>
    </div>

    <div class="card-section">
        <label for="name">Employee Name</label>
        <input type="text" name="name" id="name" placeholder="Ali Razali" required>
    </div>

    <div class="card-section">
        <label for="email">Email</label>
        <input type="email" name="email" id="email" placeholder="ali@example.com" required>
    </div>

    <div class="card-section">
        <label for="phoneNo">Phone No</label>
        <input type="text" name="phoneNo" id="phoneNo" placeholder="012-3456789" required>
    </div>

    <div class="card-section">
        <label for="jobTitle">Job Title</label>
        <input type="text" name="jobTitle" id="jobTitle" placeholder="Software Engineer" required>
    </div>

    <div class="card-section">
        <label for="joinDate">Join Date</label>
        <input type="date" name="joinDate" id="joinDate" required>
    </div>

    <div class="card-section">
        <label for="department">Department</label>
        <select name="departmentID" id="department" required>
            <option value="">-- Select Department --</option>
            <c:forEach var="d" items="${departments}">
                <option value="${d.departmentID}">${d.name}</option>
            </c:forEach>
        </select>
    </div>

    <div class="action-row">
        <button type="submit" class="btn-submit">Add Employee</button>
    </div>
</form>

</body>
</html>

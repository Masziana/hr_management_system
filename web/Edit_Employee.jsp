<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Employee</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <style>
        .page-header {
            background-color: #003366;
            color: white;
            padding: 15px 25px;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            font-weight: 600;
            margin-bottom: 30px;
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
<body class="bg-light">

<div class="container mt-5">
    <h2 class="page-header">Update Employee</h2>
    <form action="EmployeeServlet" method="post" class="mt-4">
        <!-- Hidden fields to indicate we're editing -->
        <input type="hidden" name="action" value="edit">
        <input type="hidden" name="employeeID" value="${employee.employeeID}">

        <div class="mb-3">
            <label class="form-label">Name</label>
            <input type="text" name="name" value="${employee.name}" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" name="email" value="${employee.email}" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Phone Number</label>
            <input type="text" name="phoneNo" value="${employee.phoneNo}" class="form-control" required>
        </div>
        
        <select id="departmentID" name="departmentID" required class="form-select">
            <option value="" disabled>-- Select Department --</option>
            <c:forEach var="dep" items="${departments}">
                <option value="${dep.departmentID}"
                    <c:if test="${employee.department != null && employee.department.departmentID == dep.departmentID}">selected</c:if>>
                    ${dep.name}
                </option>
            </c:forEach>
        </select>


        <div class="mb-3">
            <label class="form-label">Job Title</label>
            <input type="text" name="jobTitle" value="${employee.jobTitle}" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Join Date</label>
            <input type="date" name="joinDate" value="${employee.joinDate}" class="form-control" required>
        </div>

        <div class="d-flex justify-content-end">
            <button type="submit" class="btn btn-success">Update Employee</button>
        </div>
    </form>
</div>

</body>
</html>

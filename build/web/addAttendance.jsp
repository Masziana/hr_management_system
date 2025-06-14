<%-- 
    Document   : addAttendance
    Created on : 9 Jun 2025, 10:38:36 pm
    Author     : Masziana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Attendance</title>
    <link rel="stylesheet" href="css1.css">
    <style>
        .form-container {
            background-color: white;
            padding: 30px 40px;
            max-width: 500px;
            margin: 60px auto;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        .form-container h2 {
            text-align: center;
            color: #1f4e70;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            color: #333;
            font-weight: 500;
        }

        input[type="text"], input[type="date"], select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 15px;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #1f4e70;
            color: white;
            border: none;
            padding: 12px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #2e6a91;
        }

        /* Responsive */
        @media (max-width: 600px) {
            .form-container {
                margin: 30px 20px;
                padding: 25px;
            }
        }
    </style>
</head>
<body>

<%@ include file="sidebar.jsp" %>

<div class="content">
    <div class="form-container">
        <h2>Add Attendance</h2>
        <form method="post" action="<%=request.getContextPath()%>/AddAttendanceServlet">

            <label for="employeeID">Employee ID:</label>
            <input type="text" id="employeeID" name="employeeID" required>

            <label for="attendanceDate">Date:</label>
            <input type="date" id="attendanceDate" name="attendanceDate" required>

            <label for="status">Status:</label>
            <select id="status" name="status" required>
                <option value="">-- Select Status --</option>
                <option>Present</option>
                <option>Absent</option>
                <option>Late</option>
                <option>On Leave</option>
            </select>

            <input type="submit" value="Add Attendance">
        </form>
    </div>
</div>

</body>
</html>

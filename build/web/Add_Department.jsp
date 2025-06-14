<%-- 
    Document   : Add_Department
    Created on : 8 Jun 2025, 3:36:21 pm
    Author     : User
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Department</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f2f5f9;
            font-family: 'Segoe UI', sans-serif;
        }

        .navbar {
            background-color: #002b5c;
        }

        .navbar-brand {
            color: white;
            font-weight: 600;
            font-size: 22px;
        }

        .navbar-brand:hover {
            color: #d1e0ff;
        }

        .card {
            border: none;
            border-radius: 16px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
            background-color: #ffffff;
        }

        .card-title {
            text-align: center;
            margin-bottom: 40px;
            background-color: #003366; /* Professional deep blue */
            color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .form-label {
            font-weight: 500;
            color: #333;
        }

        .form-control {
            border-radius: 10px;
            padding: 10px 14px;
            border: 1px solid #ccc;
            font-size: 15px;
        }

        .form-control:focus {
            border-color: #004a99;
            box-shadow: none;
        }

        .btn-primary {
            background-color: #1f4e70;
            border: none;
            padding: 10px 20px;
            border-radius: 10px;
        }

        .btn-primary:hover {
            background-color: #1f4e70;
        }
 
        .btn-secondary {
            border-radius: 10px;
            padding: 10px 20px;
        }

        .form-wrapper {
            background-color: #ffffff;
            padding: 35px 40px;
            border-radius: 16px;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="card">
                <div class="card-body form-wrapper">
                    <h3 class="card-title">Add New Department</h3>
                    <form method="post" action="${pageContext.request.contextPath}/DepartmentServlet?action=add">
                        <div class="mb-3">
                            <label class="form-label">Department ID</label>
                            <input type="text" class="form-control" name="departmentID" placeholder="e.g., 1" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Department Name</label>
                            <input type="text" class="form-control" name="depName" placeholder="e.g., Human Resources" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <textarea class="form-control" name="description" rows="4" placeholder="Brief description of the department..."></textarea>
                        </div>
                        <div class="d-flex justify-content-end">
                            <button type="submit" class="btn btn-primary">Add Department</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>

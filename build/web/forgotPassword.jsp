<%-- 
    Document   : forgotPassword
    Created on : 27 Apr 2025, 3:17:37 pm
    Author     : Masziana Soffian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password - HR Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            width: 350px;
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        label {
            font-size: 14px;
            color: #555;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            padding: 10px 25px;
            border: none;
            border-radius: 5px;
            font-size: 15px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Forgot Password</h2>
            <form action="forgotPasswordCheck.jsp" method="post">
                <label>Username:</label><br>
                <input type="text" name="username" placeholder="Enter your username" required><br>

                <label>Employee ID:</label><br>
                <input type="text" name="employeeId" placeholder="EMP12345" required><br>

                <input type="submit" value="Check Password">
            </form>
    </div>
</body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HR MANAGEMENT SYSTEM - Login</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .header {
            background-color: #1f4e70;
            padding: 20px;
            text-align: center;
            color: white;
            font-size: 36px;
            font-weight: bold;
            text-shadow: 1px 1px 2px #333;
        }

        .login-box {
            width: 300px;
            background-color: #e0e0e0;
            margin: 80px auto;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .login-box h2 {
            text-align: center;
            color: #000;
            margin-bottom: 25px;
        }

        .login-box label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .login-box input[type="text"],
        .login-box input[type="password"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: none;
            border-radius: 4px;
        }

        .login-box button {
            width: 100%;
            padding: 10px;
            background-color: #1f4e70;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            text-transform: lowercase;
            cursor: pointer;
        }

        .login-box button:hover {
            background-color: #5a9acb;
        }

        .forgot-password {
            text-align: center;
            margin-top: 10px;
        }

        .forgot-password a {
            color: #333;
            text-decoration: none;
            font-size: 14px;
        }

        .forgot-password a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="header">HR MANAGEMENT SYSTEM</div>

    <%-- Show error message if login failed --%>
    <%
        String error = request.getParameter("error");
        if ("1".equals(error)) {
    %>
        <p style="color:red; text-align:center; font-weight:bold;">Invalid Employee ID or Password. Please try again.</p>
    <%
        }
    %>

    <div class="login-box">
        <h2>Login</h2>
        <form action="loginCheck.jsp" method="post">
            <label for="employeeId">EMPLOYEE ID</label>
            <input type="text" id="employeeId" name="employeeId" placeholder="Enter Employee ID" required>

            <label for="password">PASSWORD</label>
            <input type="password" id="password" name="password" placeholder="Enter Password" required>

            <button type="submit">login</button>
        </form>

        <div class="forgot-password">
            <a href="forgotPassword.jsp">Forgot Password?</a>
        </div>
    </div>

</body>
</html>

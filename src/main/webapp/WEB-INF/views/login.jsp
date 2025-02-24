<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
        }
        .login-container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        .login-container h2 {
            text-align: center;
        }
        .input-field {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .submit-btn {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .submit-btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
 <div class="header">
        <div class="logo">
            <img src="<%= request.getContextPath() %>/images/logo.png" alt="Logo">
        </div>
        <div class="nav">
            <a href="Signup.jsp">Sign up</a>
            <a href="#">Login</a>
        </div>
    </div>
    <div class="login-container">
        <h2>Login</h2>
        <form action="/tktbooking/auth" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" class="input-field" required><br>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" class="input-field" required><br>

            <input type="submit" value="Login" class="submit-btn">
        </form>
    </div>

</body>
</html>
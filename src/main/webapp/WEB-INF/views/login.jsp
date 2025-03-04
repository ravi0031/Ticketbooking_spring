<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <style>
           body {
            font-family: 'Arial', sans-serif;
    background: linear-gradient(to right, #141e30, #243b55);
    color: #ffffff;
    margin: 0;
    padding: 0;
}
    
        .navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: #ffcc00;
   
    padding: 15px 50px;
     border-bottom: 2px solid red;
}

.navbar h1 {
    margin: 0;
    color: #141e30;
}

.nav-links a {
    color: #141e30;
    margin: 0 10px;
    text-decoration: none;
    font-weight: bold;
}

.nav-links a:hover {
    color: #243b55;
}
        .login-container {
          display: flex;
    gap: 30px;
    margin: 20px auto;
    padding: 20px;
    width: 80%;
    border-radius: 15px;
    background: rgba(255, 255, 255, 0.1);
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
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
        .footer {
    text-align: center;
    padding: 20px;
    background: #141e30;
    color: #ffffff;
}
    </style>
</head>
<body>
 <div class="header">
      <div class="navbar">
        <h1>Movie Ticket Booking</h1>
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/tktbooking/dashboard">Home</a>
            <a href="#">Sign Up</a>
            <a href="#">Profile</a>
        </div>
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
   <div class="footer">
        <p>&copy; 2025 Movie Ticket Booking. All Rights Reserved.</p>
    </div>
</body>
</html>
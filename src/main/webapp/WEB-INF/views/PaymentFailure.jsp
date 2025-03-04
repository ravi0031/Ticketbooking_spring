<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Failed</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8d7da;
            text-align: center;
            padding: 50px;
        }
        .failure-box {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            display: inline-block;
        }
        h1 {
            color: #721c24;
        }
        p {
            color: #721c24;
            font-size: 18px;
        }
        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }
        .btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <div class="failure-box">
        <h1>Payment Failed ❌</h1>
        <p>We were unable to process your payment. Please try again.</p>

        <button class="btn" onclick="window.location.href='Payment.jsp'">Retry Payment</button>
        <button class="btn" onclick="window.location.href='movie_list.jsp'">Go to Home</button>
    </div>
</body>
</html>


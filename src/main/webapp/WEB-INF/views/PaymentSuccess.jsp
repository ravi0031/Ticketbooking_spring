<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Successful</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #121212;
            color: white;
            padding: 50px;
        }

        .success-box {
            background-color: #1f1f1f;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 255, 0, 0.5);
            display: inline-block;
        }

        .success-box h1 {
            color: #00ff00;
        }

        .details {
            margin-top: 20px;
            text-align: left;
        }

        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            transition: 0.3s;
        }

        .home-btn {
            background-color: red;
            color: white;
        }

        .home-btn:hover {
            background-color: darkred;
        }
    </style>
</head>
<body>

    <div class="success-box">
        <h1>Payment Successful! ✅</h1>
        <p>Thank you for your booking. Your payment has been received.</p>

        <div class="details">
            <p><strong>Movie:</strong> <%= request.getParameter("movieTitle") %></p>
            <p><strong>Theater:</strong> <%= request.getParameter("theaterName") %></p>
            <p><strong>Showtime:</strong> <%= request.getParameter("showtime") %></p>
            <p><strong>Seats:</strong> <%= request.getParameter("selectedSeats") %></p>
            <p><strong>Total Paid:</strong> Rs. <%= request.getParameter("totalAmount") %></p>
        </div>

        <button class="btn home-btn" onclick="window.location.href='home.jsp'">Go to Home</button>
    </div>
</body>
</html>

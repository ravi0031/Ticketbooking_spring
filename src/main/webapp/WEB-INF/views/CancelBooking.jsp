<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cancel Booking</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="modal-content">
        <h1>Booking Cancelled</h1>
        <p>Your booking (ID: <%= request.getParameter("bookingId") %>) has been successfully cancelled.</p>
        <a href="Seatselection.jsp"><button>Return to Home</button></a>
    </div>
</body>
</html>

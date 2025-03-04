<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Booking Summary</title>
    <style >
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    text-align: center;
    margin: 0;
    padding: 0;
}

h1, h3 {
    color: #333;
}

p {
    font-size: 18px;
    color: #555;
}

.selected-seats, .total-amount {
    font-size: 20px;
    font-weight: bold;
    color: #d9534f;
}

/* Button to Open Modal */
#openModal {
    background-color: #007bff;
    color: white;
    font-size: 18px;
    border: none;
    padding: 10px 20px;
    margin-top: 20px;
    cursor: pointer;
    border-radius: 5px;
    transition: 0.3s;
}

#openModal:hover {
    background-color: #0056b3;
}

/* Modal Background */
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    justify-content: center;
    align-items: center;
}

/* Modal Content */
.modal-content {
    background-color: white;
    width: 50%;
    margin: auto;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    text-align: center;
}

/* Close Button */
.close {
    float: right;
    font-size: 25px;
    font-weight: bold;
    cursor: pointer;
    color: #aaa;
}

.close:hover {
    color: black;
}

/* Confirm Booking Button */
button {
    background-color: #28a745;
    color: white;
    font-size: 18px;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    border-radius: 5px;
    transition: 0.3s;
}

button:hover {
    background-color: #218838;
}

/* Cancel Booking Button */
.cancel-btn {
    background-color: #dc3545;
    margin-top: 10px;
}

.cancel-btn:hover {
    background-color: #c82333;
}
body {
    font-family: 'Arial', sans-serif;
    background: linear-gradient(to right, #141e30, #243b55);
    color: #ffffff;
    margin: 0;
    padding: 0;
}

/* Navbar */
.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: #ffcc00;
    padding: 15px 50px;
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

    <button id="openModal">View Booking Summary</button>

    <!-- Modal Container -->
    <div id="bookingModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h1>Booking Summary</h1>

            
            <p><strong>Movie:</strong> <%= request.getParameter("movieTitle") %></p>
            <p><strong>Theater:</strong> <%= request.getParameter("theaterName") %></p>
            <p><strong>Address:</strong> <%= request.getParameter("theaterAddress") %></p>
            <p><strong>Showtime:</strong> <%= request.getParameter("showtime") %></p>

            <h3>Selected Seats:</h3>
            <p class="selected-seats"><%= request.getParameter("selectedSeats") %></p>

            <h3>Total Amount:</h3>
            <p class="total-amount">Rs. <%= request.getParameter("totalAmount") %></p>

            <!-- Booking Confirmation Form -->
            <form action="/tktbooking/payment" method="post">
                <input type="hidden" name="movieTitle" value="<%= request.getParameter("movieTitle") %>">
                <input type="hidden" name="theaterName" value="<%= request.getParameter("theaterName") %>">
                <input type="hidden" name="theaterAddress" value="<%= request.getParameter("theaterAddress") %>">
                <input type="hidden" name="showtime" value="<%= request.getParameter("showtime") %>">
                <input type="hidden" name="selectedSeats" value="<%= request.getParameter("selectedSeats") %>">
                <input type="hidden" name="totalAmount" value="<%= request.getParameter("totalAmount") %>">
                <button type="submit">Confirm Booking</button>
            </form>

            <!-- Ticket Cancellation -->
            <form action="/tktbooking/cancel" method="get">
                <input type="hidden" name="bookingId" value="<%= request.getParameter("bookingId") %>">
                <button type="submit" class="cancel-btn">Cancel Booking</button>
            </form>
        </div>
    </div>

    <script>
        let modal = document.getElementById("bookingModal");
        let btn = document.getElementById("openModal");
        let span = document.getElementsByClassName("close")[0];

        btn.onclick = function() {
            modal.style.display = "block";
        }

        span.onclick = function() {
            modal.style.display = "none";
        }

        window.onclick = function(event) {
            if (event.target === modal) {
                modal.style.display = "none";
            }
        }
    </script>

</body>
</html>



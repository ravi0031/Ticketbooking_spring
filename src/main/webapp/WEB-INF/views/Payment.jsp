<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book My Show - Payment</title>
    <style>

        .left-section {
            width: 30%;
        }
        .poster-box {
            width: 200px;
            height: 250px;
            background-color: #282828;
            margin-bottom: 20px;
        }
        .info-box {
            padding: 10px;
            background-color: #1f1f1f;
        }
        .right-section {
            flex-grow: 1;
            padding-left: 20px;
            background-color: #1c1c1c;
            padding: 20px;
            border-radius: 10px;
        }
        .payment-methods {
            display: flex;
            gap: 20px;
            margin-top: 20px;
        }
        .payment-option {
            background-color: #333;
            padding: 10px 15px;
            border: 2px solid white;
            cursor: pointer;
            width: 200px;
            text-align: center;
        }
        .payment-option:hover {
            background-color: #ffcc00;;
            color: white;
        }
        .payment-box {
            margin-top: 20px;
            padding: 15px;
            background: #282828;
            border-radius: 10px;
            display: none;
        }
        .payment-buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 20px;
        }
        .btn {
            padding: 12px 20px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            border-radius: 5px;
        }
        .pay-btn { background-color: #ffcc00; ; color: white; }
        .cancel-btn { background-color: gray; color: white; }
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

    <div class="container">
        <div class="left-section">
           <!--  -- <div class="poster-box"></div>-->
            <div class="info-box">
               <!--  <p><strong>Movie:</strong> <%= request.getParameter("movieTitle") %></p>
                <p><strong>Theater:</strong> <%= request.getParameter("theaterName") %></p>
                <p><strong>Showtime:</strong> <%= request.getParameter("showtime") %></p>
                <p><strong>Seats:</strong> <%= request.getParameter("selectedSeats") %></p>
                <p><strong>Total:</strong> Rs. <%= request.getParameter("totalAmount") %></p>-->
            </div>
        </div>
        <div class="right-section">
                        <% String selectedSeats = request.getParameter("selectedSeats"); %>
                        <% String totalAmount = request.getParameter("totalAmount"); %>
                        <p><strong>Total:</strong> Rs. <%= request.getParameter("totalAmount") %></p>
                        <p><strong>Seats:</strong> <%= request.getParameter("selectedSeats") != null ? request.getParameter("selectedSeats") : "No Seats Selected" %></p>
                        
            <h3>Select Payment Methods:</h3>
            <div class="payment-methods">
                <div class="payment-option" onclick="showPayment('card')">Debit/Credit Card</div>
                <div class="payment-option" onclick="showPayment('upi')">UPI</div>
            </div>

            <div id="card-box" class="payment-box">
                <h4>Enter Card Details</h4>
                <input type="text" placeholder="Card Number">
                <input type="text" placeholder="Expiry Date">
                <input type="text" placeholder="CVV">
            </div>

            <div id="upi-box" class="payment-box">
                <h4>Scan UPI QR Code</h4>

                <input type="text" placeholder="Enter UPI ID (Optional)">
            </div>

            <div class="payment-buttons">
                <form action="/tktbooking/processPayment" method="post">
                    <input type="text" name="cardNumber" id="cardNumber" placeholder="Card Number">
                    <input type="text" name="expDate" id="expDate" placeholder="MM/YY">
                    <input type="text" name="cvv" id="cvv" placeholder="CVV">
                    <input type="text" name="upiId" id="upiId" placeholder="UPI ID">
                    
                    <input type="hidden" name="movieTitle" value="<%= request.getParameter("movieTitle") %>">
                    <input type="hidden" name="theaterName" value="<%= request.getParameter("theaterName") %>">
                    <input type="hidden" name="showtime" value="<%= request.getParameter("showtime") %>">
                    <input type="hidden" name="selectedSeats" value="<%= request.getParameter("selectedSeats") %>">
                    <input type="hidden" name="totalAmount" value="<%= request.getParameter("totalAmount") %>">
                    
                    <button type="submit" class="btn pay-btn">Pay</button>
                </form>
                <button class="btn cancel-btn" onclick="window.location.href='cancelBooking.jsp'">Cancel</button>
            </div>
        </div>
    </div>

    <script>
        function showPayment(method) {
            document.getElementById('card-box').style.display = 'none';
            document.getElementById('upi-box').style.display = 'none';
            if (method === 'card') {
                //document.getElementById('card-box').style.display = 'block';
                document.querySelector('input[name="cardNumber"]').required = true;
                document.querySelector('input[name="expDate"]').required = true;
                document.querySelector('input[name="cvv"]').required = true;
                document.querySelector('input[name="upiId"]').required = false;
            } else if (method === 'upi') {
                //document.getElementById('upi-box').style.display = 'block';
                
            }
        }
        
        console.log("Received Selected Seats:", "<%= selectedSeats %>");
        console.log("Received Total Amount:", "<%= totalAmount %>");
    </script>
</body>
</html>

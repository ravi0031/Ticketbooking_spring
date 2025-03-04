<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Seat Booking - BookMyShow</title>
    <style>
        .seat-row {
            display: flex;
            justify-content: center;
            margin: 5px 0;
        }
        .seat {
            width: 30px;
            height: 30px;
            margin: 5px;
            text-align: center;
            line-height: 30px;
            border: 1px solid gray;
            border-radius: 5px;
            cursor: pointer;
        }
        .available { background-color: #b0e57c; }
        .sold { background-color: #ff6b6b; cursor: not-allowed; }
        .selected { background-color: #4CAF50; color: white; }
        .sofa { background-color: #ffcc66; }
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
   <h1>${movieTitle} - ${genre}</h1>
   <p> ${showtime}</p>
   <h3>${theaterName} - ${theaterAddress}</h3>
   
   <form action="/tktbooking/seat" method="get">
       <input type="hidden" name="movieTitle" value="${movieTitle}">
       <input type="hidden" name="theaterName" value="${theaterName}">
       <input type="hidden" name="theaterAddress" value="${theaterAddress}">
       <input type="hidden" name="showtime" value="${showtime}">
       <input type="hidden" name="selectedSeats" id="selectedSeatsInput">
       <input type="hidden" name="totalAmount" id="totalAmountInput">

        <div>
            <p><strong>Rs. 220 Sofa</strong> (Row A)</p>
            <div class="seat-row">
                <% for (int i = 1; i <= 18; i++) { %>
                    <div class="seat sofa available" onclick="selectSeat(this, 'A', <%= i %>, 220)"><%= i %></div>
                <% } %>
            </div>
        </div>

        <div>
            <p><strong>Rs. 170 Premium</strong></p>
            <% String rows = "BCDEFGHIJKLM"; %>
            <% for (char row : rows.toCharArray()) { %>
                <div class="seat-row">
                    <%= row %>
                    <% for (int i = 1; i <= 13; i++) { %>
                        <div class="seat available" onclick="selectSeat(this, '<%= row %>', <%= i %>, 170)"><%= i %></div>
                    <% } %>
                </div>
            <% } %>
        </div>

        <div style="text-align: center; margin-top: 20px;">
           <button type="submit" id="bookNowBtn">Book Now (Rs. 0)</button>
        </div>
   </form>
</body>
    <script>
        let selectedSeats = [];
        let totalAmount = 0;

        function selectSeat(element, row, seatNumber, price) {
            if (!element.classList.contains('sold')) {
                element.classList.toggle('selected');
                let seatId = row + seatNumber;

                if (element.classList.contains('selected')) {
                    selectedSeats.push({ row, seatNumber, price });
                } else {
                    selectedSeats = selectedSeats.filter(seat => seat.row + seat.seatNumber !== seatId);
                }

                updateTotal();
            }
        }

        function updateTotal() {
            totalAmount = selectedSeats.reduce((sum, seat) => sum + seat.price, 0);
            document.getElementById('bookNowBtn').innerText = `Book Now (Rs. ${totalAmount})`;
            document.getElementById('selectedSeatsInput').value = JSON.stringify(selectedSeats);
            document.getElementById('totalAmountInput').value = totalAmount;
        }

    function validateAndSubmit(event) {
        if (selectedSeats.length === 0) {
            alert("Please select at least one seat before proceeding.");
            event.preventDefault(); // Stop form submission
        }
    }

    document.addEventListener("DOMContentLoaded", function () {
        document.querySelector("form").addEventListener("submit", validateAndSubmit);
        
        totalAmount = selectedSeats.reduce((sum, seat) => sum + seat.price, 0);
        document.getElementById('bookNowBtn').innerText = `Book Now (Rs. ${totalAmount})`;
        
        // Store selected seats properly
        let seatString = selectedSeats.map(seat => seat.row + seat.seatNumber).join(", ");
        document.getElementById('selectedSeatsInput').value = seatString;
        console.log("Debug - Selected Seats before submission:", seatString);
        document.getElementById('selectedSeatsInput').value = selectedSeats.join(",");


        document.getElementById('totalAmountInput').value = totalAmount;
        console.log("Selected Seats: ", seatString);
    });
</script>
</html>


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
    </style>
    <script>
        function selectSeat(element) {
            if (!element.classList.contains('sold')) {
                element.classList.toggle('selected');
            }
        }
    </script>
</head>
<body>
    <h1>Chhaava - Bharat Cineplex: Kurla (W)</h1>
    <h2>Today, 25 Feb, 07:30 PM</h2>
    <h3>2 Tickets</h3>
    <div>
        <p><strong>Rs. 220 Sofa</strong> (Row A)</p>
        <div class="seat-row">
            <% for (int i = 1; i <= 18; i++) { %>
                <div class="seat sofa available" onclick="selectSeat(this)"><%= i %></div>
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
                    <div class="seat available" onclick="selectSeat(this)"><%= i %></div>
                <% } %>
            </div>
        <% } %>
    </div>

    <div style="text-align: center; margin-top: 20px;">
        <button onclick="alert('Seats booked successfully!')">Book Now</button>
    </div>
</body>
</html>

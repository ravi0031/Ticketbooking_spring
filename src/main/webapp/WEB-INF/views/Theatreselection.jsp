<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Theatres - BookMyShow Style</title>
    <style>



/* Container for all theatres */
.theatres {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); 
    gap: 20px;
    margin-top: 20px;
}

/* Styling for each theater card */
.theater-card {
    border: 1px solid #ccc;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
     background: linear-gradient(to right, #141e30, #243b55);
    transition: transform 0.2s ease;
    cursor: pointer;
}

.theater-card:hover {
    transform: translateY(-8px);
}

.theater-card h3 {
    font-size: 1.4em;
    margin: 0;
    padding: 15px;
    background: #ffcc00;
    color: #fff;
    text-align: center;
}

.theater-card p {
    font-size: 1em;
    margin: 10px 15px;
    color: #555;
}

/* Styling for showtimes */
.showtimes {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    padding: 15px;
    justify-content: center;
    border-top: 1px solid #eee;
}

/* Individual showtime card */
.showtime-card {
    border: 1px solid #007bff;
    border-radius: 8px;
    padding: 8px 12px;
    text-align: center;
    transition: background-color 0.3s, color 0.3s;
    width: 80px;
}

.showtime-card p {
    font-size: 0.9em;
    font-weight: bold;
    margin: 0;
    color: #007bff;
}

.showtime-card a {
    display: block;
    font-size: 0.8em;
    margin-top: 5px;
    text-decoration: none;
    color: #007bff;
    font-weight: 500;
    border: 1px solid #007bff;
    border-radius: 5px;
    padding: 5px 8px;
    transition: all 0.3s ease;
}

.showtime-card a:hover {
    background-color: #007bff;
    color: #fff;
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


 <input type="date" id= "selecteddate" name="date">
<div class="movie-info">
    <h2>Now Showing: ${movie.movieTitle}</h2>
    <p><strong>Genre:</strong> ${movie.genre}</p>
</div>

<div class="theaters">
        <c:forEach var="theater" items="${theaters}">
            <div class="theater-card">
                <h3>${theater.theaterName}</h3>
                <p>${theater.address}, ${theater.city}</p>

                <div class="showtimes">
                    <h4>Showtimes:</h4>
                    <c:forEach var="showtime" items="${theater.showtimes}">
                        <div class="showtime-card">
                            <p>${showtime.time}</p>
                            <a href="/tktbooking/select-seats/${theater.theaterId}/${showtime.showtimeId}
    ?movieTitle=${movie.movieTitle}
    &genre=${ movie.genre}
    &theaterName=${theater.theaterName}
    &theaterAddress=${theater.address}, ${theater.city}
    &showtime=${showtime.time}
    ">
    Select Seats</a>
                               
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:forEach>
    </div>
</body>

</html>



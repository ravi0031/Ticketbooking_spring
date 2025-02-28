<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Theatres - BookMyShow Style</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }
        .container {
            width: 90%;
            margin: 20px auto;
        }
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 20px;
            background-color: #333;
            color: white;
        }
        .navbar div {
            cursor: pointer;
            padding: 10px;
        }
        .navbar div:hover {
            background-color: #555;
            border-radius: 5px;
        }
        .date-slider {
            margin: 20px 0;
            display: flex;
            overflow-x: auto;
            gap: 10px;
            white-space: nowrap;
        }
        .date-slider div {
            display: inline-block;
            padding: 10px 15px;
            background: #4CAF50;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .date-slider div:hover {
            background: #45a049;
        }
        .theatres {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 15px;
            margin-top: 20px;
        }
        .theatre-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            cursor: pointer;
            position: relative;
        }
        .theatre-card:hover {
            transform: translateY(-10px);
        }
        .theatre-image {
            width: 100%;
            height: 180px;
            background: #ddd;
        }
        .theatre-info {
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .theatre-info h3 {
            margin: 0;
            font-size: 18px;
        }
        .location {
            font-size: 14px;
            color: #555;
        }
        .show-times {
            padding: 10px 15px;
        }
        .show-times span {
            display: inline-block;
            background: #4CAF50;
            color: white;
            padding: 5px 8px;
            border-radius: 5px;
            margin-right: 5px;
            margin-bottom: 5px;
            cursor: pointer;
        }
        /* General styling for the page */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f9;
    color: #333;
    margin: 0;
    padding: 20px;
}

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
    background-color: #fff;
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
    background-color: #007bff;
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
        
    </style>
</head>
<body>
    <div class="container">
        <div class="navbar">
            <div>Logo</div>
            <div>Search Movies</div>
            <div>Search Theatres</div>
            <div>Profile</div>
        </div>

        <div class="date-slider">
            <div>Feb 25</div>
            <div>Feb 26</div>
            <div>Feb 27</div>
            <div>Feb 28</div>
            <div>Feb 29</div>
            <div>Mar 1</div>
            <div>Mar 2</div>
        </div>
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
                            <a href="/tktbooking/select-seats/${theater.theaterId}/${showtime.showtimeId}?movieTitle=${movie.movieTitle}">Select Seats</a>
                                Select Seats (Theater: ${theater.theaterId}, Showtime: ${showtime.showtimeId})
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>



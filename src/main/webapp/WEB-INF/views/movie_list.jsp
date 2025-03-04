<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movies Dashboard</title>
    <style>
        body {
         font-family: 'Arial', sans-serif;
    background: linear-gradient(to right, #141e30, #243b55);
    color: #ffffff;
    margin: 0;
    padding: 0;
}
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            padding: 20px;
        }
        .movie-card {
            background: white;
            margin: 15px;
            width: 200px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            overflow: hidden;
        }
        .movie-thumbnail {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .movie-info {
            padding: 10px;
        }
        .movie-info h3 {
            font-size: 16px;
            margin-bottom: 10px;
        }
        .movie-info p {
            font-size: 14px;
            color: #555;
            margin: 5px 0;
        }
        .movie-info .rating {
            color: #f39c12;
        }
        .movie-info .genre {
            font-weight: bold;
        }
        .movie-link {
    display: block;
    text-decoration: none;
    color: inherit;
}
.movie-card:hover {

    background-color: #f0f0f0;
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
.footer {
    text-align: center;
    padding: 20px;
    background: #141e30;
    color: #ffffff;
}
    </style>
</head>
<body>

      <div class="navbar">
        <h1>Movie Ticket Booking</h1>
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/tktbooking/dashboard">Home</a>
            <a href="#">Sign Up</a>
            <a href="#">Profile</a>
        </div>
    </div>

    <div class="container">
        <!-- Loop through the list of movies -->
        <c:forEach var="movie" items="${movies}">
            <div class="movie-card">
            <a href="/tktbooking/movie/${movie.movieTitle}" class="movie-link">
                <img src="${movie.image_url}" alt="${movie.image_url}" class="movie-thumbnail">
                <div class="movie-info">
                    <h3>${movie.movieTitle}</h3>
                    <p><strong>Runtime:</strong> ${movie.durationInMinutes} mins</p>
                    <p><strong>Release Date:</strong> ${movie.releaseDate}</p>
                    <p><strong>Average Rating:</strong> <span class="rating">${movie.avgRating}</span></p>
                    <p><strong>Language:</strong> ${movie.language}</p>
                    <p><strong class="genre">Genre:</strong> ${movie.genre}</p>
                </div>
            </div>
        </c:forEach>
    </div>
   <div class="footer">
        <p>&copy; 2025 Movie Ticket Booking. All Rights Reserved.</p>
    </div>
</body>
</html>
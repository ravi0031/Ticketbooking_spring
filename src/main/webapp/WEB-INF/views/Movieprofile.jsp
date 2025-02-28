<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${movie.movieTitle}</title>
<style>
/* General Styles */
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

/* Movie Header */
.movie-header {
    text-align: center;
    margin: 20px 0;
}

.movie-header h1 {
    font-size: 3rem;
    color: #ffcc00;
}

.movie-header h3 {
    font-size: 1.5rem;
    color: #ffffff;
}

/* Movie Container */
.movie-container {
    display: flex;
    gap: 30px;
    margin: 20px auto;
    padding: 20px;
    width: 80%;
    border-radius: 15px;
    background: rgba(255, 255, 255, 0.1);
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
}

.movie-image {
    width: 350px;
    border-radius: 15px;
    border: 3px solid #ffcc00;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
}

.movie-details {
    flex-grow: 1;
}

.movie-details p {
    font-size: 1.2rem;
    line-height: 1.6;
    margin: 8px 0;
}

.movie-details p strong {
    color: #ffcc00;
}

/* Buttons */
.buttons {
    margin-top: 20px;
}

.buttons button {
    margin-right: 15px;
    padding: 12px 24px;
    font-size: 1.2rem;
    font-weight: bold;
    color: #141e30;
    background-color: #ffcc00;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.2s;
}

.buttons button:hover {
    background-color: #ffc107;
    transform: scale(1.1);
}

/* Reviews */
.reviews {
    width: 80%;
    margin: 40px auto;
}

.reviews h2 {
    font-size: 2rem;
    color: #ffcc00;
    text-align: center;
    margin-bottom: 20px;
}

.review-list {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
}

.review-card {
    background: rgba(255, 255, 255, 0.1);
    border-radius: 10px;
    padding: 15px;
    width: calc(33.333% - 20px);
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
    transition: transform 0.3s;
}

.review-card:hover {
    transform: scale(1.05);
}

.review-card p {
    margin: 5px 0;
}

/* Footer */
.footer {
    text-align: center;
    padding: 20px;
    background: #141e30;
    color: #ffffff;
}

</style>
</head>
<body>

    <!-- Header -->
    <div class="navbar">
        <h1>Movie Ticket Booking</h1>
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/tktbooking/dashboard">Home</a>
            <a href="#">Movies</a>
            <a href="#">Events</a>
            <a href="#">Plays</a>
            <a href="#">Sports</a>
            <a href="#">Sign In</a>
        </div>
    </div>

    <!-- Movie Title -->
    <div class="movie-header">
        <h1>${movie.movieTitle}</h1>

    </div>

    <!-- Movie Content -->
    <div class="movie-container">
        <img src="${movie.image_url}" alt="${movie.movieTitle}" class="movie-image">

        <div class="movie-details">
            <p><strong>Description:</strong> ${movie.description}</p>
            <p><strong>Release Date:</strong> ${movie.releaseDate}</p>
            <p><strong>Duration:</strong> ${movie.durationInMinutes} minutes</p>
            <p><strong>Language:</strong> ${movie.language}</p>
            <p><strong>Genre:</strong> ${movie.genre}</p>
            <p><strong>Rating:</strong> ${movie.avgRating}</p>
           

            <div class="buttons">
               <button onclick="location.href='${pageContext.request.contextPath}/tktbooking/theaters?movieTitle=${movie.movieTitle}'">Book Tickets</button>
               <button onclick="location.href='${pageContext.request.contextPath}/tktbooking/dashboard'">Back to Dashboard</button>
            </div>
        </div>
    </div>

    <!-- Reviews Section 
    <div class="reviews">
        <h2>Top Reviews</h2>
        <div class="review-list">
            <c:forEach var="review" items="${reviews}">
                <div class="review-card">
                    <p><strong>${review.userName}</strong> - ${review.rating}/10</p>
                    <p>${review.comment}</p>
                </div>
            </c:forEach>
        </div>
    </div>
-->
    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2025 Movie Ticket Booking. All Rights Reserved.</p>
    </div>

</body>
</html>

package com.ravi.TicketBooking.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


import com.ravi.TicketBooking.Entity.Movie;
import com.ravi.TicketBooking.Service.MovieService;






@Controller
@RequestMapping("/tktbooking")
public class MovieController {
	 @Autowired
	   MovieService movieService;

	    @GetMapping("/dashboard")
	    public String viewDashboard(Model model) {
	        // Fetch the list of movies and pass it to the view
	        List<Movie> movies = movieService.getAllMovies();
	        model.addAttribute("movies", movies);
	        return "movie_list"; // Name of the dashboard JSP
	    }

	    @GetMapping("/movie/{movieTitle}")
	    public String viewMovieProfile(@PathVariable String movieTitle, Model model) {
	        // Fetch movie details by movieId
	        Movie movie = movieService.getMovieByTitle(movieTitle);
	        model.addAttribute("movie", movie);
	        return "Movieprofile"; // Name of the movie profile JSP
	    }
	}

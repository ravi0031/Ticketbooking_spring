package com.ravi.TicketBooking.Controller;

import java.util.ArrayList;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ravi.TicketBooking.Entity.Movie;
import com.ravi.TicketBooking.Entity.User;
import com.ravi.TicketBooking.Service.LoginService;
import com.ravi.TicketBooking.Service.MovieService;





@Controller
@RequestMapping("/tktbooking")
public class LoginController {

	@Autowired
	private LoginService loginService;
	
	@Autowired
	private MovieService movieService;

	@GetMapping("/login")
	public String login() {

		return "login";
	}

	@GetMapping("/signup")
	public String signup() {

		return "Signup";
	}

	@PostMapping("/auth")
	public String authenticate(@RequestParam("username") String username, @RequestParam("password") String password,
			Model model) {
		User loggedInUser = loginService.authenticateUser(username, password);
		if (loggedInUser != null) {
			model.addAttribute("currUser", loggedInUser);
			List<Movie> movieList = movieService.getAllMovies();//new ArrayList<Movie>();
			model.addAttribute("movies", movieList);
			// model.addAttribute("upcomingMovies", movieList);
			return "movie_list";
		} else {
			return "login";
		}
	}

}

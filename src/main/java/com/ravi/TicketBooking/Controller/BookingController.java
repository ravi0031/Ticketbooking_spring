package com.ravi.TicketBooking.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ravi.TicketBooking.Entity.Movie;
import com.ravi.TicketBooking.Service.MovieService;
import com.ravi.TicketBooking.Service.TheatreService;

@Controller
@RequestMapping("/tktbooking")
public class BookingController {
	
	@Autowired
	TheatreService theatreService;
	
	@Autowired
	MovieService movieService;
	
	@GetMapping("/cancel")
	public String cancel(@PathVariable("theaterId") int theaterId, 
	    	    @PathVariable("showtimeId") int showtimeId,
	    	    @RequestParam("movieTitle") String movieTitle,
	    	    @RequestParam("theaterName") String theaterName,
	    	    @RequestParam("theaterAddress") String theaterAddress,
	    	    @RequestParam("showtime") String showtime,
	    	    Model model){
		
	        System.out.println("Received Theater ID: " + theaterId + ", ShowTime ID: " + showtimeId);
	        Movie movie = movieService.getMovieByTitle(movieTitle);
	        model.addAttribute("movieTitle", movieTitle);
	        model.addAttribute("theaterName", theaterName);
	        model.addAttribute("theaterAddress", theaterAddress);
	        model.addAttribute("showtime", showtime);
	        model.addAttribute("theaterId", theaterId);
	        model.addAttribute("showtimeId", showtimeId);
	        return "Seatselection";
	    }
	}





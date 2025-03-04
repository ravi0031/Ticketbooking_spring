package com.ravi.TicketBooking.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ravi.TicketBooking.Entity.Movie;
import com.ravi.TicketBooking.Entity.ShowTime;
import com.ravi.TicketBooking.Entity.Theater;
import com.ravi.TicketBooking.Service.MovieService;
import com.ravi.TicketBooking.Service.TheatreService;

@Controller
@RequestMapping("/tktbooking")
public class TheatreController {
	 @Autowired
	    private TheatreService theatreService;
	 
	 @Autowired
	 private MovieService movieService;

	 
	    @GetMapping("/theaters")
	    public String showTheaters(Model model, @RequestParam("movieTitle") String movieTitle) {
	    	List<Theater> theaters = theatreService.getAllTheaters();
	       // List<ShowTime> showtimes = theatreService.getAllShowTimes();
	       
	    	//System.out.println("Theaters count: " + theaters.size());
	       // for (Theater theater : theaters) {
	       //     System.out.println("Theater ID: " + theater.getTheaterId() + ", Name: " + theater.getTheaterName());
	       // }
	    	Movie movie = movieService.getMovieByTitle(movieTitle);
	        model.addAttribute("theaters", theaters);
	        //model.addAttribute("showtimes", showtimes);
	        model.addAttribute("movie", movie);
	        return "Theatreselection";
	    }
	   /* public String showTheaters(RedirectAttributes redirectAttributes) {
	        List<Theater> theaters = theatreService.getAllTheaters();
	        redirectAttributes.addFlashAttribute("theaters", theaters);
	        return "redirect:/tktbooking/showTheatersPage";
	    }

	    @GetMapping("/showTheatersPage")
	    public String showTheatersPage(Model model) {
	        System.out.println("After redirecting, Model attributes:");
	        model.asMap().forEach((key, value) -> System.out.println(key + " -> " + value));

	        return "Theatreselection";
	    }*/

	    @GetMapping("/showtimes/{theaterId}")
	    public String showShowtimes(@PathVariable int theaterId, Model model) {
	        model.addAttribute("showtimes", theatreService.getShowtimesByTheaterId(theaterId));
	        model.addAttribute("theaterId", theaterId);
	        return "showtimes";
	    }

	    @GetMapping("/select-seats/{theaterId}/{showtimeId}")
	    public String selectSeats( @PathVariable int theaterId, 
	    	    @PathVariable int showtimeId,
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

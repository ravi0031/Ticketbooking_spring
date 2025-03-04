package com.ravi.TicketBooking.Service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ravi.TicketBooking.Entity.Movie;
import com.ravi.TicketBooking.Repository.MovieRepository;

@Service
public class MovieService {
	
	@Autowired
	MovieRepository movieRepository;
	
	public List<Movie> getAllMovies(){
		System.out.println(movieRepository.findAll());
		return movieRepository.findAll();
		
	}



	public Movie getMovieByTitle(String movieTitle) {
		return movieRepository.findByMovieTitle(movieTitle);
	}
	}


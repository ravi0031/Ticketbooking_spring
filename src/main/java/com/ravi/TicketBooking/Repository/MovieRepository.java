package com.ravi.TicketBooking.Repository;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ravi.TicketBooking.Entity.Movie;







@Repository
public interface MovieRepository extends JpaRepository<Movie, Integer>{
	List<Movie> findAll();
	

	Movie findByMovieTitle(String movieTitle);
}

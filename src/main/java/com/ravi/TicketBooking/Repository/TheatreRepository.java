package com.ravi.TicketBooking.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ravi.TicketBooking.Entity.Theater;


@Repository
public interface TheatreRepository extends JpaRepository<Theater, Integer> {
	
	  List<Theater> findAll();
	
	Theater findByTheaterId(int theaterId );
	Theater findByTheaterName(String theaterName);
    List<Theater> findByCity(String city);
}

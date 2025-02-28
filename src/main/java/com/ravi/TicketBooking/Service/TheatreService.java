package com.ravi.TicketBooking.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ravi.TicketBooking.Entity.ShowTime;
import com.ravi.TicketBooking.Entity.Theater;
import com.ravi.TicketBooking.Repository.ShowtimeRepository;
import com.ravi.TicketBooking.Repository.TheatreRepository;



@Service
public class TheatreService {
    @Autowired
    private TheatreRepository theatreRepository;
    
    @Autowired
    private ShowtimeRepository showtimeRepository;

    public List<Theater> getAllTheaters() {
       // List<Theater> theaters = theatreRepository.findAll();  
       // System.out.println("Fetched theaters: " + theaters.size());
       // for (Theater t : theaters) {
       //     System.out.println("Theater: " + t.getTheaterId() + " - " + t.getTheaterName());
       // }
    	return theatreRepository.findAll();
        
    }
    public List<ShowTime> getShowtimesByTheaterId(int theaterId) {
        Theater theater = theatreRepository.findById(theaterId)
                .orElseThrow(() -> new RuntimeException("Theater not found with ID: " + theaterId));
        return showtimeRepository.findByTheater(theater);
    }
	public List<ShowTime> getAllShowTimes() {
		return showtimeRepository.findAll();
		}
}

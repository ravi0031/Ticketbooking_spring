package com.ravi.TicketBooking.Entity;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "show_time_details")
public class ShowTime {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "showtime_id")
    private int showtimeId;
    
    @ManyToOne
	@JoinColumn(name = "movie_title")
	private Movie movie;

    @Column(name = "time")
    private String time; // Time for the show (e.g., "2:00 PM")

    @ManyToOne
    @JoinColumn(name = "theater_id")
    private Theater theater;
    
    @Column(name = "show_time")
    private Date showTime;
    
    

    // Getters and setters
    public int getShowtimeId() {
        return showtimeId;
    }

    public Date getShowTime() {
		return showTime;
	}

	public void setShowTime(Date showTime) {
		this.showTime = showTime;
	}

	public void setShowtimeId(int showtimeId) {
        this.showtimeId = showtimeId;
    }

    public String getTime() {
        return time;
    }

    public Movie getMovie() {
		return movie;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
	}

	public void setTime(String time) {
        this.time = time;
    }

    public Theater getTheater() {
        return theater;
    }

    public void setTheater(Theater theater) {
        this.theater = theater;
    }
}

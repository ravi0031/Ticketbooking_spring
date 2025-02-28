package com.ravi.TicketBooking.Repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ravi.TicketBooking.Entity.ShowTime;
import com.ravi.TicketBooking.Entity.Theater;

@Repository
public interface ShowtimeRepository extends JpaRepository<ShowTime, Integer> {
	List<ShowTime> findByTheater(Theater theater);
    List<ShowTime> findByShowTimeBetween(Date startDate, Date endDate);
}

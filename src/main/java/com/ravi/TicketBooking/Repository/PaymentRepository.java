package com.ravi.TicketBooking.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ravi.TicketBooking.Entity.Movie;
import com.ravi.TicketBooking.Entity.Payment;

@Repository

public interface PaymentRepository extends JpaRepository<Payment, Long> {

	List<Payment> findAll();
}

package com.ravi.TicketBooking.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ravi.TicketBooking.Entity.User;



@Repository
public interface UserRepository extends JpaRepository<User, Integer>{

	List<User> findByPhoneNumber(String phoneNumber);
}

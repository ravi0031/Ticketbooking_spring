package com.ravi.TicketBooking.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ravi.TicketBooking.Entity.User;
import com.ravi.TicketBooking.Repository.UserRepository;



@Service
public class LoginService {

	@Autowired
	UserRepository userRepository;

	public User authenticateUser(String username, String password) {
		List<User> userList = userRepository.findByPhoneNumber(username);

		if (userList.size() > 0) {
			User currUser = userList.get(0);
			if (currUser.getPassword().equals(password)) {
				return currUser;
			} else {
				return null;
			}
		} else {
			return null;
		}

	}
}
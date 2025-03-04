package com.ravi.TicketBooking.Service;

import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ravi.TicketBooking.Entity.Payment;
import com.ravi.TicketBooking.Repository.PaymentRepository;

@Service
public  class PaymentService {
	@Autowired
    private PaymentRepository paymentRepository;
	public boolean validateCard(String cardNumber, String expDate, String cvv) {
        if (cardNumber == null || expDate == null || cvv == null) return false;

        boolean isValid = cardNumber.matches("\\d{16}") &&
                expDate.matches("(0[1-9]|1[0-2])/(\\d{2})") &&
                cvv.matches("\\d{3}");

                System.out.println("Card Validation: " + isValid);
                return isValid;
    }

    public boolean validateUPI(String upiId) {
        if (upiId == null) return false;
        boolean isValid = upiId.matches("^[a-zA-Z0-9.\\-_]{2,256}@[a-zA-Z]{2,64}$");

        System.out.println("UPI Validation: " + isValid);
        return isValid;
    }
}


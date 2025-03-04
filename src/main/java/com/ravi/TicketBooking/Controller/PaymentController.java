package com.ravi.TicketBooking.Controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ravi.TicketBooking.Service.PaymentService;

@Controller
@RequestMapping("/tktbooking")
public class PaymentController {

	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	@PostMapping("/payment")
	public String redirectToPayment(@RequestParam String selectedSeats, RedirectAttributes redirectAttributes) {
	    redirectAttributes.addFlashAttribute("selectedSeats", selectedSeats);
	    return "Payment";
	}
	 @Autowired
	    private PaymentService paymentService;

	    @PostMapping("/processPayment")
	    public String processPayment(
	            @RequestParam(required = false) String cardNumber,
	            @RequestParam(required = false) String expDate,
	            @RequestParam(required = false) String cvv,
	            @RequestParam(required = false) String upiId,
	            @RequestParam String movieTitle,
	            @RequestParam String theaterName,
	            @RequestParam String showtime,
	            @RequestParam(name = "selectedSeats",required = false) String selectedSeats,
	            @RequestParam(required = false) String totalAmount,
	            Model model) {
	    	
	        System.out.println("Received Payment Request: " + movieTitle + ", " + theaterName + ", " + totalAmount);
	        System.out.println("Card: " + cardNumber + ", Expiry: " + expDate + ", CVV: " + cvv);
	        System.out.println("UPI ID: " + upiId);
	        System.out.println("Received selectedSeats: " + selectedSeats);
	        System.out.println("Received totalAmount: " + totalAmount);

	    	
	        boolean isValid = false;

	        if (cardNumber != null && !cardNumber.isEmpty() &&
	                expDate != null && !expDate.isEmpty() &&
	                cvv != null && !cvv.isEmpty()) {
	                
	                isValid = paymentService.validateCard(cardNumber, expDate, cvv);
	                
	            } 
	            else if (upiId != null && !upiId.isEmpty()) {
	                isValid = paymentService.validateUPI(upiId);
	                
	            }

	            if (isValid) {
	                model.addAttribute("movieTitle", movieTitle);
	                model.addAttribute("theaterName", theaterName);
	                model.addAttribute("showtime", showtime);
	                model.addAttribute("selectedSeats", selectedSeats);
	                model.addAttribute("totalAmount", totalAmount);

	                return "PaymentSuccess"; // Redirects to paymentSuccess.jsp
	            } else {
	                return "PaymentFailure"; // Redirects to payment.jsp (failure case)
	            }
	    }
}


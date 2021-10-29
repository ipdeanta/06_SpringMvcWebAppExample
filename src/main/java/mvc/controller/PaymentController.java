package main.java.mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//@RequestMapping("/path") para eliminar disambiguedades entre controladores redirigiendo a recursos con mismo nombre
public class PaymentController {
	
	@RequestMapping("/pay")
	public String pay(HttpSession session) {
		
		session.removeAttribute("cartList");
		
		return "paymentConfirmed";
	}
	
}

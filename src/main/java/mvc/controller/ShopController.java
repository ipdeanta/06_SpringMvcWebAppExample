package main.java.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
//@RequestMapping("/path") para eliminar disambiguedades entre controladores redirigiendo a recursos con mismo nombre
public class ShopController {
	
	@RequestMapping("/refreshShop")
	public String refreshShop() {
		return "shop";
	}
	
	@RequestMapping("/returnShop")
	public String returnShop() {
		return "shop";
	}
	
	
	@RequestMapping("/doConfirmPayment")
	public String confirmPayment() {
		//Si queremos que el String lo devuelva como respuesta: @ResponseBody
		return "confirmPayment"; // prefijos y sufijos van en fichero de configuracion
		
	}
	
}

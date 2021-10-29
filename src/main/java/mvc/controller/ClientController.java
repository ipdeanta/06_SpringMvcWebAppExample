package main.java.mvc.controller;

import javax.validation.Valid;

import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import main.java.mvc.model.entity.Client;

@Controller
public class ClientController {

	@RequestMapping(value="/register")
	public String showRegisterForm(Model model) {
		Client client = new Client();
		model.addAttribute("newClient", client);
		return "registerClient";
	}

	//Equivalente
//	@RequestMapping(value="/register", method = RequestMethod.GET)
//	public String showRegisterForm() {
//		return new ModelAndView("registerClient", "newClient", new Client());
//	}
	
	@RequestMapping("/processRegister")
	public String processRegisterClientForm(@Valid @ModelAttribute("newClient") Client client,
			BindingResult validationResult) {
		String view = validationResult.hasErrors() ? "registerClient" : "confirmRegistration";
		return view;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		StringTrimmerEditor blankTrimmer = new StringTrimmerEditor(true); // para quitar espacios en blanco
		binder.registerCustomEditor(String.class, blankTrimmer);
	}
}

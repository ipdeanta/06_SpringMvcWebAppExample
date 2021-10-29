package main.java.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
//@RequestMapping("/path") para eliminar ambiguedades entre controladores redirigiendo a recursos con mismo nombre
public class LoginController {
	
	private final static String NAME = "admin";
	private final static String PASSWORD = "pass";
	
	@RequestMapping//(value="/", method=RequestMethod.GET)
	public String defaultAccess() {
		return showLoginPage();
	}
	
	
	@RequestMapping("/showLoginPage")
	public String showLoginPage() {
		//Si queremos que el String lo devuelva como respuesta: @ResponseBody
		return "login"; // prefijos y sufijos van en fichero de configuracion
		
	}

	@RequestMapping("/processLogin")
//	public String processLogin(HttpServletRequest request, Model model) {
	public String processLogin(@RequestParam("name") String name, @RequestParam("password") String password, Model model) {
//		String name = request.getParameter("name");
//		String password = request.getParameter("password");

		String viewName = "";
		if (NAME.equals(name) && PASSWORD.equals(password) ) {
			// recuperamos nombre completo del cliente, y lo guardamos en sesión
			String fullName = "Fulanito Pérez Gutierrez";
//			HttpSession session = request.getSession(true);
			model.addAttribute("clientName", fullName);// el modelo se consume al generar la vista
//			session.setAttribute("clientName", fullName);
			viewName ="shop";
		} else {
			viewName = "loginError";
		}
		return viewName;
	}
	
}

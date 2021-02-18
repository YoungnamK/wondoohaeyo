package common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	@GetMapping(value="main.co")
	public String doGet() {
		
		
		return "main";
	}
	
}

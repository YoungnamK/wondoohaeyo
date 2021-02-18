package onedayClass.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OnedayClassInsertController {
	private final String command = "/onedayInsert.odc";
	private final String get_gotopage = "onedayInsertForm"; 
	
	@GetMapping(value = command)
	public String doGet() {
		return get_gotopage;
	}
}

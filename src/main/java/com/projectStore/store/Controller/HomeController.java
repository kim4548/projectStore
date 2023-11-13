package com.projectStore.store.Controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping("/")
	public String home(HttpServletRequest request , HttpServletResponse response  ) throws Exception {
		System.out.println("HomeController-----> ");





		return "home";
	}
	
}

package com.mycompany.myapp.web.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.domain.CalendarUser;
import com.mycompany.myapp.domain.Event;
import com.mycompany.myapp.domain.EventAttendee;
import com.mycompany.myapp.domain.UserRole;
import com.mycompany.myapp.service.CalendarService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/users")
public class UsersController {
	@Autowired
	private CalendarService calendarService;

	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public ModelAndView signin(
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout,
			ModelAndView model) {
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("signin");

		return model;

	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String viewRegistration(Model model) {
		CalendarUser userForm = new CalendarUser();
		model.addAttribute("userForm", userForm);
         
        return "signup";
    }
     
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String processRegistration(@ModelAttribute("userForm") CalendarUser user, Model model) {
         
        this.calendarService.createUser(user);
        UserRole userRole = new UserRole();
        userRole.setUserId(user.getEmail());
        userRole.setRole("ROLE_USER");
        this.calendarService.createRole(userRole);
        model.addAttribute("userForm", user);
        return "signupSuccess";
    }

	
	@RequestMapping(value = "/myinfo", method = RequestMethod.GET)
	public String viewInformation(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			CalendarUser user = this.calendarService.getUserByEmail(userDetail.getUsername());
			System.out.println(user.getId());
			System.out.println(user.getEmail());
			
			model.addAttribute("user", user);
		} 
        return "myinfo";
    }
	@RequestMapping(value = "/myinfo", method = RequestMethod.POST)
	public String processInformation(@ModelAttribute("user") CalendarUser user,@ModelAttribute("email") String email, Model model) {
		System.out.println("Start");
		System.out.println(user.getEmail());
		System.out.println(email);
		user.setEmail(email);
		
		user.setId(calendarService.getUserByEmail(email).getId());
		System.out.println(email);
		System.out.println(user.getId());
		System.out.println(user.getEmail());
		System.out.println(user.getName());
        System.out.println(user.getPassword());
        
        this.calendarService.updateUser(user);
        
        return "myinfoSuccess";
    }
	
}

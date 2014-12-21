package com.mycompany.myapp.web.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Locale;

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
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.domain.CalendarUser;
import com.mycompany.myapp.domain.Event;
import com.mycompany.myapp.domain.EventAttendee;
import com.mycompany.myapp.domain.EventLevel;
import com.mycompany.myapp.domain.UserRole;
import com.mycompany.myapp.service.CalendarService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/events")
public class EventController {
	@Autowired
	private CalendarService calendarService;	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index(Locale locale, ModelAndView mav) {
		List<Event> events = calendarService.getAllEvents();
		mav.addObject("events", events);
		
		List<EventAttendee> attendees = calendarService.getAllEventAttendee();
		mav.addObject("attendees", attendees);
		
		Event eventForm = new Event();
		mav.addObject("eventForm", eventForm);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			CalendarUser user = this.calendarService.getUserByEmail(userDetail.getUsername());
			mav.addObject("user", user);
		}
		
		mav.setViewName("allEvents");
		return mav;
	}
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public ModelAndView index(@ModelAttribute("eventForm") Event event, ModelAndView mav) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetail = (UserDetails) auth.getPrincipal();
		CalendarUser user = this.calendarService.getUserByEmail(userDetail.getUsername());
        
		EventAttendee eventAttendee = new EventAttendee();
		eventAttendee.setAttendee(user);
		eventAttendee.setId(event.getId());
		
		calendarService.createEventAttendee(eventAttendee);
		
        mav.setViewName("allEventsSuccess");
        return mav;
    }
	
		
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String createEvent(Model model) {
		Event eventForm = new Event();
		model.addAttribute("eventForm", eventForm);
        
        return "createEvent";
    }
     
	@RequestMapping(value = "/form", method = RequestMethod.POST)
	public String processEvent(@ModelAttribute("eventForm") Event event, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetail = (UserDetails) auth.getPrincipal();
		CalendarUser user = this.calendarService.getUserByEmail(userDetail.getUsername());
        
        Calendar calendar = Calendar.getInstance();
        calendar.getTimeInMillis();
        event.setWhen(calendar);
        event.setOwner(user);
		event.setNumLikes(0);
		event.setEventLevel(EventLevel.valueOf(1));
		
		model.addAttribute("eventForm", event);
        calendarService.createEvent(event);       
        return "createEventSuccess";
    }
	
	
	
	@RequestMapping(value = "/my", method = RequestMethod.GET)
	public ModelAndView myEvent(ModelAndView model) {
		//check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			CalendarUser user = this.calendarService.getUserByEmail(userDetail.getUsername());
			List<Event> events = this.calendarService.getEventForOwner(user.getId());
			List<EventAttendee> attendees = this.calendarService.getEventAttendeeByAttendeeId(user.getId());
			
			model.addObject("user", user);
			model.addObject("events", events);
			model.addObject("attendees", attendees);
		}
		model.setViewName("myEvent");
		return model;
	}
}

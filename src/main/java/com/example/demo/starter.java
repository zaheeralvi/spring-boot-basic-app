package com.example.demo;

import java.awt.List;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ch.qos.logback.core.Context;
@Controller
public class starter{
	
	@Autowired
	private userRepository userRepository;

	
	@RequestMapping("/")
	public String home(HttpSession session) {
		session.setAttribute("name", "Zaheer Awan");
		return "index.jsp";
	}
	
	@RequestMapping("/about")
	public String about() {
		return "about.jsp";
	}
	
	@RequestMapping("/contact")
	public String contact() {
		return "contact.jsp";
	}
	
	@RequestMapping("/welcome")
	public String welcome(HttpServletRequest request) {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String country = request.getParameter("country");
	
		user n = new user();
		n.setName(name);
		n.setEmail(email);
		n.setCountry(country);
		userRepository.save(n);
		request.setAttribute("user", name);
		return "welcome.jsp";
	}
	
	@RequestMapping(path="/all")
	public String getAllUsers(HttpServletRequest request,Model model) {
		Iterable<user> user =userRepository.findAll();

		model.addAttribute("userlist",user);
		return "users.jsp";
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public String add(HttpServletRequest request) throws Exception {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String country = request.getParameter("country");
		try {
		user n = new user();
		n.setName(name);
		n.setEmail(email);
		n.setCountry(country);
		userRepository.save(n);
		int id=n.getId();
		return " "+id;
		}catch(Exception e) {
			throw new Exception(e);
		}
	}
	
	@RequestMapping(path="/remove")
	@ResponseBody
	public String removeuser(HttpServletRequest request) {
		int id=  Integer.parseInt(request.getParameter("id"));
		userRepository.deleteById(id);
		return "Successfully deleted new user "+ id;
	}
	
	@RequestMapping(path="/edit")
	@ResponseBody
	public String edituser(HttpServletRequest request) throws Exception {
		int id=  Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String country = request.getParameter("country");
		try {
			user n = new user();
			n.setId(id);
			n.setName(name);
			n.setEmail(email);
			n.setCountry(country);
			userRepository.save(n);
			return "Successfully updated";
		}catch(Exception e) {
			throw new Exception(e);
		}
		
	}
	
}







package com.cdac.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cdac.dao.matchDetailsDao;
import com.cdac.dto.Admin;
import com.cdac.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	AdminService adminserv;
	
	@Autowired
	matchDetailsDao temp;
	
	@Autowired
	MailSender mailSender;
	
	@RequestMapping(value =  "addAdmin")
	public String addAdmin(ModelMap map) {
		map.put("addAdmin", new Admin());
		return "addAdminForm";
		
	}
	
	//login
	@RequestMapping("/login")
	public String loginHere(ModelMap map) {
		map.put("admin", new Admin());
		return "Login";		
	}
	
	//loginProcess
	@RequestMapping("/loginProcess")
	public String loginProcess(ModelMap map, Admin admin, HttpSession session) {
		if(!temp.checkUser(admin.getUserName(), admin.getUserPass()))
	 {
			session.setAttribute("admin", new Admin());
			return "index";
		}
		else {
				String msg = "Invalid Creadential...!!! ";
				map.put("msg",msg);
				map.put("admin", new Admin());
				return "Login";
			}
	}	
	
	//addAdminProcess
	@RequestMapping(value =  "addAdminProcess",method = RequestMethod.POST)
	public String addAdminProcess(ModelMap map, Admin admin) {		
		adminserv.addAdmin(admin);
		String email = admin.getUserEmail();
		System.out.println("Email "+email);
		if(email != null) {
			SimpleMailMessage message = new SimpleMailMessage();  
	        message.setFrom("cdacmumbai3@gmail.com");  
	        message.setTo(email);  
	        message.setSubject("Welcome Greeting : ");  
	        message.setText("Hi "+admin.getUserName()+"  Welcome to our site.....!! thank you for being with us..");  
	        //sending message   
	        mailSender.send(message);
	       // return "fpSuccess";
	    	return "reg_success";
		}		
		return "reg_success";
	}
	
	//validateAdmin
			@RequestMapping("/validateAdmin")
			public String validateAdmin(@RequestParam("userEmail") String userEmail,@RequestParam("userName") String userName, HttpSession session) {
				String pass = temp.validateUser(userName, userEmail);
				//System.out.println("pass "+pass);
				if(pass != null) {
					SimpleMailMessage message = new SimpleMailMessage();  
			        message.setFrom("cdacmumbai3@gmail.com");  
			        message.setTo(userEmail);  
			        message.setSubject("PASSWORD CONFIRMATION ");  
			        message.setText("Your password is : "+pass);  
			        //sending message   
			        mailSender.send(message);
			        return "fpSuccess";
				}
				else {
					return "wrongCredential";
				}
			}
}

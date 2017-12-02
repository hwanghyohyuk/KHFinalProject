package com.kh.everycvs.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.everycvs.user.model.service.UserService;


@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
}

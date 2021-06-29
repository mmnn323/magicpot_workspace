package com.kh.magicpot.message.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.magicpot.message.model.service.MessageService;

@Controller
public class MessageController {

	@Autowired
	private MessageService msgService;
}

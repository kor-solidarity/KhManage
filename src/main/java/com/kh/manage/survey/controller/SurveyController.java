package com.kh.manage.survey.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SurveyController {

	
	@RequestMapping("surveyMain.su")
	public String surveyMain() {
		
		return "user/survey/surveyMain"; 
	}
	
	
	
}

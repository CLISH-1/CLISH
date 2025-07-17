package com.itwillbs.clish.course.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.clish.admin.service.AdminClassService;
import com.itwillbs.clish.course.dto.ClassDTO;
import com.itwillbs.clish.course.service.CompanyClassService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("course")
@RequiredArgsConstructor
public class UserClassController {
	private final AdminClassService adminClassService;
	private final CompanyClassService companyClassService;
	
	// /course/user/classList --> top.jsp에 location.href 필요
	// 클래스 리스트
	@GetMapping("user/classList")
	public String classListForm(Model model) {
		
		List<Map<String , Object>> classList = adminClassService.getClassList();
		
		model.addAttribute("classList", classList);
		
		return "/course/user/class_list";
	}
	
	// 클래스 상세 페이지
	@GetMapping("user/classDetail")
	public String classDetailForm(@RequestParam String classIdx, Model model) {
		
		ClassDTO classInfo = companyClassService.getClassInfo(classIdx);
		
		model.addAttribute("classInfo", classInfo);
		
		return "/course/user/class_detail";
	}
}

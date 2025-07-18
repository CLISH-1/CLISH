package com.itwillbs.clish.course.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.clish.admin.controller.AdminUserController;
import com.itwillbs.clish.admin.service.AdminClassService;
import com.itwillbs.clish.admin.service.AdminUserService;
import com.itwillbs.clish.course.dto.ClassDTO;
import com.itwillbs.clish.course.service.CompanyClassService;
import com.itwillbs.clish.course.service.UserClassService;
import com.itwillbs.clish.myPage.dto.ReservationDTO;
import com.itwillbs.clish.user.dto.UserDTO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("course")
@RequiredArgsConstructor
public class UserClassController {
	private final AdminClassService adminClassService;
	private final CompanyClassService companyClassService;
	private final UserClassService userClassService;
	
	// 클래스 리스트
	@GetMapping("user/classList")
	public String classListForm(Model model, HttpSession session) {
		
		String userId = (String)session.getAttribute("sId");
		List<Map<String , Object>> classList = adminClassService.getClassList();
		
		model.addAttribute("classList", classList);
		
		return "/course/user/course_list";
	}
	
	// 클래스 상세 페이지
	@GetMapping("user/classDetail")
	public String classDetailForm(@RequestParam String classIdx, Model model, HttpSession session) {
		
		String userId = (String)session.getAttribute("sId");
		ClassDTO classInfo = companyClassService.getClassInfo(classIdx);
		
		model.addAttribute("classInfo", classInfo);
		
		return "/course/user/course_detail";
	}
	
	// 예약정보 입력 페이지
	@GetMapping("user/courseReservation")
	public String classReservation(Model model, HttpSession session, ClassDTO classDTO, UserDTO userDTO) {
		
		String classIdx = (String)session.getAttribute("classIdx");
		String userId = (String)session.getAttribute("sId");
		
		ClassDTO classInfo = companyClassService.getClassInfo(classIdx); // classIdx
		UserDTO userIdx = userClassService.getUserIdx(userId); // userIdx
		
		model.addAttribute("classInfo", classInfo);
		
		return "/course/user/course_reservation";
	}
	
	@GetMapping("user/success")
	public String classReservationSuccess(Model model, HttpSession session, ReservationDTO reservationDTO) {
		
		String userId = (String)session.getAttribute("sId");
		
		UserDTO userInfo = userClassService.getUserIdx(userId); // userIdx
		String userIdx = userInfo.getUserIdx();
		
		String now = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
		String reservationIdx = "RE" + now;
		
		reservationDTO.setReservationIdx(reservationIdx);
		reservationDTO.setUserIdx(userIdx);
		reservationDTO.setClassIdx("classIdx");
		
		userClassService.registReservation(reservationDTO);
		
		
		return "/course/user/course_list";
	}
}

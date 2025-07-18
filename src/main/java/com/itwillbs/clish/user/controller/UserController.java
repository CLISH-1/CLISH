package com.itwillbs.clish.user.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Objects;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.clish.user.dto.CompanyDTO;
import com.itwillbs.clish.user.dto.UserDTO;
import com.itwillbs.clish.user.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {
	
	private final UserService userService;
	
	//회원가입
	@GetMapping("/join")
	public String showJoinTypePage() {
	    return "/user/join_way";
	}
	
	//일반-기업 분류 회원가입
	@GetMapping("/join/form")
	public String joinForm(HttpSession session, @RequestParam(required = false) String from) {
	    if ("general".equals(from)) {
	        session.setAttribute("userType", 1);
	    } else if ("company".equals(from)) {
	        session.setAttribute("userType", 2);
	    }
	    return "user/join_form";
	}
	
	// 회원가입 완료
	@PostMapping("/register")
	public String processJoin( 
			@ModelAttribute UserDTO userDTO,
	        @RequestParam(value = "biz_file", required = false) MultipartFile bizFile,
	        @RequestParam(value = "biz_reg_no", required = false) String bizRegNo,
	        RedirectAttributes redirect) {

	    String prefix = (userDTO.getUserType() == 1) ? "user" : "comp";
	    String now = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
	    String userIdx = prefix + now;
	    userDTO.setUserIdx(userIdx);

	    CompanyDTO companyDTO = null;
	    if (userDTO.getUserType() == 2) {
	        companyDTO = new CompanyDTO();
	        companyDTO.setUserIdx(userIdx);
	        companyDTO.setBizRegNo(bizRegNo);

	        try {
	            companyDTO.setBizFileName(bizFile.getOriginalFilename());
	            companyDTO.setBizFile(bizFile.getBytes());
	        } catch (IOException e) {
	            redirect.addFlashAttribute("errorMsg", "기업 회원가입 실패");
	            return "redirect:/user/join/form";
	        }
	    }

	    int result = (userDTO.getUserType() == 2)
	        ? userService.registerCompanyUser(userDTO, companyDTO)
	        : userService.registerGeneralUser(userDTO);

	    if (result > 0) {
	        return "redirect:/user/join_success";
	    } else {
	        redirect.addFlashAttribute("errorMsg", "회원가입 실패");
	        return "redirect:/commons/fail";
	    }
	}
	
	@GetMapping("/join_success")
	public String joinSuccess() {
		return "/user/join_success";
	}
	
	@GetMapping("/login")
	public String showLoginForm() {
	    return "user/login_form";
	}
	
	@PostMapping("/login")
	public String login(
	        @ModelAttribute UserDTO userDTO,
	        @RequestParam(value = "rememberId", required = false) String rememberId,
	        HttpServletResponse response, HttpSession session, RedirectAttributes redirect) {
	    
	    UserDTO dbUser = userService.selectUserId(userDTO.getUserId());
	    
	    if (dbUser == null || !dbUser.getUserPassword().equals(userDTO.getUserPassword())) {
	        redirect.addFlashAttribute("errorMsg", "비밀번호 불일치");
	        return "redirect:/user/login";
	    }

	    if (Objects.equals(dbUser.getUserStatus(), 3)) {
	        redirect.addFlashAttribute("errorMsg", "탈퇴한 회원입니다.");
	        return "redirect:/user/login";
	    }

	    if (Objects.equals(dbUser.getUserEmailAuthYn(), "N")) {
	        redirect.addFlashAttribute("errorMsg", "이메일 인증 후 로그인 가능합니다.");
	        return "redirect:/user/login";
	    }

	    session.setAttribute("sUT", dbUser.getUserType());
	    session.setAttribute("loginUser", dbUser);
	    session.setMaxInactiveInterval(600);

	    Cookie cookie = new Cookie("rememberId", dbUser.getUserId());
	    cookie.setPath("/");
	    if (rememberId != null) {
	        cookie.setMaxAge(60 * 60 * 24 * 30); 
	    } else {
	        cookie.setMaxAge(0);
	    }
	    response.addCookie(cookie);

	    return "redirect:/";
	}
	
	@PostMapping("/saveEmailSession")
	public String saveEmailSession(@RequestParam("user_email") String userEmail,
	                               HttpSession session, RedirectAttributes redirect) {
	    session.setAttribute("user_email", userEmail);
	    redirect.addFlashAttribute("authMsg", "======");
	    return "redirect:/member/general_join";
	}
	
}

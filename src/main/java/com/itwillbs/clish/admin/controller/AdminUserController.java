package com.itwillbs.clish.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.clish.admin.service.AdminUserService;
import com.itwillbs.clish.user.dto.UserDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("admin")
@RequiredArgsConstructor
public class AdminUserController {
	private final AdminUserService adminService;
	
	/*
	 * 추가해야 될 부분
	 * 관리자가 로그인한건지 확인하는 부분
	 * - 관리자 로그인이 아닐 경우 접근하지 못하게 하기
	 * 
	 * 신고 회원 처리
	 * - 테이블 생성
	 * 
	 * 필터링 기능
	 * 
	 */
	
	@GetMapping("/")
	public String adminIndex() {

		return "/admin/admin_page";
	}
	
	// 일반 회원 정보 리스트
	@GetMapping("/user")
	public String userList(HttpSession session, Model model) {
		// 로그인 세션에 저장되었을 경우 생각하고 작업
		// --------------------------------------
		session.setAttribute("sId", "admin");
		String id = (String) session.getAttribute("sId");
		
		if (!id.equals("admin")) {
			model.addAttribute("msg", "접근 권한이 없습니다!");
			return "commons/fail";
		}
		// --------------------------------------
		
		List<UserDTO> userList = adminService.getUserList();
		
		model.addAttribute("users", userList);
		
		return "/admin/user/user_list";
	}
	
	// 일반 회원 상세 정보
	@GetMapping("/user/{idx}")
	public String userInfo(@PathVariable("idx") String idx, Model model) {
		UserDTO userInfo = adminService.getuserInfo(idx);
		
		model.addAttribute("user", userInfo);
		return "/admin/user/user_info";
	}
	
	// 일반 회원 정보 수정
	@PostMapping("/user/{idx}/update")
	public String userInfoModify(@PathVariable("idx") String idx, Model model, @ModelAttribute UserDTO user) {		
		int count = adminService.modifyUserInfo(idx, user);
		
		if (count > 0) {
			model.addAttribute("msg", "회원 정보를 수정했습니다.");
			model.addAttribute("targetURL", "/admin/user");
		} else {
			model.addAttribute("msg", "다시 시도해주세요!");
			return "commons/fail";
		}
		
		return "commons/result_process";
	}
	
	
	// 일반 회원 탈퇴처리
	@PostMapping("/user/{idx}/withdraw")
	public String withdraw(@PathVariable("idx") String idx, Model model) {
		int count = adminService.setUserStatus(idx, 3);
		
		if (count > 0) {
			model.addAttribute("msg", "탈퇴를 처리했습니다.");
			model.addAttribute("targetURL", "/admin/user");
		} else {
			model.addAttribute("msg", "다시 시도해주세요!");
			return "commons/fail";
		}
		
		return "commons/result_process";
	}
	
	
	// 기업 정보 리스트
	@GetMapping("/company")
	public String companyList(Model model) {
		// 데이터베이스에서 원하는 정보 가져온다
		// service -> mapper -> xml
		// 받아온 데이터를 jsp로 넘겨준다 -> n개 이상 -> list로 받아온다?
		List<UserDTO> companyList = adminService.getCompanyList();
		// jsp에서 해당 데이터를 보여준다
		model.addAttribute("companys", companyList);
		
		return "/admin/user/company_list";
	}
	
	// 기업 상세 정보
	@GetMapping("/company/{idx}")
	public String companyInfo(@PathVariable("idx") String idx, Model model) {
		// 관리자가 아닐 경우 권한이 없다고 알려주는 로직 필요
		// GET으로 데이터 조회해서 가져오기
		// 이때 id값을 전달
		// 알림 테이블 데이터 업데이트 하는 로직 추가 필요
		// 전달받은 데이터를 jsp로 전달
		UserDTO companyInfo = adminService.getcompanyInfo(idx);
		model.addAttribute("company", companyInfo);
		return "/admin/user/company_info";
	}
	
	// 기업 승인
	@PostMapping("/company/{idx}/approve")
	public String approveCompany(@PathVariable("idx") String idx, Model model) {
		// permit_company의 permit_is_approved 값 변경
		// 성공 실패 로직 필요 
		// 성공 시 리다이렉트, 실패 시 실패했다라는 알림
		// 알림 테이블에 데이터 넣기 (승인완료된걸 알려줘야하니까??)
		int success = adminService.modifyStatus(idx, 1);
		
		if (success > 0) {
			model.addAttribute("msg", "승인 완료되었습니다.");
			model.addAttribute("targetURL", "/admin/company");
		} else {
			model.addAttribute("msg", "다시 시도해주세요!");
			return "commons/fail";
		}
		
		return "commons/result_process";
	}
	
	// 기업 승인취소
	@PostMapping("/company/{idx}/cancelApproval")
	public String cancelApproveCompany(@PathVariable("idx") String idx, Model model) {
		// permit_company의 permit_is_approved 값 변경
		// 성공 실패 로직 필요 
		// 성공 시 리다이렉트, 실패 시 실패했다라는 알림
		int success = adminService.modifyStatus(idx, 5);
		
		if (success > 0) {
			model.addAttribute("msg", "승인 취소 되었습니다.");
			model.addAttribute("targetURL", "/admin/company");
		} else {
			model.addAttribute("msg", "다시 시도해주세요!");
			return "commons/fail";
		}
		
		return "commons/result_process";
	}
	
	// 기업 정보수정
	@PostMapping("/company/{idx}/update")
	public String companyInfoModify(@PathVariable("idx") String idx, Model model, @ModelAttribute UserDTO company) {
		// db에서 데이터 가져오기 
		// 가져온 데이터랑 
		// 성공 실패 로직 필요 
		// 성공 시 리다이렉트, 실패 시 실패했다라는 알림
		int count = adminService.modifycompanyInfo(idx, company);
		
		if (count > 0) {
			model.addAttribute("msg", "회원 정보를 수정했습니다.");
			model.addAttribute("targetURL", "/admin/company");
		} else {
			model.addAttribute("msg", "다시 시도해주세요!");
			return "commons/fail";
		}
		
		return "commons/result_process";
	}
	
}

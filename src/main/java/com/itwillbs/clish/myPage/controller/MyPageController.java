package com.itwillbs.clish.myPage.controller;

import java.beans.PropertyEditorSupport;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.clish.myPage.dto.ReservationDTO;
import com.itwillbs.clish.myPage.dto.UserDTO;
import com.itwillbs.clish.myPage.service.MyPageService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/myPage")
public class MyPageController {
	private final MyPageService myPageService;
	
	// 마이페이지 메인
	@GetMapping("/main")
	public String myPage_main() {
		
		return "/clish/myPage/myPage_main";
	}
	
	// 마이페이지 정보변경
	@GetMapping("/change_user_info")
	public String mypage_change_user_info_main() {
		
		return "/clish/myPage/myPage_change_user_info";
	}
	
	// 비밀번호 확인 일치시 수정페이지로 불일치시 비밀번호가 틀렸습니다 메시지
	@PostMapping("/change_user_info_form")
	public String mypage_change_user_info_form(UserDTO user, Model model, HttpSession session, 
			@RequestParam("user_password") String user_password) {
		// session의 sId 확인, 존재하지 않으면 예외처리
		if(session.getAttribute("sId") == null) {
			System.out.println("로그인필요 세션아이디없음");
		} else { // sId 있으면 sId 정보 userDTO 불러오기
//			System.out.println(user_password); // 입력한 비밀번호 받아오기 성공
			
			user.setUserId((String)session.getAttribute("sId"));
			
			user = myPageService.getUserInfo(user);
			
//			System.out.println(user); //입력된 id 의 유저정보 불러오기
			
		}
		// session의 sId와 일치하는 id정보 db에서 받아오기
		// id정보와 pw 일치여부 판별
		System.out.println("입력된 비밀번호 : " + user_password);
		System.out.println("DB비밀번호 : " + user.getUserPassword());
		if(user.getUserPassword().equals(user_password)) {
			System.out.println("정보변경으로이동");
			model.addAttribute("user", user);
			return "clish/myPage/myPage_change_user_info_form"; //비밀번호 일치시 이동페이지
		}
		System.out.println("비밀번호가 일치하지 않습니다");
		return "/clish/myPage/myPage_change_user_info";
	}
	
	// 수정정보 UPDATE문 으로 반영후 정보변경 메인페이지로 이동
	@PostMapping("/change_user_info")
	public String mypage_change_user_info(UserDTO user, HttpSession session,
			@RequestParam("new_password2") String new_password) {
//		System.out.println(user); // 수정정보 받아오기 성공
		user.setUserId((String)session.getAttribute("sId"));
		
		UserDTO user1 = myPageService.getUserInfo(user); // 기존 유저 정보 불러오기
		System.out.println("new_password = " + new_password);
		System.out.println(new_password.isEmpty());
		
		if(!new_password.isEmpty()) { // 새비밀번호가 비어있지 않다면 비밀번호 새로지정
			user.setUserPassword(new_password);
		}else { // 아니면 기존 비밀번호 유지
			user.setUserPassword(user1.getUserPassword());
		}
		
		int count = myPageService.setUserInfo(user);
		System.out.println(count + "회 업데이트 완료");
//		return "";
		return "redirect:/myPage/change_user_info";
	}
	//------------------------------------------------------------------------------------
	//결제내역
	// 예약목록 불러오기
	@GetMapping("/payment_info")
	public String payment_info(HttpSession session, Model model) {
		String id = (String)session.getAttribute("sId");
		if(id != null && !id.isEmpty()) {
			//예약목록 List에 저장, model로 전송
			List<ReservationDTO> reservationList = myPageService.getReservationInfo(id); 
			model.addAttribute("reservationList",reservationList);
			return "/clish/myPage/myPage_payment";
		} 
		
		return "redirect:/";
	}
	
	//예약 취소
	@PostMapping(value="/payment_info/cancel", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String cancelReservation(@RequestParam("reservationIdx") int reservationIdx, HttpSession session) {
	    // reservationIdx으로 예약 취소 처리
		String id = (String)session.getAttribute("sId");
	    int count = myPageService.cancelReservation(id, reservationIdx);
	    if(count == 0) {
	    	return "예약취소 실패";
	    }
	    return "예약이 취소되었습니다!";
	}
	
	
	//예약상세보기
	@GetMapping("/payment_info/detail")
	public String reservationDetail(@RequestParam("reservationIdx") int reservationIdx, HttpSession session, Model model, 
			ReservationDTO reservation) {
		System.out.println(reservationIdx); // 파라미터 잘 넘어옴
		reservation.setReservationIdx(reservationIdx);
		
//		reservation = myPageService.reservationDetail(reservation);
		Map<String,Object> reservationClassInfo = myPageService.reservationClassInfo(reservation); 
//		model.addAttribute("reservation", reservation);
		model.addAttribute("reservationClassInfo", reservationClassInfo);
		
		System.out.println("reservationDTO : " + reservation);
		return "/clish/myPage/myPage_reservation_detail";
	}

	//결제페이지
	@GetMapping("/payment_info/payReservation")
	public String payReservationForm(@RequestParam("reservationIdx") int reservationIdx,@RequestParam("from") String from,
			HttpSession session, Model model, 
			ReservationDTO reservation) {		
		reservation.setReservationIdx(reservationIdx);
		
//		reservation = myPageService.reservationDetail(reservation);
		Map<String,Object> reservationClassInfo = myPageService.reservationClassInfo(reservation);
		
//		model.addAttribute("reservation", reservation);
		model.addAttribute("reservationClassInfo", reservationClassInfo);
		model.addAttribute("from",from);
//		System.out.println("reservationDTO : " + reservation);
		return "/clish/myPage/myPage_reservation_payForm";
	}
	
	//예약 수정페이지
	@GetMapping("/payment_info/change")
	public String reservationChangeForm(@RequestParam("reservationIdx") int reservationIdx, HttpSession session, Model model, 
			ReservationDTO reservation) {
		System.out.println(reservationIdx); // 파라미터 잘 넘어옴
		reservation.setReservationIdx(reservationIdx);
		
//		reservation = myPageService.reservationDetail(reservation);
		Map<String,Object> reservationClassInfo = myPageService.reservationClassInfo(reservation); 
//		model.addAttribute("reservation", reservation);
		model.addAttribute("reservationClassInfo", reservationClassInfo);
		
		return "/clish/myPage/myPage_reservation_change";
	}
	// 폼 submit시 DTO에 주입할 데이터 변경[SQL : DATETIME -> DTO TIMESTAMP]
	@InitBinder
    public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Timestamp.class, new PropertyEditorSupport() {
            
            public void setAsText(String text) throws IllegalArgumentException {
                if (text == null || text.trim().isEmpty()) {
                    setValue(null);
                } else {
                    // "2025-07-13T12:38:10" → "2025-07-13 12:38:10"
                    String fixed = text.replace('T', ' ');
                    setValue(Timestamp.valueOf(fixed));
                }
            }
        });
    }
	
	//예약 폼 submit시 수행
	@PostMapping("/payment_info/change")
	public String resrvationChange(ReservationDTO reservation) {
		System.out.println("rservation : " + reservation);
		System.out.println("이동완료");
		
		myPageService.changeReservation(reservation);
		
		return "redirect:/myPage/payment_info/detail?reservationIdx=" + reservation.getReservationIdx();
	}
	
}
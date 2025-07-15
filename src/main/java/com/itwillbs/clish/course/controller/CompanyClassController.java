package com.itwillbs.clish.course.controller;

import java.sql.Date;
//import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.clish.course.dto.ClassDTO;
import com.itwillbs.clish.course.service.CompanyClassService;

@Controller
@RequestMapping("/company") // -> 우클릭 - properties - web project settings에 company 입력해당 해당 롬복 필요 없음.
public class CompanyClassController {
	private final CompanyClassService companyClassService;
	
	public CompanyClassController(CompanyClassService companyClassService) {
		this.companyClassService = companyClassService;
	}
	
	// 기업 메인페이지
	@GetMapping("")
	public String companyMainForm() {
		return "company/company_main";	
	}

	
	// 기업 마이페이지
	@GetMapping("/myPage")
	public String comMyPage() {
		return "company/myPage"; 
	}
	
	// 클래스 관리 페이지
	@GetMapping("/myPage/classManage")
    public String classManageForm() {
        return "/company/companyClass/classManage"; 
    }
	
	// 클래스 등록 페이지
	@GetMapping("/myPage/registerClass")
    public String registerClassForm() {
        return "/company/companyClass/registerClass"; 
    }
	
	@PostMapping("/myPage/registerClass")
	public String registerClassSubmit(ClassDTO companyClass, Model model, HttpServletRequest request) {
		// 고유 번호 생성 - 등록 시점에서 class_idx를 직접 만들어 넣기 (예: CLS202507132152)
		String classIdx = "CLS" + new SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date());
		companyClass.setClassIdx(classIdx);
		
		// -------------------------------------------------------------------
		// classIdx 확인용
//		System.out.println("생성된 classIdx: " + classIdx);
//		System.out.println("DTO에 들어간 값: " + companyClass.getClassIdx());
		// -------------------------------------------------------------------
		// 수강료 기본값 처리
		if(companyClass.getClassPrice() == null) {
			companyClass.setClassPrice(BigDecimal.ZERO);
		}
	    // ------------------------------------------------------------------------------------------------------
		// 체크박스(요일) 처리: List<String> → int
		int classDaysValue = 0;
		List<String> tempDays = companyClass.getClassDayNames();

		if (tempDays != null) {
		    for (int i = 0; i < tempDays.size(); i++) {
		        String val = tempDays.get(i);
		        classDaysValue += Integer.parseInt(val);
		    }
		}
		companyClass.setClassDays(classDaysValue);
		companyClass.setUserIdx("comp2025010120250711");
		companyClass.setCategoryIdx("CT_it_backend");
	    // ------------------------------------------------------------------------------------------------------
	    // 강좌 등록
	    int result = companyClassService.registerClass(companyClass);
	    
	    if (result > 0) {
	    	model.addAttribute("msg", "강좌 개설이 완료되었습니다.");
	    } else {
	    	model.addAttribute("msg", "강좌 개설에 실패했습니다. 다시 시도해주세요.");
	    }
	    
		
	    
	    return "redirect:company/myPage/classManage";
	}

	
	
}

package com.itwillbs.clish.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.clish.admin.dto.CategoryDTO;
import com.itwillbs.clish.admin.service.AdminClassService;
import com.itwillbs.clish.admin.service.CategoryService;
import com.itwillbs.clish.admin.service.NotificationService;
import com.itwillbs.clish.course.dto.ClassDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminClassController {
	private final AdminClassService adminClassService;
	private final CategoryService categoryService;
	private final NotificationService notificationService;
	
	// 카테고리 리스트
	@GetMapping("/category")
	public String categoryList(Model model) {
		List<CategoryDTO> parentCategories = categoryService.getCategoriesByDepth(1);
		List<CategoryDTO> childCategories = categoryService.getCategoriesByDepth(2);
		
		model.addAttribute("parentCategories", parentCategories);
		model.addAttribute("childCategories", childCategories);
		
		return "/admin/class/category_list";
	}
	
	@PostMapping("/category/save")
	public String categorySvae(CategoryDTO category) {
		System.out.println("category" + category);
		
		return "common/result_process";
	}
	
	// 강좌 리스트
	@GetMapping("/classList")
	public String classList(Model model) {
		
		List<Map<String , Object>> classList = adminClassService.getClassList();
		
		model.addAttribute("classList", classList);
		
		return "/admin/class/class_list";
	}
	
	
	// 강좌 상세 정보
	@GetMapping("/class/{idx}")
	public String classInfo(@PathVariable("idx") String idx, Model model) {
		// 클래스 정보 가져오기
		ClassDTO classInfo = adminClassService.getClassInfo(idx);
		
		List<CategoryDTO> parentCategories = categoryService.getCategoriesByDepth(1);
		List<CategoryDTO> childCategories = categoryService.getCategoriesByDepth(2);
		
		CategoryDTO childCategory = categoryService.getCategoryByIdx(classInfo.getCategoryIdx());
		CategoryDTO parentCategory = null;
		
		if (childCategory != null && childCategory.getParentIdx() != null) {
			parentCategory = categoryService.getCategoryByIdx(childCategory.getParentIdx());
		}
		
		model.addAttribute("classInfo", classInfo);
		model.addAttribute("parentCategories", parentCategories);
		model.addAttribute("childCategories", childCategories);
		model.addAttribute("selectedParentCategory", parentCategory);
		model.addAttribute("selectedChildCategory", childCategory);
		
		return "/admin/class/class_info";
	}
	
	// 강좌 수정
	@PostMapping("/class/{idx}/update")
	public String classInfoModify(@PathVariable("idx") String idx, Model model, 
			@ModelAttribute ClassDTO classInfo) {
		int count = adminClassService.modifyClassInfo(idx, classInfo);
		
		if (count > 0) {
			model.addAttribute("msg", "강좌 정보를 수정했습니다.");
			model.addAttribute("targetURL", "/clish/admin/classList");
		} else {
			model.addAttribute("msg", "다시 시도해주세요!");
			return "common/fail";
		}
		
		
		return "common/result_process";
	}
	
	// 강좌 승인
	@PostMapping("/class/{idx}/approve")
	public String approveClass(@PathVariable("idx") String idx, Model model) {
		int success = adminClassService.modifyStatus(idx, 2);
		
		if (success > 0) {
			model.addAttribute("msg", "승인 완료되었습니다.");
			model.addAttribute("targetURL", "/clish/admin/classList");
		} else {
			model.addAttribute("msg", "다시 시도해주세요!");
			return "common/fail";
		}
		
		return "common/result_process";
	}
	
	// 강좌 반려
	@PostMapping("/class/{idx}/reject")
	public String rejectClass (@RequestParam("content") String content, Model model) {
		
		notificationService.send("comp2025010120250711", 3, content);
		
		model.addAttribute("msg", "반려되었습니다.");
		model.addAttribute("targetURL", "/clish/admin/classList");
	
		return "common/result_process";
	}
}

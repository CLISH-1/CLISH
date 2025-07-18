package com.itwillbs.clish.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwillbs.clish.admin.mapper.AdminClassMapper;
import com.itwillbs.clish.course.dto.ClassDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
@RequiredArgsConstructor
public class AdminClassService {
	private final AdminClassMapper adminClassMapper;
	private final NotificationService notificationService;
	private final CategoryService categoryService;
	
	// 강좌 리스트
	public List<Map<String, Object>> getClassList() {
		return adminClassMapper.selectClassList();
	}
	
	@Transactional
	public int modifyStatus(String userIdx, String idx, int status) {
		int update = adminClassMapper.updateClassStatus(idx, status);
		if (update > 0) {
		  notificationService.send(userIdx, 3, "등록 요청하신 강좌가 승인되었습니다.");
		  return 1;
		} 
		
		return 0;
	}
	
	// 강좌 정보 수정
	@Transactional
	public int modifyClassInfo(String idx, ClassDTO classInfo) {
		int update = adminClassMapper.updateClassInfo(idx, classInfo);
		
		if (update > 0) {
			notificationService.send(classInfo.getUserIdx(), 3, "강좌 정보가 수정되었습니다.");
		}
		return update;
	}
	
	// 카테고리 삭제
	public int removeCategory(String categoryIdx, int depth) {
		boolean isReferenced = adminClassMapper.existsByCategory(categoryIdx, depth);
		
		if (isReferenced) {
			return 0;
		} else {
			categoryService.removeCategory(categoryIdx);
			return 1;
		}
	}

}

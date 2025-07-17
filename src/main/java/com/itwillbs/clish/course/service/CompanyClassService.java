package com.itwillbs.clish.course.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.clish.course.dto.ClassDTO;
import com.itwillbs.clish.course.mapper.CompanyClassMapper;

@Service
public class CompanyClassService {
	private final CompanyClassMapper companyClassMapper;
	
	public CompanyClassService(CompanyClassMapper companyClassMapper) {
		this.companyClassMapper = companyClassMapper;
	}
	
	// 강의 등록
	public int registerClass(ClassDTO companyClass) {
		return companyClassMapper.insertCompanyClass(companyClass);
	}
	
	// 등록한 강의 상세 조회
	public ClassDTO getClassInfo(String classIdx) {
	    ClassDTO classdto = companyClassMapper.selectClassByIdx(classIdx);

	    // classDays 값을 요일 문자열로 변환해서 classDayNames에 넣기
	    if (classdto != null && classdto.getClassDays() != null) {
	    	classdto.setClassDayNames(convertDaysToString(classdto.getClassDays()));
	    }

	    return classdto;
	}

	// 숫자(비트 조합) → "월,수,금" 형태 문자열로 변환하는 함수
	private List<String> convertDaysToString(int days) {
	    String[] dayNames = {"월", "화", "수", "목", "금", "토", "일"};
	    int[] values = {1, 2, 4, 8, 16, 32, 64};

	    List<String> result = new ArrayList<>();
	    for (int i = 0; i < values.length; i++) {
	        if ((days & values[i]) != 0) {
	            result.add(dayNames[i]);
	        }
	    }
	    return result;
	}
	
}	
	
	
	
	
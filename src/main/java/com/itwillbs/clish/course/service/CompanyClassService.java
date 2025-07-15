package com.itwillbs.clish.course.service;

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
		return companyClassMapper.selectClassByIdx(classIdx);
	}






}

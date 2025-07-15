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

	public int registerClass(ClassDTO companyClass) {
		// TODO Auto-generated method stub
		return companyClassMapper.insertCompanyClass(companyClass);
	}






}

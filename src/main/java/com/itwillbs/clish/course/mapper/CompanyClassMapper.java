package com.itwillbs.clish.course.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.clish.course.dto.ClassDTO;


@Mapper
public interface CompanyClassMapper {
	
	// 클래스 등록
	int insertCompanyClass(ClassDTO companyClass);
	
	// 등록한 강의 상세 조회
	ClassDTO selectClassByIdx(String classIdx);

}

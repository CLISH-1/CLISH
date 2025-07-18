package com.itwillbs.clish.course.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.clish.course.dto.ClassDTO;


@Mapper
public interface CompanyClassMapper {
	
	// 클래스 등록
	int insertCompanyClass(ClassDTO companyClass);
	
	// 등록한 강의 상세 조회
	ClassDTO selectClassByIdx(String classIdx);
	
	// 전체 강의 조회
	List<Map<String, Object>> selectAllClassList();
	
	// 단기 & 정기강의 조회
	List<Map<String, Object>> selectClassListByType(String type);

}

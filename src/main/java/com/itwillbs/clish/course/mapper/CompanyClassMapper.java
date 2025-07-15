package com.itwillbs.clish.course.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.clish.course.dto.ClassDTO;


@Mapper
public interface CompanyClassMapper {

	int insertCompanyClass(ClassDTO companyClass);

}

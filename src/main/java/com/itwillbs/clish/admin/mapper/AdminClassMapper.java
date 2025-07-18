package com.itwillbs.clish.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.clish.course.dto.ClassDTO;

@Mapper
public interface AdminClassMapper {

	List<Map<String, Object>> selectClassList();

	int updateClassStatus(@Param("idx") String idx, @Param("status") int status);

	int updateClassInfo(@Param("idx") String idx, @Param("classInfo") ClassDTO classInfo);

	boolean existsByCategory(@Param("categoryIdx") String categoryIdx, @Param("depth") int depth);

}

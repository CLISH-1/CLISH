package com.itwillbs.clish.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.clish.admin.dto.CategoryDTO;

@Mapper
public interface CategoryMapper {

	List<CategoryDTO> selectCategoryByDepth(int depth);

	CategoryDTO selecCategoryByIdx(String categoryIdx);

	String selectCategoryNameByIdx(String parentIdx);

	int insertCategory(CategoryDTO category);

	int updateCategory(CategoryDTO category);

	int deleteCategory(String categoryIdx);

}

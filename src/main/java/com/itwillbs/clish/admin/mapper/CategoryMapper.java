package com.itwillbs.clish.admin.mapper;

import java.util.List;

import com.itwillbs.clish.admin.dto.CategoryDTO;

public interface CategoryMapper {

	List<CategoryDTO> selectCategoryByDepth(int depth);

	CategoryDTO selecCategoryByIdx(String categoryIdx);

}

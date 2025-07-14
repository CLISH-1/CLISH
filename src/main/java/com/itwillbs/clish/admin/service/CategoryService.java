package com.itwillbs.clish.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.clish.admin.dto.CategoryDTO;
import com.itwillbs.clish.admin.mapper.CategoryMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CategoryService {
	private final CategoryMapper categoryMapper;

	// 카테고리 리스트
	public List<CategoryDTO> getCategoriesByDepth(int depth) {
		return categoryMapper.selectCategoryByDepth(depth);
	}

	public CategoryDTO getCategoryByIdx(String categoryIdx) {
		return categoryMapper.selecCategoryByIdx(categoryIdx);
	}

}

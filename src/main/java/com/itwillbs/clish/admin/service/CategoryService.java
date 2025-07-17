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

	// 카테고리 추가
	public int addCategory(CategoryDTO category) {
		int insert = 0;
		
		if (category.getDepth() == 1) {
			category.setCategoryIdx("CT_" + category.getCategoryName());
			category.setParentIdx(null);
			insert = categoryMapper.insertCategory(category);
		} else if (category.getDepth() == 2 && category.getParentIdx() != null) {
			String parentIdx = "CT_" + category.getParentIdx();
			category.setParentIdx(parentIdx);
			category.setCategoryIdx(parentIdx + "_" + category.getCategoryName());
			insert = categoryMapper.insertCategory(category);
		}
		
		return insert;
	}

	// 카테고리 수정
	public int modifyCategory(CategoryDTO category) {
		int update = 0;
		if (category.getParentIdx().equals("no_parent")) {
			category.setDepth(1);
			category.setParentIdx(null);
			update = categoryMapper.updateCategory(category);
		} else if (!category.getParentIdx().equals("no_parent") && category.getParentIdx() != null){
			String parentIdx = "CT_" + category.getParentIdx();
			category.setDepth(2);
			category.setParentIdx(parentIdx);
			update = categoryMapper.updateCategory(category);
		}
		return update;
	}

	public int removeCategory(String categoryIdx) {
		return categoryMapper.deleteCategory(categoryIdx);
	}

}

package com.itwillbs.clish.admin.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CategoryDTO {
	private String categoryIdx;
	private String categoryName;
	private int depth;
	private String parentIdx;
	private int sortOrder;
}

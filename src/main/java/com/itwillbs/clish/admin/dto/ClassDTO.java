package com.itwillbs.clish.admin.dto;

import lombok.ToString;

import lombok.Setter;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;

@Getter
@Setter
@ToString
public class ClassDTO {
	private String classIdx;
	private String classTitle;
	private String categoryIdx;
	private int classStatus;
	private int classPrice;
	private int classMember;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate startDate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate endDate;
	
	private Integer classDays;
	private String location;
	private List<String> classDayNames;
}

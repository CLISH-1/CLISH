package com.itwillbs.clish.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.clish.admin.dto.NotificationDTO;
import com.itwillbs.clish.user.dto.UserDTO;


@Mapper
public interface AdminUserMapper {

	// 유저 정보 리스트
	List<UserDTO> selectUserList();
	
	// 일반 유저 상세 정보 
	UserDTO selectUserInfo(String idx);
	
	// 일반 유저 정보 수정
	int updateUserInfo(@Param("idx") String idx, @Param("user") UserDTO user);
	
	// 기업 정보 리스트
	List<UserDTO> selectCompanyList();

	// 기업 상세 정보
	UserDTO selectCompanyInfo(String idx);

	
	// 기업 정보 수정
	int updateCompanyInfo(@Param("idx") String idx, @Param("company") UserDTO company);

	// 회원 상태 변경
	int updateUserStatus(@Param("idx") String idx, @Param("status") int status);

	// 알림 추가
	int insertNotificatoin(NotificationDTO notification);

}

package com.itwillbs.clish.myPage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.clish.myPage.dto.ReservationDTO;
import com.itwillbs.clish.myPage.dto.UserDTO;


@Mapper
public interface MyPageMapper {

	UserDTO selectUserInfo(UserDTO user);

	int updateUserInfo(UserDTO user);

	List<ReservationDTO> selectReservationInfo(String id);

	int deleteReservation(String id,int reservationIdx);

	ReservationDTO selectReservationDetail(ReservationDTO reservation);

	Map<String, Object> selectReservationClass(ReservationDTO reservation);

	void updateReservationInfo(ReservationDTO reservation);

}
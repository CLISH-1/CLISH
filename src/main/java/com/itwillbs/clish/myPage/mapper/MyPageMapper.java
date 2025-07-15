package com.itwillbs.clish.myPage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.clish.myPage.dto.ReservationDTO;
import com.itwillbs.clish.user.dto.UserDTO;


@Mapper
public interface MyPageMapper {

	UserDTO selectUserInfo(UserDTO user);

	int updateUserInfo(UserDTO user);

	List<ReservationDTO> selectAllReservationInfo(UserDTO user);

	ReservationDTO selectOneReservationInfo(ReservationDTO reservation);

	int deleteReservation(String id,int reservationIdx);

	ReservationDTO selectReservationDetail(ReservationDTO reservation);

	void updateReservationInfo(ReservationDTO reservation);

	Map<String, Object> selectReservationClass(ReservationDTO reservation);


}
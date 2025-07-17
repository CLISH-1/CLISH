package com.itwillbs.clish.myPage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.clish.course.dto.ClassDTO;
import com.itwillbs.clish.myPage.dto.PaymentInfoDTO;
import com.itwillbs.clish.myPage.dto.ReservationDTO;
import com.itwillbs.clish.user.dto.UserDTO;


@Mapper
public interface MyPageMapper {

	UserDTO selectUserInfo(UserDTO user);

	int updateUserInfo(UserDTO user);

	List<ReservationDTO> selectAllReservationInfo(UserDTO user);

	ReservationDTO selectOneReservationInfo(ReservationDTO reservation);

	ClassDTO selectOneClassInfo(ReservationDTO reservation);

	Map<String, Object> ReservationDetailInfo(ReservationDTO reservation);

	int deleteReservation(ReservationDTO reservation);

	ReservationDTO selectReservationDetail(ReservationDTO reservation);

	void updateReservationInfo(ReservationDTO reservation);

	List<PaymentInfoDTO> selectAllPaymentInfo(UserDTO user);

	int withdraw(UserDTO user);




}
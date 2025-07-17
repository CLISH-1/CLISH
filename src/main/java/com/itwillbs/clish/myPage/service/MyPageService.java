package com.itwillbs.clish.myPage.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.itwillbs.clish.course.dto.ClassDTO;
import com.itwillbs.clish.myPage.dto.PaymentInfoDTO;
import com.itwillbs.clish.myPage.dto.ReservationDTO;
import com.itwillbs.clish.myPage.mapper.MyPageMapper;
import com.itwillbs.clish.user.dto.UserDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MyPageService {
	private final MyPageMapper myPageMapper;
	//-----------------------------------------------------
	public UserDTO getUserInfo(UserDTO user) {
		return myPageMapper.selectUserInfo(user);
	}
	
	public int setUserInfo(UserDTO user) {
		// TODO Auto-generated method stub
		return myPageMapper.updateUserInfo(user);
	}
	
	public List<ReservationDTO> getReservationInfo(UserDTO user) {
		return myPageMapper.selectAllReservationInfo(user);
	}
	
	public ReservationDTO getReservationInfo(ReservationDTO reservation) {
		return myPageMapper.selectOneReservationInfo(reservation);
	}

	public ClassDTO getClassInfo(ReservationDTO reservation) {
		return myPageMapper.selectOneClassInfo(reservation);
	}

	public int cancelReservation(ReservationDTO reservation) {
		return myPageMapper.deleteReservation(reservation);
	}
	
	public ReservationDTO reservationDetail(ReservationDTO reservation) {
		return myPageMapper.selectReservationDetail(reservation);
	}
	
	public Map<String, Object> reservationDetailInfo(ReservationDTO reservation) {
		return myPageMapper.ReservationDetailInfo(reservation);
	}

	public void changeReservation(ReservationDTO reservation) {
		myPageMapper.updateReservationInfo(reservation);
	}

	public List<PaymentInfoDTO> getPaymentList(UserDTO user) {
		return myPageMapper.selectAllPaymentInfo(user);
	}
	



}

package com.itwillbs.clish.myPage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.itwillbs.clish.myPage.mapper.MyPageMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MyPageService {
	private final MyPageMapper myPageMapper;
	//-----------------------------------------------------
	public UserDTO getUserInfo(UserDTO user) {
		// TODO Auto-generated method stub

		
		return myPageMapper.selectUserInfo(user);
	}
	
	public int setUserInfo(UserDTO user) {
		// TODO Auto-generated method stub
		return myPageMapper.updateUserInfo(user);
	}
	
	public List<ReservationDTO> getReservationInfo(String id) {
		// TODO Auto-generated method stub
		return myPageMapper.selectReservationInfo(id);
	}
	
	public int cancelReservation(String id, int reservationIdx) {
		// TODO Auto-generated method stub
		return myPageMapper.deleteReservation(id, reservationIdx);
	}
	
	public ReservationDTO reservationDetail(ReservationDTO reservation) {
		// TODO Auto-generated method stub
		return myPageMapper.selectReservationDetail(reservation);
	}
	
	public Map<String, Object> reservationClassInfo(ReservationDTO reservation) {
		// TODO Auto-generated method stub
		return myPageMapper.selectReservationClass(reservation);
	}

	public void changeReservation(ReservationDTO reservation) {
		// TODO Auto-generated method stub
		myPageMapper.updateReservationInfo(reservation);
	}

}

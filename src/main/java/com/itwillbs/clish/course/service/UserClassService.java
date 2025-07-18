package com.itwillbs.clish.course.service;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.itwillbs.clish.course.dto.ClassDTO;
import com.itwillbs.clish.course.mapper.UserClassMapper;
import com.itwillbs.clish.myPage.dto.ReservationDTO;
import com.itwillbs.clish.user.dto.UserDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserClassService {
	private final UserClassMapper userClassMapper;

	public UserDTO getUserIdx(String userIdx) {
		
		return userClassMapper.selectUser(userIdx);
	}

	public void registReservation(ReservationDTO reservationDTO) {
		userClassMapper.insertReservation(reservationDTO);
	}


}

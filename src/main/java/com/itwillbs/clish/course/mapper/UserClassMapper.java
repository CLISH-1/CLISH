package com.itwillbs.clish.course.mapper;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.clish.course.dto.ClassDTO;
import com.itwillbs.clish.myPage.dto.ReservationDTO;
import com.itwillbs.clish.user.dto.UserDTO;

@Mapper
public interface UserClassMapper {

	UserDTO selectUser(String userIdx);

	void insertReservation(ReservationDTO reservationDTO);

}

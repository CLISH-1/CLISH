package com.itwillbs.clish.myPage.dto;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ReservationDTO {
	String reservationIdx;
	String userIdx;
	int reservationMembers;
	Timestamp reservationClassDate;
	Timestamp reservationCom;
	String classIdx;
	int reservationStatus;
	BigDecimal priceFin;
	
}
package com.itwillbs.clish.myPage.dto;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class UserDTO {
	private int userIdx;
	private String userName;
	private String userId;
	private String userPassword;
	private String userEmail;
	private String userPhoneNumber;
	private String userPostCode;
	private String userAddress1;
	private String userAddress2;
	private int userStatus;
	private Timestamp userRegDate;
	private Timestamp userWithdrawDate;
	private int userType;
	private int adminPenaltyCount;
}

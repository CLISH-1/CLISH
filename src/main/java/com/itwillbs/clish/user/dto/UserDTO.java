package com.itwillbs.clish.user.dto;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class UserDTO {
	private String userIdx;
	private String userName;
	private String userRepName;
	private Date userBirth;
	private String userGender;
	private String userId;
	private String userPassword;
	private String userEmail;
	private String newEmail;
	private String userEmailToken;
	private String userEmailAuthYn;
	private String userPhoneNumber;
	private String userPhoneNumberSub;
	private String userPostcode;
	private String userAddress1;
	private String userAddress2;
	private int userStatus;
	private Date userRegDate;
	private Date userWithdrawDate;
	private int userType;
	private int userPenaltyCount;
}

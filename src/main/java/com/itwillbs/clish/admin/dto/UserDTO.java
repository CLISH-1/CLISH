package com.itwillbs.clish.admin.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

@Getter
@Setter
@ToString
public class UserDTO {
	private String userIdx;
	private String userName; // 회원이름
	private String userRepName; // 대표명
	private Timestamp userBirth; // 생년월일
	private char userGender;
	private String userId;
	private String userPassword;
	private String userEmail;
	private String userEmailToken;
	private char userEmailAuthYn;
	private String userPhoneNumber;
	private String userPhoneNumberSub;
	private int userPostcode;
	private String userAddress1;
	private String userAddress2;
	private int userStatus;
	private Timestamp userRegDate;
	private int userType;
	private int userPenaltyCount;
}

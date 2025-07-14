package com.itwillbs.clish.admin.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NotificationDTO {
	private String noticeIdx;
	private String userIdx;
	private int userNoticeType;
	private String userNoticeMessage;
	private Timestamp userNoticeCreatedAt;
	private int userNoticeReadStatus;
}

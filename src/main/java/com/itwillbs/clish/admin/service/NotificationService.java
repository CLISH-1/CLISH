package com.itwillbs.clish.admin.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.stereotype.Service;

import com.itwillbs.clish.admin.dto.NotificationDTO;
import com.itwillbs.clish.admin.mapper.AdminUserMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NotificationService {
	private final AdminUserMapper adminMapper;
	
	public void send(String idx, int noticeType, String message) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
		String timestamp = LocalDateTime.now().format(formatter);
		String noticeIdx = "no" + timestamp;
		
		NotificationDTO notification = new NotificationDTO();
		notification.setNoticeIdx(noticeIdx);
		notification.setUserIdx(idx);
		notification.setUserNoticeType(noticeType);
		notification.setUserNoticeMessage(message);
		
		adminMapper.insertNotificatoin(notification);
	}
}

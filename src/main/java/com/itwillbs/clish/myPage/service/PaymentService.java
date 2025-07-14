package com.itwillbs.clish.myPage.service;
 
import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import com.itwillbs.clish.myPage.dto.PaymentCancelDTO;
import com.itwillbs.clish.myPage.dto.PaymentInfoDTO;
import com.itwillbs.clish.myPage.mapper.PaymentMapper;
import com.siot.IamportRestClient.IamportClient;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PaymentService {
	@Value("${portone.imp_code}")
	private String impCode;
	@Value("${portone.rest_api_key}")
	private String restApiKey;
	@Value("${portone.rest_api_secret}")
	private String restApiSecret;
	
	private final PaymentMapper paymentMapper;
	
	public IamportClient getkey() {
		IamportClient iamportClient = new IamportClient(restApiKey, restApiSecret);
		return iamportClient;
	}
	
	public String convertUnixToDateTimeString(Long unixTime) {
	    if (unixTime == null || unixTime == 0) return null; // 값이 없을 때 처리
	    return Instant.ofEpochSecond(unixTime)
	                  .atZone(ZoneId.of("Asia/Seoul")) // 한국 시간대
	                  .format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}
	
	@Transactional
	public void putPayInfo(PaymentInfoDTO paymentInfoDTO) {
		paymentMapper.insertPayInfo(paymentInfoDTO);
		paymentMapper.updateReservationStatus(paymentInfoDTO);
	}

	public PaymentInfoDTO getPayResult(PaymentInfoDTO paymentInfoDTO) {
		// TODO Auto-generated method stub
		return paymentMapper.selectPayResult(paymentInfoDTO);
	}

	public String getAccessToken() {
		RestTemplate restTemplate = new RestTemplate();
		String tokenUrl = "https://api.iamport.kr/users/getToken";
		
		Map<String, String> tokenRequest = new HashMap<>();
		tokenRequest.put("imp_key", restApiKey);
		tokenRequest.put("imp_secret", restApiSecret);
		
		ResponseEntity<Map> tokenResponse = restTemplate.postForEntity(tokenUrl, tokenRequest, Map.class);
		return (String)((Map)tokenResponse.getBody().get("response")).get("access_token");
	}
	
	@Transactional
	public void cancelComplete(PaymentCancelDTO paymentCancelDTO) {
		// TODO Auto-generated method stub
		paymentMapper.insertCancelInfo(paymentCancelDTO);
		paymentMapper.updatePaymentInfo(paymentCancelDTO);
		
	}

	
	
}

package com.itwillbs.clish.myPage.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.clish.myPage.dto.PaymentCancelDTO;
import com.itwillbs.clish.myPage.dto.PaymentInfoDTO;
import com.itwillbs.clish.myPage.service.MyPageService;
import com.itwillbs.clish.myPage.service.PaymentService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/myPage")
public class PaymentController {
	private final PaymentService paymentService;
	
	@PostMapping(value="/payment/verify", produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> verifyPayment(@RequestParam String imp_uid) {
		// imp_uid로 아임포트 API를 호출해 결제 정보 조회
		String requestTime  // 요청시간
			= LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

		Map<String, Object> result = new HashMap<> ();
		try {
			IamportClient iamportClient = paymentService.getkey();
			IamportResponse<Payment> response = iamportClient.paymentByImpUid(imp_uid);
			Payment payment = response.getResponse();
			result.put("impUid", payment.getImpUid()); // 포트원 결제 고유번호
			result.put("merchantUid", payment.getMerchantUid()); // 주문번호(예약번호)
			result.put("amount", payment.getAmount()); // 결제금액
			result.put("status", payment.getStatus()); // 구매상태(paid , ready, cancelled)
			result.put("userId", payment.getBuyerName()); //구매자 이름
			result.put("payMethod", payment.getPayMethod()); // 결제수단
			result.put("payTime", payment.getPaidAt()); // 결제시각
			result.put("classTitle", payment.getName()); // 상품명(강의명)
			result.put("failReason", payment.getFailReason()); // 결제실패 이유
			result.put("failTime", payment.getFailedAt()); // 결제 실패 시간
			result.put("requestTime", requestTime);
			result.put("from", payment.getCustomData());
			result.put("receiptUrl", payment.getReceiptUrl());
			System.out.println("영수증 " + payment.getReceiptUrl());
		} catch (IamportResponseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    // 결제 정보 검증(금액, 상태 등)
	    // 검증 결과를 Map 등으로 반환
		
	    return result;
	}
	
	@GetMapping("/payment_info/payResult")
	public String payResultPage( PaymentInfoDTO paymentInfoDTO,
	    @RequestParam(required = false) String imp_uid,
	    @RequestParam(required = false) String merchant_uid,
	    @RequestParam("from") String from,
	    Model model 
	) {	
		// paymentInfoDTO로 값 넘어오는거 확인 완료
		// 결제 테이블에 값 저장 필요[insert]
		paymentService.putPayInfo(paymentInfoDTO);
		// 예약 테이블 상태 변경
		System.out.println(paymentInfoDTO);
		System.out.println("영수증 " + paymentInfoDTO.getReceiptUrl());
		//결제 시간, 실패시간 long타입저장, 변환필요
		String payTime = paymentService.convertUnixToDateTimeString(paymentInfoDTO.getPayTime()/1000L);
		String failTime = paymentService.convertUnixToDateTimeString(paymentInfoDTO.getFailTime()/1000L);
		// 2. 결제 성공/실패 결과를 model에 담기
		model.addAttribute("paymentInfoDTO",paymentInfoDTO);
		model.addAttribute("payTime",payTime);
		model.addAttribute("failTime",failTime);
		model.addAttribute("from",from);

//		model.addAttribute("result", paymentInfo.isSuccess());
//	    model.addAttribute("message", paymentInfo.getMessage());
//	    model.addAttribute("amount", paymentInfo.getAmount());
//	    model.addAttribute("merchant_uid", paymentInfo.getMerchantUid());
	    return "/clish/myPage/myPage_payResult"; // JSP 파일명에 맞게 수정
	}
	
	//결제상세보기
	@GetMapping("/payment_info/paymentInfo")
	public String paymentInfo(PaymentInfoDTO paymentInfoDTO, @RequestParam("reservationIdx")int reservationIdx,
			Model model) {
		paymentInfoDTO.setMerchantUid(reservationIdx);
		System.out.println(paymentInfoDTO.getMerchantUid());// 주문번호 받아오기 끝
		paymentInfoDTO = paymentService.getPayResult(paymentInfoDTO);
		System.out.println(paymentInfoDTO);
		String payTime = paymentService.convertUnixToDateTimeString(paymentInfoDTO.getPayTime()/1000L);
		String failTime = paymentService.convertUnixToDateTimeString(paymentInfoDTO.getFailTime()/1000L);
		model.addAttribute("paymentInfoDTO",paymentInfoDTO);
		model.addAttribute("payTime",payTime);
		model.addAttribute("failTime",failTime);
		
		return "/clish/myPage/myPage_payResult";
	}
	
	//결제취소: 결제취소창으로이동
	@GetMapping("/payment_info/cancelPayment")
	public String cancelPaymentForm(PaymentInfoDTO paymentInfoDTO, @RequestParam("reservationIdx")int reservationIdx,
			Model model) {
		paymentInfoDTO.setMerchantUid(reservationIdx);
//		System.out.println(paymentInfoDTO.getMerchantUid());// 주문번호 받아오기 끝
		
		//주문번호로 결제정보 불러와서 넘기기
		paymentInfoDTO = paymentService.getPayResult(paymentInfoDTO);
		System.out.println(paymentInfoDTO);
		String payTime = paymentService.convertUnixToDateTimeString(paymentInfoDTO.getPayTime()/1000L);
		String failTime = paymentService.convertUnixToDateTimeString(paymentInfoDTO.getFailTime()/1000L);
		model.addAttribute("paymentInfoDTO",paymentInfoDTO);
		model.addAttribute("payTime",payTime);
		model.addAttribute("failTime",failTime);
		
		return "/clish/myPage/myPage_cancelPayment";
	}
	
	@PostMapping("/payment_info/cancelPayment")
	public String cancelPayment(PaymentInfoDTO paymentInfoDTO, Model model) {
		System.out.println(paymentInfoDTO.getCancelReason());
		System.out.println(paymentInfoDTO.getImpUid());
	    //포트원 액세스 토큰 발급
		String accessToken = paymentService.getAccessToken();
		//결제 취소 API 호출
		String cancelUrl = "https://api.iamport.kr/payments/cancel";

		Map<String, Object> cancelRequest = new HashMap<>();
		cancelRequest.put("imp_uid", paymentInfoDTO.getImpUid());
		cancelRequest.put("reason", paymentInfoDTO.getCancelReason());

		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", accessToken);
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<Map<String, Object>> request = new HttpEntity<>(cancelRequest, headers);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Map> cancelResponse = restTemplate.postForEntity(cancelUrl, request, Map.class);
		
		// 결과 처리
		/*
		responseBody.get("code")
		→ 응답 코드 (0: 성공, 1 이상: 실패)
		
		responseBody.get("message")
		→ 실패 시 에러 메시지 (성공이면 null)
		
		responseBody.get("response")
		→ 실제 결제(취소) 정보가 담긴 Map
		 */
		Map<String, Object> responseBody = cancelResponse.getBody();
	    int code = (int) responseBody.get("code");
	    Map<String, Object> responseMap = (Map<String, Object>) responseBody.get("response");
	    
	    PaymentCancelDTO paymentCancelDTO = null;
	    if (responseMap != null) {
	        ObjectMapper mapper = new ObjectMapper();
	        paymentCancelDTO = mapper.convertValue(responseMap, PaymentCancelDTO.class);	       
	    }
	    
	    String cancelTime = paymentService.convertUnixToDateTimeString(paymentCancelDTO.getCancelledAt());
	    
	    if (code == 0) {
	    	paymentService.cancelComplete(paymentCancelDTO);
	    	model.addAttribute("paymentCancel", paymentCancelDTO);
	    	model.addAttribute("message", "결제 취소가 정상 처리되었습니다.");
	    	model.addAttribute("cancelTime", cancelTime);
	        System.out.println("환불 처리 완료 ");
	    } else {
	        String errorMsg = (String) responseBody.get("message");
	        model.addAttribute("message", "결제 취소 실패: " + errorMsg);
	    	model.addAttribute("paymentCancel", paymentCancelDTO);
	        System.out.println("환불 처리 실패");
	    }
		return "/clish/myPage/myPage_cancelResult";
	}
}

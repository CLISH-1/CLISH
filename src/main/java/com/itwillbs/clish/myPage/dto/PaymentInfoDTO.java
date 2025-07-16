package com.itwillbs.clish.myPage.dto;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PaymentInfoDTO {
	private String impUid;        // 포트원 결제 고유번호
    private String reservationIdx;   // 주문번호(예약번호)
    private BigDecimal amount;    // 결제금액
    private String status;        // 구매상태(paid, ready, cancelled)
    private String userName;        // 구매자 이름\
    private String payMethod;     // 결제수단
    private long requestTime;   // 결제 요청 시간
    private long payTime;         // 결제시각 (UNIX 타임스탬프)
    private String classTitle;    // 상품명(강의명)
    private long cancelTime;
    private String cancelReason;  // 결제 취소 이유
    private String receiptUrl; // 결제영수증주소
}

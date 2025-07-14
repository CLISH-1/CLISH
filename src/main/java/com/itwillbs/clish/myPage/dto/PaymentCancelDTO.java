package com.itwillbs.clish.myPage.dto;

import java.math.BigDecimal;
import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class PaymentCancelDTO {
	@JsonProperty("imp_uid")
	private String impUid;
	@JsonProperty("merchant_uid")
	private String merchantUid;
	@JsonProperty("amount")
	private BigDecimal amount;
	@JsonProperty("cancel_amount")
	private BigDecimal cancelAmount;
	@JsonProperty("status")
	private String status;
	@JsonProperty("cancel_reason")
	private String cancelReason;
	@JsonProperty("cancelled_at")
	private long cancelledAt;
	@JsonProperty("buyer_name")
	private String buyerName;
	@JsonProperty("pay_method")
	private String payMethod;
	@JsonProperty("receipt_url")
	private String receiptUrl;	
}

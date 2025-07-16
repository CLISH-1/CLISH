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
	private String impUid;
	private String merchantUID;
	private String name;
	private BigDecimal amount;
	private BigDecimal cancelAmount;
	private String status;
	private String cancelReason;
	private long cancelledAt;
	private String buyerName;
	private String payMethod;
	private String receiptUrl;	
}

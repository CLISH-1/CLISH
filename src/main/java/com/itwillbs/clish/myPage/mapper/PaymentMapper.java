package com.itwillbs.clish.myPage.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.clish.payment.dto.PaymentCancelDTO;
import com.itwill.clish.payment.dto.PaymentInfoDTO;

@Mapper
public interface PaymentMapper {

	void insertPayInfo(PaymentInfoDTO paymentInfoDTO);

	void updateReservationStatus(PaymentInfoDTO paymentInfoDTO);

	PaymentInfoDTO selectPayResult(PaymentInfoDTO paymentInfoDTO);

	void insertCancelInfo(PaymentCancelDTO paymentCancelDTO);

	void updatePaymentInfo(PaymentCancelDTO paymentCancelDTO);

}

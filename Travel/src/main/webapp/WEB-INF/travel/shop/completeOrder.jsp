<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>  
<style>
	.wrap {
		margin-top: 30px;
		text-align: center;
	}
	.wrap__link {
		margin: 0px 10px;
	}
</style>
<div class="wrap">
	<h2 class="wrap__message">결제가 완료되었습니다!!</h2>
	<p class="important">예약 내역에서 리뷰를 등록하시면 50포인트를 추가로 드립니다!</p>
	<a class="wrap__link" href="${contextPath }/bookingList.mem">예약내역 보기</a>
	<a class="wrap__link" href="${contextPath }/">메인으로</a>
</div>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
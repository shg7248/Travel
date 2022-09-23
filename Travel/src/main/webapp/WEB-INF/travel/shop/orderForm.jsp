<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>  
<style>
	strong {
		display: block;
		font-size: 16px;
		font-weight: bold;
		color: rgba(0,0,0,0.38);
	}
	.order-wrap {
		display: grid;
		grid-template-columns: 7fr 3fr;
	}
	.info2__item {
		font-size: 20px;
	}
</style>
<div class="order-wrap">
	<section class="order__info1">
		<form method="post" action="${contextPath }/shop/order.shop">
			<input type="hidden" name="rnum" value="${rnum }">
			<input type="hidden" name="startDate" value="${startDate }">
			<input type="hidden" name="endDate" value="${endDate }">
			예약자 이름
			<input type="text" name="resName"/><br>
			휴대폰 번호
			<input type="text" name="resPhone"/>
			<br>
<!-- 			계좌번호
			<select>
				<option>직접입력</option>
				<option>은행1</option>
				<option>은행2</option>
			</select><br> -->
			은행
			<input type="text" name="bank"><br>
			계좌번호
			<input type="text" name="accnum"><br>
			<input type="submit" value="예약하기">
		</form>
	</section>
	<section class="order__info2">
		<p class="info2__item info2__item--name">
			<strong>숙박지이름</strong>
			${rb.aname }
		</p>
		<p class="info2__item info2__item--room">
			<strong>객실이름</strong> 
			${rb.rname }
		</p>
		<p class="info2__item info2__item--addr">
			<strong>주소</strong> 
			${rb.addr }
		</p>
		<p class="info2__item info2__item--date">
			<strong>기간</strong> 
			${rb.startDate } - ${rb.endDate }
		</p>
		<p class="info2__item info2__item--price">
			<strong>가격</strong> 
			<fmt:formatNumber value="${rb.totalDate * rb.price }"></fmt:formatNumber>원
		</p>
	</section>
</div>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
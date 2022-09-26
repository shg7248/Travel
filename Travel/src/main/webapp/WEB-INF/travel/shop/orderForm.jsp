<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>  
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("select[name='accnum']").change(function(){
		accArr = $(this).val().split("/");
		$("input[name='bank']").attr("value",accArr[0]);
		$("input[name='accnum']").attr("value",accArr[1]);
	});
	
	$("input[name='info']").change(function(){
		accArr = $(this).val().split("/");
		$("input[name='resName']").attr("value",accArr[0]);
		$("input[name='resPhone']").attr("value",accArr[1]);
	});
});

</script>
<div class="all">
	<div class="contents">
		<form method="post" action="${contextPath }/shop/order.shop">
			<input type="hidden" name="rnum" value="${rnum }">
			<input type="hidden" name="startDate" value="${startDate }">
			<input type="hidden" name="endDate" value="${endDate }">
			<div class="div">
				<label>예약자 정보</label>
				<div>
				직접 쓰기<input type="radio" name="info" value="/">
				가입한 정보<input type="radio" name="info" value="${userInfo.name }/${userInfo.phone }">
				</div>
			</div>
			
			<div class="div">
				<label for="resName">예약자 이름</label>
				<input type="text" name="resName" id="resName"/>
			</div>
			
			<div class="div">
				<label for="resPhone">휴대폰 번호</label>
				<input type="text" name="resPhone" id="resPhone"/>
			</div>
			
			<div class="div">
	 			<label>계좌번호</label>
				<select name="accnum">
					<option value="/">직접입력</option>
				<c:forEach items="${lists }" var="list">
					<option value="${list.bank }/${list.accnum }">${list.bank } ${list.accnum }</option>
					</c:forEach>
				</select><br> 
			</div>
			
			<div class="div">
				<label for="bank">은행</label>
				<input type="text" name="bank" id="bank">
				</div>
				<div class="div">
				<label for="accnum">계좌번호</label>
				<input type="text" name="accnum" id="accnum">
			</div>
			
			<input type="submit" value="예약하기">
		</form>
	</div>
	<div class="sidebar">
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
	</div>
</div>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
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
		grid-template-columns: 6fr 4fr;
		column-gap: 10px;
	}
	.contents {
		
	}
	.info2__item {
		font-size: 20px;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//예약자 이름 정규식
	rexname = /^[^0-9]{1,4}$/;
	//휴대폰 정규식
	rexphone =  /^[0-9]{1,11}$/;
	//계좌 정규식
	rexacc = /^[0-9]{1,12}$/;
	
	$("input[name='info']").change(function(){
		accArr = $(this).val().split("/");
		$("input[name='resName']").attr("value",accArr[0]);
		$("input[name='resPhone']").attr("value",accArr[1]);
	});
	
	$("select[name='acclist']").change(function(){
		accArr = $(this).val().split("/");
		$("input[name='bank']").attr("value",accArr[0]);
		$("input[name='accnum']").attr("value",accArr[1]);
	});
	
	$('#resName').keyup(function(){
		if(!rexname.test($(this).val()) && !($(this).val() == "")){
			$(this).siblings('font').text('4글자이하만 입력가능합니다.');
		}else{
			$(this).siblings('font').text('');
		}
	});
	
	$('#resPhone').keyup(function(){
		if(!rexphone.test($(this).val()) && !($(this).val() == "")){
			$(this).siblings('font').text('11자리이하 숫자만 입력가능합니다.');
		}else{
			$(this).siblings('font').text('');
		}
	});
	
	$('#accnum').keyup(function(){
		if(!rexacc.test($(this).val()) && !($(this).val() == "")){
			$(this).siblings('font').text('12자리이하 숫자만 입력가능합니다.');
		}else{
			$(this).siblings('font').text('');
		}
	});
	
});//ready

function checkAll(){
	//공백체크
	if($('#resName').val()== "" ){
		$('#resName').siblings('font').text("이름을 입력해주세요.");
		$('#resName').focus();
		return false;
	}
	
	if($('#resPhone').val()== "" ){
		$('#resPhone').siblings('font').text("휴대폰 번호를 입력해주세요.");
		$('#resPhone').focus();
		return false;
	}
	
	if($('#bank').val()== "" ){
		$('#bank').siblings('font').text("은행을 입력해주세요.");
		$('#bank').focus();
		return false;
	}
	
	if($('#accnum').val()== "" ){
		$('#accnum').siblings('font').text("계좌번호를 입력해주세요.");
		$('#accnum').focus();
		return false;
	}
}
</script>
<div class="order-wrap">
	<div class="contents">
		<form name="f" method="post" action="${contextPath }/shop/order.shop">
			<input type="hidden" name="rnum" value="${rnum }">
			<input type="hidden" name="startDate" value="${startDate }">
			<input type="hidden" name="endDate" value="${endDate }">
			<input type="hidden" name="myPoint" value="${point }"/>
			<input type="hidden" name="totalPrice" value="${rb.totalDate * rb.price }"/>
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
				<font></font>
			</div>
			
			<div class="div">
				<label for="resPhone">휴대폰 번호</label>
				<input type="text" name="resPhone" id="resPhone"/>
				<font></font>
			</div>
			
			<div class="div">
	 			<label>등록된 계좌번호</label>
				<select name="acclist">
					<option value="/">직접입력</option>
				<c:forEach items="${lists }" var="list">
					<option value="${list.bank }/${list.accnum }">${list.bank }${list.accnum }</option>
					</c:forEach>
				</select><br> 
			</div>
			
			<div class="div">
				<label for="bank">은행</label>
				<input type="text" name="bank" id="bank">
				<font></font>
			</div>
			<div class="div">
				<label for="accnum">계좌번호</label>
				<input type="text" name="accnum" id="accnum">
				<font></font>
			</div>
			
			<div class="point-form div">
				<label for="point">사용 가능한 포인트 ${point }point</label>
				<input class="point-form__text" type="text" name="point" id="point"/>
			</div>
			
			<input type="submit" value="예약하기" onclick="return checkAll()">
		</form>
	</div>
	<div class="info2__item">
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
		<span class="sidebar__price"><fmt:formatNumber value="${rb.totalDate * rb.price }"></fmt:formatNumber></span>원
	</p>
	</div>
</div>
<script type="text/javascript">
	const inputPoint = document.querySelector('.point-form__text');
	const point = document.querySelector('input[name="myPoint"]');
	let price = document.querySelector('.sidebar__price');
	const value = String(price.innerHTML);
	inputPoint.addEventListener('keyup', (e)=> {
		
		let calcPrice = Number(value.replaceAll(',',''));

		if(inputPoint.value === '') {
			calcPoint();
			return;
		}
		
 		if(!/^\d+$/.test(inputPoint.value)) {
			alert('숫자만 입력이 가능합니다.');
			inputPoint.value = "";
			return;
		} 
 		
		if(Number(inputPoint.value) > Number(calcPrice)) {
			inputPoint.value = "";
			inputPoint.value = calcPrice;
			calcPoint();	
		}
		
		if(Number(inputPoint.value) > Number(point.value)) {
			inputPoint.value = "";
			inputPoint.value = point.value;
			calcPoint();
			return;
		}
		
		calcPoint();
		
		function calcPoint() {
			price.innerHTML = String(calcPrice - Number(inputPoint.value)).replaceAll(/\B(?=(\d{3})+(?!\d))/g, ',');
		}
	});
</script>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
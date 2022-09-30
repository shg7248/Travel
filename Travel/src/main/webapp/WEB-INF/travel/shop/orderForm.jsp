<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>  
<style>
	strong {
		display: block;
		font-size: 18px;
		font-weight: bold;
	}
	font {
		display: block;
		color: red;
		font-size: 11px;
		width: 100%;
		height: 20px;
	}
	.title {
		color: #404040;
	}
	.order {
		display: grid;
		grid-template-columns: 7fr 3fr;
		column-gap: 10px;
	}
	.order__inner {
		
	}
	.order__accomInfo {
		display: grid;
		grid-template-rows: auto 50px;
		background: #EFEFEF;
	}
	.accomInfo__inner {
		padding: 20px;
		border-radius: 10px;
	}
	.res__radios {
		margin-bottom: 10px;
	}
	.res__text, .account__text, .point-form__text {
		width: 50%;
		height: 40px;
		border: 1px solid rgba(0,0,0,.08);
		padding: 20px;
	}
	
	.order__submit {
		width: 100%;
		height: 50px;
		background: red;
		color: white;
		border: none;
		border-bottom-left-radius: 10px;
		border-bottom-right-radius: 10px;
	}
	.accomInfo__price {
		
	}
	.price__text {
		color: red;
		font-size: 24px;
		font-weight: bold;
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
	
	f.submit();
}
</script>
<div class="order">
	<div class="order__userInfo">
		<form name="f" method="post" action="${contextPath }/shop/order.shop">
			<input type="hidden" name="rnum" value="${rnum }">
			<input type="hidden" name="startDate" value="${startDate }">
			<input type="hidden" name="endDate" value="${endDate }">
			<input type="hidden" name="myPoint" value="${point }"/>
			<input type="hidden" name="totalPrice" value="${rb.totalDate * rb.price }"/>
			
			<section class="user-info__res">
				<h2 class="res__title">예약자 정보</h2>
				<div class="res__radios">
					<label for="info1">직접 쓰기</label>
					<input class="res__radio" type="radio" id="info1" name="info" value="/">
					<label for="info2">가입한 정보</label>
					<input class="res__radio" type="radio" id="info2" name="info" value="${userInfo.name }/${userInfo.phone }">
				</div>
				<p>
					<label for="resName">예약자 이름</label><br>
					<input class="res__text" type="text" name="resName" id="resName" placeholder="체크인시 필요한 정보입니다"/>
					<font></font>
				</p>
				<p>
					<label for="resPhone">휴대폰 번호</label><br>
					<input class="res__text" type="text" name="resPhone" id="resPhone" placeholder="체크인시 필요한 정보입니다"/>
					<font></font>				
				</p>
			</section>
			<hr>
			<section class="user-info__account">
				<h2 class="account__title">결제 수단</h2>
				<p class="account__select-account">
		 			<label>등록된 계좌번호</label>
					<select name="acclist">
						<option value="/">직접입력</option>
						<c:forEach items="${lists }" var="list">
							<option value="${list.bank }/${list.accnum }">${list.bank }${list.accnum }</option>
						</c:forEach>
					</select> 					
				</p>
				<p>
					<label for="bank">은행</label><br>
					<input class="account__text" type="text" name="bank" id="bank">
					<font></font>				
				</p>
				<p>
					<label for="accnum">계좌번호</label><br>
					<input class="account__text" type="text" name="accnum" id="accnum">
					<font></font>					
				</p>
				<hr>
			</section>
			<p class="point-form">
				<label for="point">사용 가능한 포인트 ${point }point</label><br>
				<input class="point-form__text" type="text" name="point" id="point" value="0"/>				
			</p>
		</form>
	</div>
	<div class="order__accomInfo">
		<div class="accomInfo__inner">
			<p class="accomInfo__accomName">
				<strong class="accomName__title title">숙박지이름</strong>
				<span class="accomName__text">${rb.aname }</span>
			</p>
			<p class="accomInfo__roomName">
				<strong class="roomName__title title">객실이름</strong> 
				<span class="roomName__text">${rb.rname }</span>
			</p>
			<p class="accomInfo__addr">
				<strong class="addr__title title">주소</strong> 
				<span class="addr__text">${rb.addr }</span>
			</p>
			<p class="accomInfo__date">
				<strong class="date__title title">기간</strong> 
				<span class="date__text">${rb.startDate } - ${rb.endDate }</span>
			</p>
			<p class="accomInfo__price">
				<strong class="price__title title">총 결제 금액</strong> 
				<span class="price__text"><fmt:formatNumber value="${rb.totalDate * rb.price }"/></span>원
			</p>
		</div>
		<input class="order__submit" type="submit" value="결제하기" onclick="return checkAll()">
	</div>
</div>
<script type="text/javascript">
	const inputPoint = document.querySelector('.point-form__text');
	const point = document.querySelector('input[name="myPoint"]');
	let price = document.querySelector('.price__text');
	const value = String(price.innerHTML);
	console.log(value);
	inputPoint.addEventListener('keyup', (e)=> {
		
		let calcPrice = Number(value.replaceAll(',',''));

		if(inputPoint.value === '') {
			inputPoint.value = 0;
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>  
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#phone').keydown(function(){
		$('.checkPhone').hide();
	});
	
});
function subNum(){
	//정규표현식
	var rex = /^010\d{4}\d{4}$/;
	
	//휴대폰 null확인
	if($('#phone').val() == ""){
		$('.checkPhone').show();
		$('.checkPhone').text("휴대폰 번호를 입력하세요.");
		$('#phone').focus();
		return false;
	}
	
	//휴대폰 숫자검증 정규화
	if(!rex.test($('#phone').val())){
		$('.checkPhone').show();
		$('.checkPhone').text("번호 형식에 맞춰 입력해 주세요.");
		$('#phone').focus();
		return false;
	}
	
	//인증번호 보여주기
	$('.display').show();
	
	//휴대폰인증 api
	const formData = new FormData(myform);
	
	fetch('phoneAuth.tra', {
		method: 'POST',
		body: formData
	});
	
	alert("인증번호가 전송되었습니다.");
}

async function subAuthNumber() {
	
	const formData = new FormData(myform);
	
	let response = await fetch('phoneAuthConfirm.tra', {
		method: 'POST',
		body: formData
	});
	
	let result = await response.text();
	
	if(result === 'true') {
		alert("인증에 성공 했습니다.");
		myform.submit();
	}
	else {
		alert("인증에 실패 했습니다.");
	}
}
</script>
<div class="all height">
<form method="post" action="phoneAuthForm.log" name="myform">
	<input type="hidden" name="email" value="${param.email }">
	<input type="hidden" name="flatform" value="${param.flatform }">
	<div class="div">
	<label for="phone">휴대폰번호</label> 
	<input type="text" id="phone" name="phone" placeholder="-없이 입력해주세요." value="${param.phone }">
	<font class="checkPhone"></font>
	<input type="button" value="전송" onclick="subNum()">
	</div>
	<div class="div display" >
	<label for="phoneCheck">인증번호</label> 
	<input type="text" name="phoneCheck" id="phoneCheck" placeholder="숫자 6자리를 입력해주세요.">
	<input type="button" value="확인" class="display" onclick="subAuthNumber()">
	</div>
</form>
</div>

<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
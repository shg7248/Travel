<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>  
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("input[name='sendVcode']").click(function(){
		
		location.href="userFindPwd.log?userEmail1="+$('input[name="userEmail1"]').val()+
				"&userEmail2="+$('select>option:selected').val();
		
	});
});//ready

</script>
<body>
	<h2>비밀번호 찾기</h2>
	<label for="email">이메일</label>
	<input type="text" class="form-control" name="userEmail1" id="userEmail1" placeholder="이메일">
	<select class="form-control" name="userEmail2" id="userEmail2">
		<option>@naver.com</option>
		<option>@daum.net</option>
		<option>@gmail.com</option>
		<option>@hanmail.com</option>
		<option>@yahoo.co.kr</option>
	</select>
	<input type="button" name="sendVcode" class="btn btn-primary" id="mail-Check-Btn" value="인증번호 발송하기">
</body>
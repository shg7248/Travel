<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("input[name='sendVcode']").click(function(){
		
		location.href="ownerFindPwd.log?ownerEmail1="+$('input[name="ownerEmail1"]').val()+
				"&ownerEmail2="+$('select>option:selected').val();
		
	});
});//ready

</script>
<body>
	<h2>비밀번호 찾기</h2>
	<label for="email">이메일</label>
	<input type="text" class="form-control" name="ownerEmail1" id="ownerEmail1" placeholder="이메일">
	<select class="form-control" name="ownerEmail2" id="ownerEmail2">
		<option>@naver.com</option>
		<option>@daum.net</option>
		<option>@gmail.com</option>
		<option>@hanmail.com</option>
		<option>@yahoo.co.kr</option>
	</select>
	<input type="button" name="sendVcode" value="인증번호 발송하기">
</body>


<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>  
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("input[name='sendVcode']").click(function(){
		
		location.href="userFindPwd.log?userEmail1="+$('input[name="email"]').val();
		
	});
});//ready

</script>
<body>
<div class="all">
<div class="one height">
	<h2>비밀번호 찾기</h2>
	<div class="div email">
		<label for="email">이메일</label>
		<input type="text"  name="email" id="email" placeholder="Email">
	</div>
	<input type="button" name="sendVcode" value="인증번호 발송하기">
</div>
</div>
</body>

<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
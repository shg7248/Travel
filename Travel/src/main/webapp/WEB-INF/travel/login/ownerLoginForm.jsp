<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>  
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
});

function checkAll(){
	if($('input[name="email"]').val()==""){
		$('#checkEmail').text('이메일을 입력해 주세요.');
		f.email.focus();
		return false;
	}
	if($('input[name="pwd"]').val()==""){
		$('#checkPwd').text('비밀번호를 입력해 주세요.');
		f.pwd.focus();
		return false;
	}
}
</script>    
<div class="all">
<div class="one height">
<form method="post" name="f" action="ownerLoginForm.log">
<div class="div email">
<input type="text" name="email" id="login_email" placeholder="Email">
<font id="checkEmail"></font>
</div>
<div class="div password">
<input type="password" name="pwd" id="login_pwd" placeholder="PassWord">
<font id="checkPwd"></font>
</div>
<input type="submit" name="" value="로그인" onclick="return checkAll()">
</form>
<div class="edit">
<a href="ownerFindPwdForm.log">비밀번호 찾기</a> | 
<a href="phoneAuthForm2.log" >회원가입</a>
</div>
</div>
</div>

<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
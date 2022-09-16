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

userLoginForm.jsp
<div class="all">
<form method="post" name="f" action="userLoginForm.log" >
<div class="div email">
<input type="text" name="email" placeholder="Email">
</div>
<font id="checkEmail" class="err"></font>
<div class="div password">
<input type="text" name="pwd" placeholder="PassWord">
</div>
<font id="checkPwd" class="err"></font>
<div>
<input type="submit" name="" value="로그인" onclick="return checkAll()">
</div>
</form>
<div class="edit">
<a href="userPwdForm.log">비밀번호 찾기</a>
|
<a href="phoneAuthForm.log">회원가입</a>
</div>
</div>

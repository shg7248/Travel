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
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
	//2a2af0084ddd5b6b3167da014e30faa3
	Kakao.init('2a2af0084ddd5b6b3167da014e30faa3');

	// SDK 초기화 여부를 판단합니다.
	console.log(Kakao.isInitialized());

	function kakaoLogin() {
		//로그인(이메일받음)
		Kakao.Auth.login({
			scope : 'account_email',

			success : function(response) {
				console.log(response);
				
				//사용자 정보 가져오기
				Kakao.API.request({
					  url: '/v2/user/me',
					  data: {
					    property_keys: ['kakao_account.email']
					  },
					  success: function(response) {
					    console.log(response);
					    //kakaoLogin.log
					    location.href='kakaoLogin.log?email='+response.kakao_account.email;
					 	
					  },
					  fail: function(error) {
					    console.log(error);
					  }
					});
			},
			fail : function(error) {
				console.log(error);
			},
		});
	}

	function kakaoLogout() {
		//토큰확인
		if (!Kakao.Auth.getAccessToken()) {
			console.log('Not logged in.');
			alert("로그인 정보가 없습니다.");
			return;
		}
		//연결끊기
		Kakao.API.request({
			url : '/v1/user/unlink',
			success : function(response) {
				alert("연결끊기");
				console.log(response);
			},
			fail : function(error) {
				console.log(error);
			}
		});
		//로그아웃
		Kakao.Auth.logout(function() {
			alert("로그아웃");
			console.log(Kakao.Auth.getAccessToken());
		});
	}
</script>
<div class="all">
<div class="one height"> 
<form method="post" name="f" action="userLoginForm.log" >
<div class="div email">
<input type="text" name="email" id="login_email" placeholder="Email">
<font id="checkEmail" class="err"></font>
</div>
<div class="div password">
<input type="password" name="pwd" id="login_pwd" placeholder="PassWord">
<font id="checkPwd" class="err"></font>
</div>
<div>
<input type="submit" name="" value="로그인" onclick="return checkAll()">
</div>
</form>
<div class="edit">
<a href="userFindPwdForm.log">비밀번호 찾기</a>
|
<a href="phoneAuthForm.log">회원가입</a>
</div>

<a href="javascript:kakaoLogin();"> <img alt=""
		src="http://papaspick.com/web/upload/2019_web/icon/kakao_login.jpg" width="300px" height="60">
	</a>
	<Br>
	<a href="javascript:kakaoLogout();">카카오 연동끊기</a><Br>
</div>
</div>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>  
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	checkPwd = false;

$('input[name="pwd_update2"]').on({
	keyup: function(){
	if($('input[name="pwd_update"]').val() != $('input[name="pwd_update2"]').val()){
		$("#pwdMsg").text("비밀번호가 일치하지 않습니다.");
		$("#pwdMsg").css("color","red");
		checkPwd = false;
	}else{
		$("#pwdMsg").text("비밀번호가 일치합니다.");
		$("#pwdMsg").css("color","green");
		checkPwd = true;
		}
	},
	click: function(){
		if($('input[name="pwd_update"]').val() != $('input[name="pwd_update2"]').val()){
			$("#pwdMsg").text("비밀번호가 일치하지 않습니다.");
			$("#pwdMsg").css("color","red");
			checkPwd = false;
		}else{
			$("#pwdMsg").text("비밀번호가 일치합니다.");
			$("#pwdMsg").css("color","green");
			checkPwd = true;
			}
		}
	});
	
});//ready

function allCheck(mypwd){
	if($('input[name="pwd"]').val() == ""){
		$('#checkPwd').text("비밀번호를 입력해주세요.");
		$('#checkPwd').focus();
		return false;
	}
	
	if($('input[name="pwd_update"]').val() == $('input[name="pwd_update2"]').val()){
		checkPwd = true;
	}
	
	if(!checkPwd){
		alert("비밀번호를 확인하세요.");
		f.pwd_update2.focus();
		return false;
	}
	
	if(mypwd =! $('input[name="pwd"]').val()){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}else{
		alert("비밀번호가 변경되었습니다.");
	}
	
}
</script>
<body>
<div class="all">
<%@ include file="/WEB-INF/travel/common/layout/mem/memberList.jsp" %>  
<div class="contents">
<!-- 소셜플랫폼이 아니면 -->
<c:if test="${userInfo.flatform eq 'home' }">
<form action="pwdUpdate.mem" method="post" name="f" >
<div class="div">
<label for="pwd">현재 비밀번호</label>  
<input type="text" name="pwd" id="pwd" value="${param.pwd }" placeholder="현재 비밀번호를 입력하세요." >
<font id="checkPwd" class="err"></font>
</div>

<div class="div">
<label for="pwd_update">변경할 비밀번호</label>  
<input type="text" name="pwd_update" id="pwd_update" value="${param.pwd_update }" placeholder="변경할 비밀번호를 입력하세요." >
</div>

<div class="div">
<label for="pwd_update2">변경할 비밀번호 확인</label>  
<input type="text" name="pwd_update2" id="pwd_update2" value="${param.pwd_update2 }" placeholder="변경할 비밀번호를 입력하세요." >
<font id="pwdMsg" class="err"></font>
</div>

<input type="submit" value="변경" onclick="return allCheck(${userInfo.pwd})" >
</form>
</c:if>
<!-- 소셜로그인이면 -->
<c:if test="${userInfo.flatform ne 'home' }">
소셜로그인은 비밀번호를 변경 할 수 없습니다.
</c:if>
</div>
</div>
</body>

<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
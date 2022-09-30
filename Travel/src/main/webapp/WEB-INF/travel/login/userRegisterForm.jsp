<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>  
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//정규식 10글자 이상
	rex = /^.{10,15}$/;
	//이메일체크
	checkEmail = false;
	//비번일치체크
	checkPwd = false;
	//비번정규식체크
	checkPwdRex = false;

$("input[name='confirm']").click(function(){
	$.ajax({
        url: "ajax.log",
        type: "POST",
        data: {
        	email : $("input[name='email']").val()
        },
        success: function(data){
        	if(data == "ok"){
        		$("#checkMsg").text("사용가능한 이메일입니다.");
        		$("#checkMsg").css("color","green");
        		$("#checkMsg").show();
        		checkEmail = true;
        	}else if(data == "fail"){
        		$("#checkMsg").text("중복된 이메일입니다.");
        		$("#checkMsg").css("color","red");
        		$("#checkMsg").show();
        		checkEmail = false;
        	}else if (data == "null"){
        		$("#checkMsg").text("이메일을 입력하세요.");
        		$("#checkMsg").css("color","red");
        		$("#checkMsg").show();
        		checkEmail = false;
        	}else if (data == "no"){
        		$("#checkMsg").text("이메일 형식이 아닙니다.");
        		$("#checkMsg").css("color","red");
        		$("#checkMsg").show();
        		checkEmail = false;
        	}
        },
        error: function(jqxhr, textStatus, errorThrown){
            alert("err");
            console.log(jqxhr);
            console.log(textStatus);
            console.log(errorThrown);
        } 
  	});
});
	
$('input[name="email"]').keydown(function(){
	$("#checkMsg").hide();
	checkEmail = false;
});

$('input[name="pwd2"]').on({
	keyup: function(){
		if($('input[name="pwd"]').val() != "" && $('input[name="pwd2"]').val() != ""){
	if($('input[name="pwd"]').val() != $('input[name="pwd2"]').val()){
		$("#pwd2Msg").text("비밀번호가 일치하지 않습니다.");
		checkPwd = false;
	}else{
		$("#pwd2Msg").text("");
		checkPwd = true;
		}
		}
	},
	click: function(){
		if($('input[name="pwd"]').val() != "" && $('input[name="pwd2"]').val() != ""){
		if($('input[name="pwd"]').val() != $('input[name="pwd2"]').val()){
			$("#pwd2Msg").text("비밀번호가 일치하지 않습니다.");
			checkPwd = false;
		}else{
			$("#pwd2Msg").text("");
			checkPwd = true;
			}
		}
	}
	});
	
	//pwd값이 생기면 정규식테스트
	$('input[name="pwd"]').keyup(function(){
			if(!rex.test($('input[name="pwd"]').val())){
				$('#pwdMsg').text("10글자이상 입력해주세요.");
				checkPwdRex = false;
			}else{
				$('#pwdMsg').text("");
				checkPwdRex = true;
			}
		});
	
	//현재 내비번과 확인이 같으면
	if($('input[name="pwd"]').val() != ""){
		if($('input[name="pwd"]').val() == $('input[name="pwd2"]').val()){
			checkPwd = true;
		}
	}
	
});//ready

function allCk(){
	//공백확인
	if($('input[name="name"]').val() == ""){
		$('#nameMsg').text("이름을 입력하세요");
		f.name.focus();
		return false;
	}
	
	if($('input[name="email"]').val() == ""){
		$("#checkMsg").show();
		$('#checkMsg').text("이메일을 입력하세요");
		f.email.focus();
		return false;
	}
	
	//소셜로그인이메일
	if($('input[name="flatform"]').val() != ""){
		checkEmail = true;
		checkPwd = true;
		checkPwdRex = true;
	}else{
		if($('input[name="pwd"]').val() == ""){
			$('#pwdMsg').text("비밀번호를 입력하세요");
			f.pwd.focus();
			return false;
		}
		
		if($('input[name="pwd2"]').val() == ""){
			$('#pwd2Msg').text("비밀번호를 입력하세요");
			f.pwd2.focus();
			return false;
		}
	}
	
	//이메일 중복체크
	if(!checkEmail){
		alert("이메일 중복체크하세요.");
		f.email.focus();
		return false;
	}
	
	//비밀번호 다름
	if(!checkPwd){
		alert("비밀번호를 확인하세요.");
		f.pwd2.focus();
		return false;
	}
	
	if(!checkPwdRex){
		alert("비밀번호를 확인하세요.");
		f.pwd2.focus();
		return false;
	}
}
</script>
<body>
<div class="all">
<form name="f" method="post" action="userRegisterForm.log" >
<input type="hidden" name="phone" value="${param.phone }">
<input type="hidden" name="flatform" value="${param.flatform }">

<div class="div">
<label for="name">이름</label>
<input type="text" name="name" id="name" value="${param.name }" placeholder="이름을 입력해주세요.">
<font id="nameMsg" ></font>
</div>
<div class="div">
<label for="email">이메일</label> 
<input type="text" name="email" id="email" value="${param.email }" placeholder="이메일을 입력해주세요." 
<c:if test="${param.flatform ne '' }"> readonly </c:if>
>
<font id="checkMsg" style="display: inline;"></font>
<c:if test="${param.flatform eq '' }">
<input type="button" class="confirm" name="confirm" value="중복확인">
</c:if>
</div>

<c:if test="${param.flatform eq '' }">
<div class="div">
<label for="pwd">비밀번호</label>  
<input type="password" name="pwd" id="pwd" value="${param.pwd }" placeholder="비밀번호를 입력해주세요.">
<font id="pwdMsg" ></font>
</div>


<div class="div">
<label for="pwd2">비밀번호 확인</label> 
<input type="password" name="pwd2" id="pwd2" value="${param.pwd2 }" placeholder="비밀번호를 입력해주세요.">
<font id="pwd2Msg" ></font>
</div>
</c:if>

<input type="submit" value="회원가입" onclick="return allCk()">
<input type="reset" name="" value="다시입력">
</form>
</div>
</body>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
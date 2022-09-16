<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">


$(document).ready(function(){
	checkEmail = false;
	checkPwd = false;

$("input[name='confirm']").click(function(){
	$.ajax({
        url: "ajax.log",
        type: "POST",
        data: {
        	email : $("input[name='email']").val()
        },
        success: function(data){
        	$("#checkMsg").addClass('err');
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
        	}else{
        		$("#checkMsg").text(" 이메일을 입력하세요.");
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
	$("#checkMsg").removeClass('err');
	checkEmail = false;
});

$('input[name="pwd2"]').on({
	keyup: function(){
	if($('input[name="pwd"]').val() != $('input[name="pwd2"]').val()){
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
		if($('input[name="pwd"]').val() != $('input[name="pwd2"]').val()){
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

function allCk(){
	if(!checkEmail){
		alert("이메일 중복체크하세요.");
		f.email.focus();
		return false;
	}
	if(!checkPwd){
		alert("비밀번호를 확인하세요.");
		f.pwd2.focus();
		return false;
	}
	
}
</script>
<body>
userRegisterForm.jsp
<div class="all">
<form:form commandName="tubean" name="f" method="post" action="userRegisterForm.log" >
<input type="hidden" name="phone" value="${param.phone }">

<div class="div">
<label for="name">이름</label>
<input type="text" name="name" id="name" value="${tubean.name }" placeholder="이름을 입력해주세요.">
<form:errors path="name" cssClass="err" />
</div>

<div class="div">
<label for="email">이메일</label> 
<input type="text" name="email" id="email" value="${tubean.email }" placeholder="이메일을 입력해주세요.">
<font id="checkMsg"></font>
<form:errors path="email" cssClass="err" />

<input type="button" class="confirm" name="confirm" value="중복확인">

</div>


<div class="div">
<label for="pwd">비밀번호</label>  
<input type="text" name="pwd" id="pwd" value="${tubean.pwd }" placeholder="비밀번호를 입력해주세요.">
<form:errors path="pwd" cssClass="err" />
</div>


<div class="div">
<label for="pwd2">비밀번호 확인</label> 
<input type="text" name="pwd2" id="pwd2" value="${param.pwd2 }" placeholder="비밀번호를 입력해주세요.">
<font id="pwdMsg" class="err"></font>
</div>


<input type="submit" value="회원가입" onclick="return allCk()">
<input type="reset" name="" value="다시입력">
</form:form>
</div>
</body>
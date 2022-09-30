<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>  
<%@ include file="../common/common.jsp" %>
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//이메일체크
	checkEmail = false;
	//비번일치체크
	checkPwd = false;
	//사업자번호일치체크
	checkCnum = false;
	//정규표현식(숫자만)
	var rex = /^\d{2,12}$/;

$("input[name='confirm']").click(function(){
	$.ajax({
        url: "ajax2.log",
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
});//ajaxEmail

$("input[name='confirm2']").click(function(){
	if(!rex.test($("input[name='cnum']").val())){
		$("#cnumMsg").text("12자리이하 숫자만 입력하세요.");
		$("#cnumMsg").css("color","red");
		$("#cnumMsg").show();
		$("input[name='cnum']").focus();
		checkCnum = false;
		return;
	}
	$.ajax({
        url: "ajax3.log",
        type: "POST",
        data: {
        	cnum : $("input[name='cnum']").val()
        },
        success: function(data){
        	if(data == "ok"){
        		$("#cnumMsg").text("사용가능한 번호입니다.");
        		$("#cnumMsg").css("color","green");
        		$("#cnumMsg").show();
        		checkCnum = true;
        	}else if(data == "fail"){
        		$("#cnumMsg").text("중복된 번호입니다.");
        		$("#cnumMsg").css("color","red");
        		$("#cnumMsg").show();
        		checkCnum = false;
        	}else if(data == "leng") {
        		$("#cnumMsg").text(" 12자리 이하로 입력해주세요.");
        		$("#cnumMsg").css("color","red");
        		$("#cnumMsg").show();
        		checkCnum = false;
        	}else {
        		$("#cnumMsg").text(" 사업자 번호를 입력하세요.");
        		$("#cnumMsg").css("color","red");
        		$("#cnumMsg").show();
        		checkCnum = false;
        	}
        },
        error: function(jqxhr, textStatus, errorThrown){
            alert("err");
            console.log(jqxhr);
            console.log(textStatus);
            console.log(errorThrown);
        }
  	});
});//ajaxCompany
	
//email 입력시 err 사라짐
$('input[name="email"]').keydown(function(){
	$("#checkMsg").hide();
	checkEmail = false;
});
//cnum 입력시 err 사라짐
$('input[name="cnum"]').keydown(function(){
	$("#cnumMsg").hide();
	checkCnum = false;
});

$('input[name="pwd"]').add('input[name="pwd2"]').on({
	keyup: function(){
	if($('input[name="pwd"]').val() != "" && $('input[name="pwd2"]').val() != ""){
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
	},
	click: function(){
		if($('input[name="pwd"]').val() != "" && $('input[name="pwd2"]').val() != ""){
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
	if($('input[name="email"]').val() == ""){
		$("#checkMsg").show();
		$('#checkMsg').text("이메일을 입력하세요");
		f.email.focus();
		return false;
	}
	
	if($('input[name="pwd"]').val() == ""){
		$('#pwdMsg').text("비밀번호를 입력하세요");
		f.pwd.focus();
		return false;
	}else{
		$('#pwdMsg').text("");
	}
	
	if($('input[name="pwd2"]').val() == ""){
		$('#pwd2Msg').text("비밀번호를 입력하세요");
		f.pwd2.focus();
		return false;
	}else{
		$('#pwd2Msg').text("");
	}
	
	if($('input[name="cnum"]').val() == ""){
		$('#cnumMsg').text("사업자번호를 입력하세요");
		f.cnum.focus();
		return false;
	}else{
		$('#cnumMsg').text("");
	}
	
	if($('input[name="upload"]').val() == ""){
		$('#imgMsg').text("이미지를 넣어주세요");
		return false;
	}else{
		$('#imgMsg').text("");
	}
	
	
	
	//이메일 중복체크
	if(!checkEmail){
		alert("이메일 중복체크하세요.");
		f.email.focus();
		return false;
	}
	
	//사업자 중복체크
	if(!checkCnum){
		alert("사업자번호를 확인하세요.");
		f.cnum.focus();
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
<form:form commandName="tcbean" name="f" method="post" action="ownerRegisterForm.log" enctype="multipart/form-data" >
<input type="hidden" name="phone" value="${param.phone }">

<div class="div">
<label for="email">이메일</label> 
<input type="text" name="email" id="email" value="${tcbean.email }" placeholder="이메일을 입력해주세요.">
<form:errors path="email" cssClass="err" />
<font id="checkMsg"></font>
<input type="button" class="confirm" name="confirm" value="중복확인">
</div>

<div class="div">
<label for="pwd">비밀번호</label>  
<input type="password" name="pwd" id="pwd" value="${tcbean.pwd }" placeholder="비밀번호를 입력해주세요.">
<font id="pwdMsg" ></font>
</div>



<div class="div">
<label for="pwd2">비밀번호 확인</label> 
<input type="password" name="pwd2" id="pwd2" value="${param.pwd2 }" placeholder="비밀번호를 입력해주세요.">
<font id="pwd2Msg" ></font>
</div>



<div class="div">
<label for="cnum">사업자 번호</label> 
<input type="text" name="cnum" id="cnum" value="${tcbean.cnum }" placeholder="사업자번호를 입력해주세요.">
<font id="cnumMsg" ></font>
<input type="button" class="confirm2" name="confirm2" value="중복확인">
</div>



<div class="div">
<label for="upload">사업자등록증 이미지</label> 
<input type="file" name="upload" id="upload" value="">
<font id="imgMsg"></font>
</div>

<input type="submit" value="회원가입" onclick="return allCk()" class="custom-btn btn-5">
<input type="reset" value="다시입력" class="custom-btn btn-5">
</form:form>
</div>
</body>

<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
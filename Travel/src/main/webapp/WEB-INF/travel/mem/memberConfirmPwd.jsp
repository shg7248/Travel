<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>  
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">
<%@include file="./memberList.jsp" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	
});//ready
	function checkPwd(){
		$.ajax({
	        url: "ajax.mem",
	        type: "POST",
	        data: {
	        	pwd : $("#pwd").val()
	        },
	        success: function(data){
	        	if(data == "ok"){
	        		if(confirm("회원탈퇴를 하시겠습니까.")){
	        			f.submit();
	        		}
	        	}else if(data == "fail"){
	        		$(".checkMsg").text("비밀번호가 틀립니다.");
	        		$(".checkMsg").show();
	        	}else{
	        		$(".checkMsg").text("비밀번호를 입력하세요.");
	        		$(".checkMsg").show();
	        	}
	        },
	        error: function(){
	            alert("err");
	        }
		});
	}
</script>
<body>
<div class="all">
<h2>회원 탈퇴</h2>
	<form action="confirm.mem" method="post" name="f">
		<div class="div">
			<label for="">비밀번호 확인</label>
			<input type="text" name="pwd" id="pwd" placeholder="비밀번호를 입력해주세요">
			<font class="checkMsg"></font>
		</div>
		<input type="button" value="확인" onclick="checkPwd()">
	</form>
</div>
</body>
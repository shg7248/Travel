<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>  
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">
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
<%@ include file="/WEB-INF/travel/common/layout/mem/memberList.jsp" %>  
<div class="contents">
	<form action="confirm.mem" method="post" name="f" class="center">
		<!-- 소셜로그인이 아니면 -->
		<c:if test="${userInfo.flatform eq 'home' }">
			<div class="div">
			<h2>회원 탈퇴</h2>
				<label for="pwd">비밀번호 확인</label>
				<input type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력해주세요">
				<font class="checkMsg"></font>
			</div>
			<input type="button" value="확인" onclick="checkPwd()">
		</c:if>
		<!-- 소셜로그인이면 -->
		<c:if test="${userInfo.flatform ne 'home' }">
			<input type="submit" value="탈퇴하기">
		</c:if>
	</form>
</div>
</div>
</body>

<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>

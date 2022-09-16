<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">
<%@include file="./memberList.jsp" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//정규표현식(숫자만)
	var rex = /^\d+$/;
	
	$('input[name="accnum"]').keyup(function(){
		if(!rex.test($('input[name="accnum"]').val())){
			$('.err').show();
			$('.err').text('숫자만 입력가능합니다.');
			$('input[name="accnum"]').val('');
		}else{
			$('.err').hide();
		}
	});
	
});
function checkAll(){
	if($('select[name="bank"]').val() == "선택"){
		alert("결제수단을 선택해주세요.");
		return false;
	}
	
	if($('input[name="accnum"]').val() == ""){
		alert("계좌번호를 입력해주세요.");
		return false;
	}
}
</script>
<body>
<h2> 무통장 입금 계좌번호를 등록해주세요.</h2>
<form action="memberAccount.mem" method="post" name="f">
<select name="bank" >
	<option value="선택">결제수단 선택</option>
	<c:set value="${fn:split('국민|신한|기업|농협','|') }" var="bankArr"/>
	<c:forEach items="${bankArr }" var="bank">
	<option value="${bank}">${bank}</option>
	</c:forEach>
</select>
<input type="text" name="accnum" placeholder="계좌번호 - 없이 입력">
<font class="err"></font>
<input type="submit" value="등록" onclick="return checkAll()">
</form>

<h2>등록되어있는 계좌목록</h2>
<c:forEach items="${lists }" var="tabean">
${tabean.bank }, ${tabean.accnum }
</c:forEach>
</body>
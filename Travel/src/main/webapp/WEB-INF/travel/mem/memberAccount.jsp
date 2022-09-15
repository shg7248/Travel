<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<h2> 무통장 입금 계좌번호를 등록해주세요.</h2>
<body>
<form action="memberAccount.mem" method="post" name="f">
<select name="bank">
	<option value="">결제수단 선택</option>
	<c:set value="${fn:split('국민|신한|기업|농협','|') }" var="bankArr"/>
	<c:forEach items="${bankArr }" var="bank">
	<option value="${bank}">${bank}</option>
	</c:forEach>
</select>
<input type="text" name="accnum" placeholder="계좌번호 - 없이 입력">
<input type="submit" value="등록">
</form>

<h2>등록되어있는 계좌목록</h2>
<c:forEach items="${lists }" var="tabean">
${tabean.bank }, ${tabean.accnum }
</c:forEach>
</body>
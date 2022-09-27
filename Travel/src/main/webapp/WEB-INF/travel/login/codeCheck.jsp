<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">
    
<div class="all">
<div class="one height">
<h2>인증번호 입력</h2>
<form action="checkVcode.log" method="post">
	<div class="div">
	<label>인증번호 입력</label>
	<input type="text" name="inputvcode" placeholder="인증번호6자리 입력" maxlength="6">
	<input type="submit" name="checkvcode" value="인증번호 확인">
	</div>
	<%
	out.println("<script type='text/javascript'>");
	out.println("alert('인증번호를 발송하였습니다.'); ");
	out.println("</script>");
	%>
</form>
</div>
</div>

<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
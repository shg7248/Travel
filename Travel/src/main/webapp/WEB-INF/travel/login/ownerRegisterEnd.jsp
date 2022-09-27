<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %> 
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet"> 
<div class="all">
<div class="one height">
<h2>회원가입 승인요청이 완료되었습니다.</h2>
<input type="button" value="메인으로" onclick="location.href='<%= request.getContextPath() %>/'">
<input type="button" value="로그인" onclick="location.href='ownerLoginForm.log'">
</div>
</div>

<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
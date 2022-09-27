<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %> 
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet"> 
<div class="all">
<div class="one height">
<h2>회원가입이 완료되었습니다.</h2>
<h6> 마일리지 200포인트 추가되셨습니다.</h6>
<div class="div">
<input type="button" value="메인으로" onclick="location.href='<%= request.getContextPath() %>/'">
<input type="button" value="로그인" onclick="location.href='userLoginForm.log'">
</div>
</div>
</div>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
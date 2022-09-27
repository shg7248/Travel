<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">
<body>
<div class="all">
<div class="one height">
	<h2>회원님의 비밀번호는 다음과 같습니다.</h2><br>
	<h3>${myPwd }</h3>
</div>
</div>
</body>

<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
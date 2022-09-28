<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %> 
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">
<%@ include file ="../common/common.jsp" %>

<div class="all">
<%@ include file ="Main.jsp" %>
<div class="contents">
<h2>사업자 승인 페이지</h2>

<img src="<%= request.getContextPath() %>/resources/images/사업자등록증/${appr.image }"> 
<a href="https://teht.hometax.go.kr/websquare/websquare.html?w2xPath=/ui/ab/a/a/UTEABAAA13.xml">[사업자등록상태 조회 바로가기]</a>
<form method="post" action="Comapprove.admin?cnum=${appr.cnum}" enctype="multipart/form-data">

	<input type="submit" value="승인하기" id="BtnSubmit">		
</form>
</div>
</div>

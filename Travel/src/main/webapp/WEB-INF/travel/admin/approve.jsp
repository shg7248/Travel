<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %> 
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">
<%@ include file ="../common/common.jsp" %>

<div class="all">
<%@ include file ="Main.jsp" %>
<style>
	.wrap {
		width: 100%;
	}
	
	.wrap__sa{
		width: 100%;
	}
</style>
<div class="contents">
<h2>사업자 승인 페이지</h2>
<div class="wrap">
	<img class="wrap__sa" src="<%= request.getContextPath() %>/resources/images/company/${appr.image }"> 
</div>
<div style="text-align: center;">
	<a href="https://teht.hometax.go.kr/websquare/websquare.html?w2xPath=/ui/ab/a/a/UTEABAAA13.xml">[사업자등록상태 조회 바로가기]</a>
</div>
<form method="post" action="Comapprove.admin?cnum=${appr.cnum}" enctype="multipart/form-data">

	<input type="submit" value="승인하기" id="BtnSubmit">		
</form>
</div>
</div>

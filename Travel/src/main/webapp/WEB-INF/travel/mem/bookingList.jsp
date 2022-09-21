<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>  
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">
<div class="all">
<%@include file="./memberList.jsp" %>
<br>
숙소명/객실명/날짜/가격/결제일
<br>
<c:forEach items="${lists }" var="list">
${list.aname }
${list.rname }
${list.startDate } ~ ${list.endDate }
${list.price }
${list.oDate }
/예약상태/리뷰쓰기버튼
</c:forEach>
</div>
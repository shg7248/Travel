<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">
bookingList
<%@include file="./memberList.jsp" %>
숙소명/객실명/날짜/가격/결제일

<c:forEach items="${lists }" var="list">
${list.aname }
${list.rname }
${list.startDate } ~ ${list.endDate }
${list.price }
${list.oDate }
/예약상태/리뷰쓰기버튼
</c:forEach>
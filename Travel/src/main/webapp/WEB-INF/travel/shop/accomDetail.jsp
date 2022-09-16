<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>

${accom.name }

<br><br><br><br><br><br>
<h2>객실목록</h2>
<br><br><br>
<c:forEach var="room" items="${lists }">
	<div>
		${room.name }
		<a href="${contextPath }/shop/order.shop?rnum=${room.rnum }&startDate=${start }&endDate=${end }">예약하기</a>
	</div>
</c:forEach>
<br><br><br>
<h2>후기</h2>
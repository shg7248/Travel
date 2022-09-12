<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/common.jsp" %>

${accom.name }

<br><br><br><br><br><br>
<h2>객실목록</h2>
<br><br><br>
<c:forEach var="room" items="${lists }">
	<div>
		${room.name }
		<a href="reserve.shop?rnum=${room.rnum }&start=${start }&end=${end }">예약하기</a>
	</div>
</c:forEach>
<br><br><br>
<h2>후기</h2>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/travel/common/common.jsp"%>
<%@include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>

eventList.jsp<br>
<c:forEach items="${list }" var="board1">
	<table border="1">
		<tr>
			<th><a href="eventdetail.brd?nnum=${board1.nnum }">${board1.subject }</a></th>
		</tr>
	</table>
</c:forEach>
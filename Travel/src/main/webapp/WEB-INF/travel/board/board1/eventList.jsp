<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/travel/common/common.jsp"%>
<%@include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>

eventList.jsp<br>
<center>
	<h2>이벤트</h2>
<c:forEach items="${list }" var="board1">
	<table border="1" width="800">
		<tr>
			<th><a href="eventdetail.brd?nnum=${board1.nnum }&pageNumber=${pageInfo.pageNumber}">${board1.subject }</a></th>
		</tr>
	</table>
</c:forEach>
${pageInfo.pagingHtml }
</center>
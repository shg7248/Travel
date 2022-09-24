<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/travel/common/common.jsp"%>
<%@include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>
<link rel="stylesheet" href="${contextPath }/resources/css/board.css">

<div class="default">
<%@include file="/WEB-INF/travel/board/board1/boardList.jsp" %>
<div class="contents">
	<h2>이벤트</h2>
	<table>
		<c:if test="${email eq 'admin' }">
		<tr>
			<td align="right">
				<input type="button" value="추가하기" onclick="location.href='insertevent.brd'">
			</td>
		</tr>
		</c:if>
		<c:forEach items="${list }" var="board1">
		<tr>
			<td class="title_td">
				<a href="eventdetail.brd?nnum=${board1.nnum }&pageNumber=${pageInfo.pageNumber}">${board1.subject }</a>
			</td>
		</tr>
		</c:forEach>
	</table>
${pageInfo.pagingHtml }
</div>
</div>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
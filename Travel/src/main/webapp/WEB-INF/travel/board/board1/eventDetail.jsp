<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/travel/common/common.jsp"%>
<%@include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>
<link rel="stylesheet" href="${contextPath }/resources/css/board.css">
<style>
.eventimg{
	width: 700px;
	height: auto;
}
</style>
<div class="default">
<%@include file="/WEB-INF/travel/board/board1/boardList.jsp" %>
<div class="contents">
<table>
	<tr>
		<td>${bb.subject }</td>
	</tr>
	<tr>
		<td><img class="eventimg" src="<%=request.getContextPath()%>/resources/board1/${bb.content}"></td>
	</tr>
	<tr align="right">
		<td>
			<c:set var="email" value='<%=(String)session.getAttribute("email") %>'/>
			<c:if test="${email eq 'admin' }">
				<input type="button" value="수정" onclick="location.href='eventupdate.brd?nnum=${bb.nnum}&pageNumber=${pageNumber}'">
				<input type="button" value="삭제" onclick="location.href='eventdelete.brd?nnum=${bb.nnum}'">
			</c:if>
			<input type="button" value="목록보기" onclick="location.href='eventlist.brd?pageNumber=${pageNumber}'">
		</td>
	</tr>
</table>
</div>
</div>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/travel/common/common.jsp"%>
<%@include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>

eventDetail.jsp<br>
<table>
	<tr>
		<td>${bb.subject }</td>
	</tr>
	<tr>
		<td><img src="<%=request.getContextPath()%>/resources/board1/${bb.content}"></td>
	</tr>
	<tr align="right">
		<td>
			<c:set var="email" value='<%=(String)session.getAttribute("email") %>'/>
			<c:if test="${email eq 'admin' }">
				<input type="button" value="수정" onclick="location.href='eventupdate.brd?nnum=${bb.nnum}'">
				<input type="button" value="삭제" onclick="location.href='eventdelete.brd?nnum=${bb.nnum}'">
			</c:if>
			<input type="button" value="목록보기" onclick="location.href='eventlist.brd'">
		</td>
	</tr>
</table>
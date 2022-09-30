<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/travel/common/common.jsp"%>
<%@include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>
<link rel="stylesheet" href="${contextPath }/resources/css/board.css">

<div class="default">
<%@include file="/WEB-INF/travel/board/board1/boardList.jsp" %>
<div class="contents">
<h2>공지사항</h2>
<table>
	<tr>
		<td class="title_td title">
		${bb.subject }
		<span class="written-date">
			<fmt:parseDate var="date" value="${bb.reg_date }" pattern="yyyy-MM-dd" />
			<fmt:formatDate var="reg_date" value="${date }" pattern="yyyy.MM.dd" /> ${reg_date }
		</span>
		</td>
	</tr>
	<tr>
		<td class="inner_td">
			<pre class="pre_content" style="word-wrap: break-word; white-space: pre-wrap;">${bb.content}</pre>
		</td>
	</tr>
</table>
<div class="right_button">
	<c:set var="email" value='<%=(String)session.getAttribute("email") %>'/>
	<c:if test="${email eq 'admin' }">
		<input type="button" value="수정" onclick="location.href='noticeupdate.brd?nnum=${bb.nnum}&pageNumber=${pageNumber}'">
		<input type="button" value="삭제" onclick="location.href='noticedelete.brd?nnum=${bb.nnum}'">
	</c:if>
	<input type="button" value="목록보기" onclick="location.href='noticelist.brd?pageNumber=${pageNumber}'">
</div>
</div>
</div>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
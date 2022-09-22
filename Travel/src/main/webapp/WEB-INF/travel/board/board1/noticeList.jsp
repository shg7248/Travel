<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/travel/common/common.jsp"%>
<%@include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>
<link rel="stylesheet" href="${contextPath }/resources/css/board.css">

<style>
.notice_title{
	cursor : pointer;
}
.notice_contents{
	display : none;
}
</style>

<script>
$(document).ready(function(){
	$('.notice_title').click(function(){
		$(this).next().toggle();
	});
});
</script>

<div class="default">
<div class="contents">
	<h2>공지사항</h2>
	<form>
	<table>
		<c:if test="${email eq 'admin' }">
		<tr>
			<td align="right">
				<input type="button" value="추가하기" onclick="location.href='insertnotice.brd'">
			</td>
		</tr>
		</c:if>
	<c:forEach items="${list }" var="board1">
		<tr class="notice_title">
			<td class="title_td title">${board1.subject }</td>
		</tr>
		<tr class="notice_contents">
			<td class="inner_td">
				<pre style="word-wrap: break-word; white-space: pre-wrap;">${board1.content}</pre>
				<c:set var="email" value='<%=(String)session.getAttribute("email") %>'/>
				<c:if test="${email eq 'admin' }">
				<div align="right">
				<input type="button" value="수정" onclick="location.href='noticeupdate.brd?nnum=${board1.nnum}&pageNumber=${pageInfo.pageNumber }'">
				<input type="button" value="삭제" onclick="location.href='noticedelete.brd?nnum=${board1.nnum}'">
				</div>
				</c:if>
			</td>
		</tr>
	</c:forEach>
	</table>
	</form>
${pageInfo.pagingHtml }
</div>
</div>
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
		<c:forEach items="${list }" var="board1">
		<tr>
			<td class="title_td">
				<a class="title" href="noticedetail.brd?nnum=${board1.nnum }&pageNumber=${pageInfo.pageNumber}">
					<c:if test="${fn:length(board1.subject)>=30 }">
					${fn:substring(board1.subject,0,30)}...
					</c:if>
					<c:if test="${fn:length(board1.subject)<30 }">
					${board1.subject }
					</c:if>
				</a>
				<span class="written-date">
					<fmt:parseDate var="date" value="${board1.reg_date }" pattern="yyyy-MM-dd" />
					<fmt:formatDate var="reg_date" value="${date }" pattern="yyyy.MM.dd" /> ${reg_date }
				</span>
			</td>
		</tr>
		</c:forEach>
	</table>
${pageInfo.pagingHtml }
<div class="right_button">
<c:if test="${email eq 'admin' }">
		<input type="button" value="추가하기" onclick="location.href='insertnotice.brd'">
</c:if>
</div>
</div>
</div>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
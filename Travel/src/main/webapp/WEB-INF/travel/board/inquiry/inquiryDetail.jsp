<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/travel/common/common.jsp"%>
<%@include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>
<link rel="stylesheet" href="${contextPath }/resources/css/board.css">

<div class="default">
<div class="contents">
<h2>1:1 문의사항</h2>
<table class="inquirytable">
	<tr>
		<td align="center" width="12%" class="inquiry_color">제목</td>
		<td width="90%" colspan="5">${ib.subject }</td>
	</tr>
	<tr>
		<td align="center" width="8%" class="inquiry_color">작성자</td>
		<td align="center" width="10%">${ib.email }</td>
		<td align="center" width="20%">작성일</td>
		<td align="center" width="20%">
			<fmt:parseDate var="date1" value="${ib.reg_date1 }" pattern="yyyy-MM-dd" />
			<fmt:formatDate var="reg_date1" value="${date1 }" pattern="yyyy-MM-dd" /> ${reg_date1 }
		</td>
		<td align="center" width="20%">답변일</td>
		<td align="center" width="20%">
			<fmt:parseDate var="date2" value="${ib.reg_date2 }" pattern="yyyy-MM-dd" />
			<fmt:formatDate var="reg_date2" value="${date2 }" pattern="yyyy-MM-dd" /> ${reg_date2 }
		</td>
	</tr>
	<tr height="300">
		<td align="center" width="10%" class="inquiry_color">내용</td>
		<td width="90%" colspan="5"><pre class="pre_content">${ib.question }</pre></td>
	</tr>
	<tr height="300">
		<td align="center" width="10%" class="inquiry_color">답변</td>
		<td width="90%" colspan="5"><pre class="pre_content">${ib.answer }</pre></td>
	</tr>
</table>
<div class="right_button">
	<c:set var="email1" value='<%= String.valueOf(session.getAttribute("email")) %>'/>
	<c:if test="${email1 eq 'admin' }">
		<input type="button" value="답변하기" onclick="location.href='inqanswer.brd?inum=${ib.inum }&pageNumber=${pageNumber}'">
	</c:if>
	<c:if test="${email1 eq 'admin' || email1 eq ib.email}">
		<input type="button" value="삭제" onclick="location.href='inqdelete.brd?inum=${ib.inum }'">
	</c:if>
	<input type="button" value="목록보기" onclick="location.href='inqlist.brd?pageNumber=${pageNumber}'">
</div>
</div>
</div>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
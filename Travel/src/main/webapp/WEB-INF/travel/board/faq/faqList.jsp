<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/travel/common/common.jsp"%>
<%@include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>

faqList.jsp<br>

<center>
	<form action="faqlist.brd" method="post">
		<select name="whatColumn">
			<option value="">전체 검색</option>
			<option value="question" <c:if test="${whatColumn eq 'question' }">selected</c:if>>제목</option>
			<option value="answer" <c:if test="${whatColumn eq 'answer' }">selected</c:if>>내용</option>
		</select>
		<input type="text" name="keyword" value="${keyword }">
		<input type="submit" value="검색">
	</form>
	
	<h2>자주 묻는 질문 FAQ</h2>
	<table border="1">
		<tr>
			<td align="right" height="50">
			<c:if test="${email eq 'admin' }">
				<input type="button" value="추가하기" onclick="location.href='faqinsert.brd'">
			</c:if>
			</td>
		</tr>
	</table>
	<c:forEach var="faq" items="${lists }">
		<table border="1" width="800">
			<tr height="50">
				<td>${faq.question }</td>
			</tr>
			<tr>
				<td><pre style="word-wrap: break-word; white-space: pre-wrap;">${faq.answer }</pre></td>
			</tr>
			<c:if test="${email eq 'admin' }">
			<tr>
				<td align="right" height="50">
					<input type="button" value="수정하기" onclick="location.href='faqupdate.brd?fnum=${faq.fnum}'">
					<input type="button" value="삭제하기" onclick="location.href='faqdelete.brd?fnum=${faq.fnum}'">
				</td>
			</tr>
			</c:if>
		</table>
	</c:forEach>
</center>
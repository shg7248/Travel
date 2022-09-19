<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/travel/common/common.jsp"%>
<%@include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>

inquiryAnswerForm.jsp
<br>
<center>
<form method="post" action="inqanswer.brd">
<input type="hidden" name="inum" value="${ib.inum }">
	<table border="1" height="800" width="800">
		<tr>
			<td align="center" width="10%">제목</td>
			<td align="center" width="90%" colspan="5">${ib.subject }</td>
		</tr>
		<tr>
			<td align="center" width="10%">작성자</td>
			<td align="center" width="10%">${ib.email }</td>
			<td align="center" width="20%">작성일</td>
			<td align="center" width="20%">
				<fmt:parseDate var="date1" value="${ib.reg_date1 }" pattern="yyyy-MM-dd" />
				<fmt:formatDate var="reg_date1" value="${date1 }" pattern="yyyy-MM-dd" /> ${reg_date1 }
			</td>
			<td align="center" width="20%">답변일</td>
			<td align="center" width="20%">
				 <input type="date" name="reg_date2">
			</td>
		</tr>
		<tr height="300">
			<td align="center" width="10%">내용</td>
			<td align="center" width="90%" colspan="5">${ib.question }</td>
		</tr>
		<tr height="300">
			<td align="center" width="10%">답변</td>
			<td align="center" width="90%" colspan="5">
				<textarea name="answer" rows="13" cols="50" style="resize:none">${ib.answer }</textarea>
			</td>
		</tr>
		<tr>
			<td align="right" colspan="6">
				<c:set var="email" value='<%= String.valueOf(session.getAttribute("email")) %>'/>
				<c:if test="${email eq 'admin' }">
					<input type="submit" value="답변하기">
					<input type="button" value="삭제" onclick="location.href='inqdelete.brd'">
				</c:if>
				<input type="button" value="목록보기" onclick="location.href='inqlist.brd?pageNumber=${pageInfo.pageNumber}'">
			</td>
		</tr>
	</table>
</form>
</center>
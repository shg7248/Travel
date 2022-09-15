<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/travel/common/common.jsp"%>
inquiryList.jsp<br>
<%-- 
<center>
	<form action="list.brd" method="post">
		<select name="whatColumn">
			<option value="">전체 검색</option>
			<option value="subject" <c:if test="${pageInfo.whatColumn eq 'subject' }">selected</c:if>>제목</option>
			<option value="writer" <c:if test="${pageInfo.whatColumn eq 'writer' }">selected</c:if>>작성자</option>
		</select>
		<input type="text" name="keyword" value="${pageInfo.keyword }">
		<input type="submit" value="검색">
	</form>
</center>
 --%>
<center>
<h2>1:1문의 사항</h2>
<table border="1" height="800" width="800">
	<tr height="50">
		<td align="center" width="10%">번호</td>
		<td align="center" width="50%">제목</td>
		<td align="center" width="10%">작성자</td>
		<td align="center" width="15%">작성일</td>
		<td align="center" width="15%">답변상황</td>
	</tr>
	<c:if test="${empty lists }">
		<tr>
			<td colspan="5">문의 내역이 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${!empty lists }">
		<c:forEach items="${lists }" var="inquiry" varStatus="status">
			<tr align="center">
				<td>${inquiry.inum }</td>
				<td><a href="inqdetail.brd?inum=${inquiry.inum }">${inquiry.subject }</a></td>
				<td>${inquiry.email}</td>
				<td>
					<fmt:parseDate var="date" value="${inquiry.reg_date1 }" pattern="yyyy-MM-dd" />
					<fmt:formatDate var="reg_date" value="${date }" pattern="yyyy-MM-dd" /> ${reg_date }
				</td>
				<td>${inquiry.progress }</td>
			</tr>
		</c:forEach>
			<tr>
				<td align="right" colspan="5" height="50">
					<c:set var="email" value='<%= String.valueOf(session.getAttribute("email")) %>'/>
					<c:if test="${email ne 'admin' }">
						<input type="button" value="문의하기" onclick="location.href='inqinsert.brd'">
					</c:if>
				</td>
			</tr>
	</c:if>
</table>
</center>
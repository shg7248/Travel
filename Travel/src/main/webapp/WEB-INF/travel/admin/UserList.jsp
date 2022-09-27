<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">
memberList.jsp<br>
<%@ include file ="../common/common.jsp" %>

<style>
	table {
		border: 1px solid black;
	}
</style>

<div class="all">
<%@ include file ="Main.jsp" %>
<div class="contents">
<h2>회원관리(사용자)</h2>
<form action="Ulist.admin" method="get">
	   	<select name="whatColumn">
	   		<option value="">전체검색</option>
	   		<option value="name">이름</option>
	   		<option value="phone">핸드폰 번호</option>
	   	</select>
	   	<input type="text" name="keyword">
	   	<input type="submit" value="검색">
   </form>
   
   총회원수 : ${fn:length(lists) }
   
   	<table border="1">
   		<tr>
   			<td>번호</td>
   			<td>이름</td>
   			<td>이메일</td>
   			<td>핸드폰번호</td>
   			<td>등록일</td>
   			<td>삭제</td>
   		</tr>
   		<c:forEach items="${lists}" var="u">
	   		<tr>
	   			<td>${u.mnum }</td>
	   			<td>${u.name }</td>
	   			<td>${u.email }</td>
	   			<td>${u.phone }</td>
	   			<td>
	   			
	   			<fmt:parseDate var="formattedDay" value="${u.reg_date }" pattern="yyyy-MM-dd"/>
				<fmt:formatDate var="newformattedDay" value="${formattedDay }" pattern="yyyy-MM-dd"/>
				${newformattedDay }
	   			
	   			</td>
	   			<td><a href="Udele.admin?mnum=${u.mnum }&pageNumber=${pageInfo.pageNumber}">삭제</a></td>
	   		</tr>
		</c:forEach>
	</table>
	${pageInfo.pagingHtml}
	</div>
</div>
	
	
	
	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %> 
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">
<%@ include file ="../common/common.jsp" %>

<div class="all">
<%@ include file ="Main.jsp" %>
<div class="contents">
<div class="div">
<h2>회원관리(사용자)</h2>
</div>
			<form action="Ulist.admin" method="get">
		<div id="right">
		
			   	<select name="whatColumn">
			   		<option value="">전체검색</option>
			   		<option value="name">이름</option>
			   		<option value="phone">핸드폰 번호</option>
			   	</select>
			   	<input type="text" name="keyword">
			   	<input type="submit" value="검색">
	   	</div>
		   </form>

	
   총 사용자 수 : ${pageInfo.totalCount}
   
   	<table border="1">
   		<tr>
   			<th>번호</th>
   			<th>이름</th>
   			<th>이메일</th>
   			<th>핸드폰번호</th>
   			<th>등록일</th>
   			<th>삭제</th>
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
	   			<td><a href="Udele.admin?mnum=${u.mnum }&pageNumber=${pageInfo.pageNumber}"><font color="#DC143C">삭제</font></a></td>
	   		</tr>
		</c:forEach>
<tr>
	<td colspan="100%">
		${pageInfo.pagingHtml }
	</td>
</tr>
	</table>
	
	</div>
</div>
	
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
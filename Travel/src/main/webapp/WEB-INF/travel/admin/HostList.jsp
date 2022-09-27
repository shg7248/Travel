<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %> 
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">
<%@ include file ="../common/common.jsp" %>
<div class="all">
<%@ include file ="Main.jsp" %>
<div class="contents">
	<div class="div">
	<h2>회원관리(사업자)</h2>
	<form action="Hlist.admin" method="get">
		   	<select name="whatColumn">
		   		<option value="">전체검색</option>
		   		<option value="cnum">사업자등록번호</option>
		   		<option value="email">이메일</option>
		   	</select>
		   	<input type="text" name="keyword">
		   	<input type="submit" value="검색">
	</form>
	</div>
   총 사업체수 : ${fn:length(lists) }
   
   	<table border="1">
   		
   		<tr>
   			<th>사업자등록번호</th>
   			<th>사업자등록증</th>
   			<th>이메일</th>
   			<th>핸드폰번호</th>
   			<th>등록일</th>
   			<th>승인</th>
   			<th>삭제</th>
   		</tr>
   		
   		
   		<c:forEach items="${lists}" var="h">
		   	
		   		
   		<tr>
   			<td>${h.cnum }</td>
   			<td>${h.image }</td>
   			<td>${h.email }</td>
   			<td>${h.phone }</td>
   			<td>
   				<fmt:parseDate var="formattedDay" value="${h.reg_date }" pattern="yyyy-MM-dd"/>
				<fmt:formatDate var="newformattedDay" value="${formattedDay }" pattern="yyyy-MM-dd"/>
				${newformattedDay }
   			</td>
   				<td>
   				<c:choose>
   					<c:when test="${h.approyn==0 }">
   						<%-- <input type="button" value="승인확인" onclick="location.href='Comapprove.admin?cnum=${h.cnum}'"> --%>
   						<a href="='Comapprove.admin?cnum=${h.cnum}'">승인확인</a>
   					</c:when>
   				</c:choose>
   				
   				<c:choose>
   					<c:when test="${h.approyn==1 }">
   						승인
   					</c:when>
   				</c:choose>
   				
   				</td>
   				<td><a href="Hdele.admin?cnum=${h.cnum }&pageNumber=${pageInfo.pageNumber}">삭제</a></td>
   			</tr>
   	
	</c:forEach>
	</table>
	
	<div class="garo">
	${pageInfo.pagingHtml}
	</div>
</div>
</div>
	
	
	
	
	
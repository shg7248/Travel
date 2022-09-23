<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    HostList.jsp<br>
<%@ include file ="../common/common.jsp" %>
<%@ include file ="Main.jsp" %>
<style>
	table {
		border: 1px solid black;
	}
</style>    

<script>
	
</script>
<h2>회원관리(사업자)</h2>
<center>
<form action="Hlist.admin" method="get">
	   	<select name="whatColumn">
	   		<option value="">전체검색</option>
	   		<option value="cnum">사업자등록번호</option>
	   	</select>
	   	<input type="text" name="keyword">
	   	<input type="submit" value="검색">
</form>
   총 사업체수 : ${fn:length(lists) }
   
   	<table border="1">
   		
   		<tr>
   			<td>사업자등록번호</td>
   			<td>사업자등록증</td>
   			<td>이메일</td>
   			<td>핸드폰번호</td>
   			<td>등록일</td>
   			<td>승인</td>
   			<td>삭제</td>
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
   						<input type="button" value="승인확인" onclick="location.href='Comapprove.admin?cnum=${h.cnum}'">
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
	${pageInfo.pagingHtml}
	</center>
	
	
	
	
	
	
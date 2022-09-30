<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %> 
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">
<%@ include file ="../common/common.jsp" %>
<div class="all">
<%@ include file ="Main.jsp" %>
<div class="contents">
<h2>코드관리(시설)</h2>
<table border="1">

<tr>
	<th>번호</th>
	<th>시설그룹</th>
	<th>시설번호</th>
	<th>시설이름</th>
	<th>수정</th>
	<th>삭제</th>
</tr>

<c:forEach items="${lists }" var="f" >

<tr>
	<td>${f.fno }</td>
	<td>${f.fgroup }</td>
	<td>${f.fnum }</td>
	<td>${f.name}</td>
	<td><a href="Faciupdate.admin?fno=${f.fno }&pageNumber=${pageInfo.pageNumber}">수정</a></td>
	<td><a href="Facidele.admin?fno=${f.fno }&pageNumber=${pageInfo.pageNumber}"><font color="#DC143C">삭제</font></a></td>
</tr>
</c:forEach>
<tr>
	<td colspan="100%">
		${pageInfo.pagingHtml }
	</td>
</tr>

</table>
	
<input type="button" value="추가" onclick="location.href='Faciinsert.admin'">
</div>
</div>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
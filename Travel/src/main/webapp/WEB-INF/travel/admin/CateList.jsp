<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %> 
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">
<%@ include file ="../common/common.jsp" %>
<div class="all">
<%@ include file ="Main.jsp" %>
<div class="contents">
<h2>코드관리(카테고리)</h2>
<table border="1">

<tr>
	<th>카테고리 번호</th>
	<th>카테고리 이름</th>
	<th>카테고리 그룹</th>
	<th>URL</th>
	<th>수정</th>
	<th>삭제</th>
</tr>

<c:forEach items="${lists }" var="c" >

<tr>
	<td>${c.canum }</td>
	<td>${c.caname }</td>
	<td>${c.cagroup }</td>
	<td>${c.url }</td>
	<td><a href="Cateupdate.admin?canum=${c.canum }&pageNumber=${pageInfo.pageNumber}">수정</a></td>
	<td><a href="catedele.admin?canum=${c.canum }&pageNumber=${pageInfo.pageNumber}"><font color="#DC143C">삭제</font></a></td>
</tr>

</c:forEach>
		<tr>
			<td colspan="100%">
				${pageInfo.pagingHtml }
			</td>
		</tr>
</table>
<input type="button" value="추가" onclick="location.href='Cateinsert.admin'">
</div>
</div>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
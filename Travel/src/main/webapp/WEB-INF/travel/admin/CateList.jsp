<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
CategoryList.jsp<br>
<%@ include file ="../common/common.jsp" %>


<style>
	table {
		border: 1px solid black;
	}
</style> 
<input type="button" value="추가" onclick="location.href='Cateinsert.admin'">

<h2>코드관리(카테고리)</h2>
<center>
<table border="1">

<tr>
	<td>카테고리 번호</td>
	<td>카테고리 이름</td>
	<td>카테고리 그룹</td>
	<td>URL</td>
	<td>수정</td>
	<td>삭제</td>
</tr>

<c:forEach items="${lists }" var="c" >

<tr>
	<td>${c.canum }</td>
	<td>${c.caname }</td>
	<td>${c.cagroup }</td>
	<td>${c.url }</td>
	<td><a href="Cateupdate.admin?canum=${c.canum }&pageNumber=${pageInfo.pageNumber}">수정</a></td>
	<td><a href="catedele.admin?canum=${c.canum }&pageNumber=${pageInfo.pageNumber}">삭제</a></td>
</tr>

</c:forEach>

</table>
${pageInfo.pagingHtml}
</center>




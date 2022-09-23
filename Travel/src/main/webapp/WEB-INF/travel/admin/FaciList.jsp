<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
FaciList.jsp<br>
<%@ include file ="../common/common.jsp" %>
<%@ include file ="Main.jsp" %>
<style>
	table {
		border: 1px solid black;
	}
</style>

<h2>코드관리(시설)</h2>
<center>
<table border="1">

<tr>
	<td>번호</td>
	<td>시설그룹</td>
	<td>시설번호</td>
	<td>시설이름</td>
	<td>수정</td>
	<td>삭제</td>
</tr>

<c:forEach items="${lists }" var="f" >

<tr>
	<td>${f.fno }</td>
	<td>${f.fgroup }</td>
	<td>${f.fnum }</td>
	<td>${f.fname}</td>
	<td><a href="Faciupdate.admin?fno=${f.fno }&pageNumber=${pageInfo.pageNumber}">수정</a></td>
	<td><a href="Facidele.admin?fno=${f.fno }&pageNumber=${pageInfo.pageNumber}">삭제</a></td>
</tr>

</c:forEach>

</table>
${pageInfo.pagingHtml}
<input type="button" value="추가" onclick="location.href='Faciinsert.admin'">
</center>

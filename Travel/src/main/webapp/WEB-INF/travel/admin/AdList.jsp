<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>광고 리스트</h2>
<center>
<table border="1">

<tr>
	<td>광고 이름</td>
	<td>광고 이미지</td>
	<td>광고 컨텐츠</td>
	<td>수정</td>
	<td>삭제</td>
</tr>

<c:forEach items="${lists }" var="a" >

<tr>
	<td>${a.adname }</td>
	<td>${a.adimage }</td>
	<td>${a.adcontents }</td>
	<td><a href="Adupdate.admin?adname=${a.adname }">수정</a></td>
	<td><a href="Addele.admin?adname=${a.adname }">삭제</a></td>
</tr>

</c:forEach>

</table>
${pageInfo.pagingHtml}
<input type="button" value="추가" onclick="location.href='Adinsert.admin'">
</center>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/travel/common/common.jsp"%>
<%@include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>

noticeList.jsp<br>
<style>
	th {
		cursor: pointer;
	}
	.content{
		display: none;
	}
	.content.on {
		display: block;
	}
</style>
<script>
	function tempclick(a) {
		a.parentNode.nextElementSibling.classList.toggle('on');
	}
</script>

<center>
		<h2>공지사항</h2>
<c:forEach items="${list }" var="board1">
	<form>
		<table border="1" width="800">
			<tr>
				<th onclick="tempclick(this)"><a>${board1.subject }</a></th>
			</tr>
			<tr class="content">
				<td width="800">
					<pre style="word-wrap: break-word; white-space: pre-wrap;"><c:out value="${board1.content}" /></pre>
					<c:set var="email" value='<%=(String)session.getAttribute("email") %>'/>
					<c:if test="${email eq 'admin' }">
					<div align="right">
					<input type="button" value="수정" onclick="location.href='noticeupdate.brd?nnum=${board1.nnum}&pageNumber=${pageInfo.pageNumber }'">
					<input type="button" value="삭제" onclick="location.href='noticedelete.brd?nnum=${board1.nnum}'">
					</div>
					</c:if>
				</td>
			</tr>
		</table>
	</form>
</c:forEach>
${pageInfo.pagingHtml }
</center>
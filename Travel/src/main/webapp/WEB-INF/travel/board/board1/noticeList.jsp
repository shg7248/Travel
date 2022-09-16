<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/travel/common/common.jsp"%>
<%@include file="/WEB-INF/travel/common/layout/comp/header.jsp" %>

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
<c:forEach items="${list }" var="board1">
	<form>
			<table border="1">
				<tr>
					<th onclick="tempclick(this)"><a>${board1.subject }</a></th>
				</tr>
				<tr class="content">
					<td><pre><c:out value="${board1.content}" /></pre></td>
				</tr>
					<c:set var="email" value='<%=(String)session.getAttribute("email") %>'/>
				<c:if test="${email eq 'admin' }">
				<tr align="right" height="50">
					<td>
						<input type="button" value="수정" onclick="location.href='noticeupdate.brd?nnum=${board1.nnum}'">
						<input type="button" value="삭제" onclick="location.href='noticedelete.brd?nnum=${board1.nnum}'">
					</td>
				</tr>
				</c:if>
			</table>
	</form>
</c:forEach>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/travel/common/common.jsp"%>
noticeList.jsp<br>
<c:forEach items="${list }" var="board1">
	<form>
			<table border="1">
				<tr>
					<th>${board1.subject }</th>
				</tr>
				<tr>
					<td><pre><c:out value="${board1.content}" /></pre><br><br>
						<%-- 
						하단은 admin으로 로그인시 보이게
						<c:if test=""></c:if>
						 --%>
						<input type="button" value="삭제" onclick="location.href='deletenotice.brd?nnum=${board1.nnum}'">
						<input type="button" value="수정" onclick="location.href='updatenotice.brd?nnum=${board1.nnum}'">
					</td>
				</tr>
			</table>
	</form>
</c:forEach>
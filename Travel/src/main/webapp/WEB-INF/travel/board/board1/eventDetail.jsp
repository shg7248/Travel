<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
eventDetail.jsp<br>
<table>
<tr>
	<td>${bb.subject }</td>
</tr>
<tr>
	<td><img src="<%=request.getContextPath()%>/resources/board1/${bb.content}"></td>
</tr>
<tr>
	<td>
		<input type="button" value="삭제" onclick="location.href='deleteevent.brd?nnum=${bb.nnum}'">
		<input type="button" value="수정" onclick="location.href='updateevent.brd?nnum=${bb.nnum}'">
	</td>
</tr>
</table>
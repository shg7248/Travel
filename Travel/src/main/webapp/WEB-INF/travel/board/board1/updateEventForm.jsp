<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/travel/common/common.jsp"%>
<style>
.err {
	font-weight: bold;
	color: red;
}
</style>
insertForm.jsp<br>

<form:form commandName="board1" method="post" action="updateevent.brd" enctype="multipart/form-data">
	<h2 align="center">공지사항/이벤트 입력 화면</h2>
	<input type="hidden" name="nnum" value="${board1.nnum }">
	<input type="hidden" name="originalContent" value="${board1.content }">
	분류 :
	<select name="type">
		<option value="">선택하세요</option>
		<option value="notice" <c:if test="${board1.type eq 'notice' }">selected</c:if>>공지사항</option>
		<option value="event" <c:if test="${board1.type eq 'event' }">selected</c:if>>이벤트</option>
	</select>
	<form:errors cssClass="err" path="type"/><br>
	
	제목 : <input type="text" name="subject" value=${board1.subject }>
	<form:errors cssClass="err" path="subject"/><br>
	
	내용 : <textarea name="content" rows="13" cols="50" style="resize:none">${board1.content }</textarea><br><br>
	이미지 파일 :
	<img src="<%=application.getContextPath()%>/resources/board1/${board1.content}"><br>
	<input type="file" name="upload"><br><br>
	*내용과 이미지 파일둘 중 하나만 입력해주세요*<br>
	<form:errors cssClass="err" path="content"/><br>
	<input type="submit" value="입력하기">
</form:form>

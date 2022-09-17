<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/travel/common/common.jsp"%>
<%@include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>

<style>
.err {
	font-weight: bold;
	color: red;
}
</style>
noticeUpdateForm.jsp<br>

<form:form commandName="board1" method="post" action="noticeupdate.brd" enctype="multipart/form-data">
	<h2 align="center">공지사항/이벤트 입력 화면</h2>
	<input type="hidden" name="nnum" value="${board1.nnum }">
	
	제목 : <input type="text" name="subject" value=${board1.subject }>
	<form:errors cssClass="err" path="subject"/><br>
	
	내용 : <textarea name="content" rows="13" cols="50" style="resize:none"><c:out value="${board1.content}" /></textarea><br><br>
	<form:errors cssClass="err" path="content"/><br>
	<input type="submit" value="수정하기">
</form:form>

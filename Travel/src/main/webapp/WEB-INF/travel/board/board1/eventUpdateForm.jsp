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
eventUpdateForm.jsp<br>
<center>
<form:form commandName="board1" method="post" action="eventupdate.brd" enctype="multipart/form-data">
	<h2 align="center">이벤트 수정</h2>
	<input type="hidden" name="nnum" value="${board1.nnum }">
	<input type="hidden" name="originalContent" value="${board1.content }">
	<input type="hidden" name="pageNumber" value="${pageNumber }">
	
	제목 : <input type="text" name="subject" value=${board1.subject }>
	<form:errors cssClass="err" path="subject"/><br>
	
	이미지 파일 :
	<img src="<%=application.getContextPath()%>/resources/board1/${board1.content}"><br>
	<input type="file" name="upload"><br><br>
	<form:errors cssClass="err" path="content"/><br>
	<input type="submit" value="수정하기">
</form:form>
</center>
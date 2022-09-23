<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/travel/common/common.jsp"%>
<%@include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>
<link rel="stylesheet" href="${contextPath }/resources/css/board.css">

<style>
.err {
	font-weight: bold;
	color: red;
}
</style>

<div class="default">
<div class="contents">
<form:form commandName="board1" method="post" action="insertevent.brd" enctype="multipart/form-data">
	<input type="hidden" name="type" value="event">
	<input type="hidden" name="content" value="${board1.content}">
	<h2 align="center">이벤트 입력</h2>
	<table>
		<tr>
			<td>
				<input type="text" name="subject" placeholder="제목을 입력하세요"value=${board1.subject }>
				<form:errors cssClass="err" path="subject"/><br>
			</td>
		</tr>
		<tr>
			<td>
				이미지 파일 :
				<input type="file" name="upload"><br><br>
				<form:errors cssClass="err" path="content"/><br>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right">
				<input type="submit" value="입력하기">
				</div>
			</td>
		</tr>
	</table>
</form:form>
</div>
</div>
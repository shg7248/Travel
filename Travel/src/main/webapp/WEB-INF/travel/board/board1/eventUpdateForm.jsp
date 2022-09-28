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
<form:form commandName="board1" method="post" action="eventupdate.brd" enctype="multipart/form-data">
	<input type="hidden" name="nnum" value="${board1.nnum }">
	<input type="hidden" name="originalContent" value="${board1.content }">
	<input type="hidden" name="originalThumbnail" value="${board1.thumbnail }">
	<input type="hidden" name="pageNumber" value="${pageNumber }">
	<h2 align="center">이벤트 수정</h2>
	<table>
		<tr>
			<td>
				<input type="text" name="subject" placeholder="제목을 입력하세요." value="${board1.subject }">
				<form:errors cssClass="err" path="subject"/><br>
			</td>
		</tr>
		<tr>
			<td>
				썸네일 이미지 파일 :
				<img src="<%=application.getContextPath()%>/resources/images/event/${board1.thumbnail}"><br>
				수정할 썸네일 파일 :
				<input type="file" name="uploadthumbnail"><br><br>
				<form:errors cssClass="err" path="thumbnail"/><br>
			</td>
		</tr>
		<tr>
			<td>
				이미지 파일 :
				<img src="<%=application.getContextPath()%>/resources/images/event/${board1.content}"><br>
				수정할 파일 :
				<input type="file" name="upload"><br><br>
				<form:errors cssClass="err" path="content"/><br>
			</td>
		</tr>
	</table>
	<div class="right_button">
	<input type="submit" id="submit" value="수정하기">
	</div>
</form:form>
</div>
</div>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
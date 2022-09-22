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

<script type="text/javascript">
$(document).ready(function() {
	$('#summernote').summernote({
		toolbar: [
		    ['style', ['bold', 'italic', 'underline', 'clear']],
		    ['font', ['strikethrough', 'superscript', 'subscript']],
		    ['fontsize', ['fontsize']],
		    ['color', ['color']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']]
		  ],
		  height: 400,
		  maxHeight: 400,
		  minHeight: 400,
		  width: 700,
		  maxWidth: 700,
		  minWidth: 700,
		  placeholder: '내용을 입력하세요.'
	});
});
</script>

<div class="default">
<%@include file="./memberList.jsp" %>
<div class="contents">
<form:form commandName="board1" method="post" action="noticeupdate.brd" enctype="multipart/form-data">
<input type="hidden" name="pageNumber" value="${pageNumber }">
	<h2 align="center">공지사항 수정</h2>
	<input type="hidden" name="nnum" value="${board1.nnum }">
	
	<input type="text" name="subject" placeholder="제목을 입력하세요." value=${board1.subject }>
	<form:errors cssClass="err" path="subject"/><br>
	
	<textarea name="content" rows="13" cols="50" id="summernote" placeholder="내용을 입력하세요." style="resize:none"><c:out value="${board1.content}" /></textarea><br><br>
	<form:errors cssClass="err" path="content"/><br>
	<div align="right">
	<input type="submit" value="수정하기">
	</div>
</form:form>
</div>
</div>
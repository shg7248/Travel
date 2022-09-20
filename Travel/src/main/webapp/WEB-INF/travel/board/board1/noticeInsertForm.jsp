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
noticeInsertForm.jsp<br>
<center>
<form:form commandName="board1" method="post" action="insertnotice.brd" enctype="multipart/form-data">
	<h2 align="center">공지사항 입력</h2><br>
	<div>
		<input type="hidden" name="type" value="notice">
		<input type="text" name="subject" placeholder="제목을 입력하세요" width="700" value="${board1.subject }">
		<form:errors cssClass="err" path="subject"/><br>
		
		<textarea name="content" rows="13" cols="50" id="summernote" style="resize:none">${board1.content }</textarea>
		<form:errors cssClass="err" path="content"/><br>
		<div align="right">
		<input type="submit" value="입력하기">
		</div>
	</div>
</form:form>
</center>
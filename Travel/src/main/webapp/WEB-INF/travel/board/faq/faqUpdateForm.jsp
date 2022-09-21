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
		  placeholder: '답변을 입력하세요.'
	});
});
</script>

<div class="default">
<div class="contents">
<form:form commandName="faq" method="post" action="faqupdate.brd">
<input type="hidden" name="fnum" value="${faq.fnum }">
<h2 align="center">FAQ 수정하기</h2>
<table>
	<tr>
		<td>
			<input type="text" name="question" placeholder="질문을 입력하세요." value="${faq.question }">
			<form:errors cssClass="err" path="question"/><br>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<textarea name="answer" rows="13" cols="50" placeholder="내용을 입력하세요." id="summernote" style="resize:none">${faq.answer }</textarea><br>
			<form:errors cssClass="err" path="answer"/><br>
			<div align="right">
			<input type="submit" value="수정하기">
			</div>
		</td>
	</tr>
</table>
</form:form>
</div>
</div>
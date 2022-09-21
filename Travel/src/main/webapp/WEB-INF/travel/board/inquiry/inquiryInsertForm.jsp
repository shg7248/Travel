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
		  width: 600,
		  maxWidth: 600,
		  minWidth: 600,
		  height: 400,
		  maxHeight: 400,
		  minHeight: 400,
		  placeholder: '내용을 입력하세요.'
	});
});
</script>

inquiryInsertForm.jsp<br>
<center>
<form:form commandName="inquiry" method="post" action="inqinsert.brd">
<table>
	<tr>
		<td>
			<h2 align="center">1:1 문의사항</h2>
			제목 : <input type="text" name="subject" value=${inquiry.subject }>
			<form:errors cssClass="err" path="subject"/><br>
			
			내용 : <textarea name="question" rows="13" cols="50" id="summernote" style="resize:none">${inquiry.question }</textarea><br>
			<form:errors cssClass="err" path="question"/><br>
			<div align="right">
			<input type="submit" value="문의하기">			
			</div>
		</td>
	</tr>
</table>
</form:form>
</center>
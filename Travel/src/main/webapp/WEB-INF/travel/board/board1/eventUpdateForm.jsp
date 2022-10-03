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
$(document).ready(function(){

$("#submit").click(function(){
	$('#subjectCheck').hide();
	$('#thumbnailCheck').hide();
	$('#uploadCheck').hide();
	
	if($('input[name="subject"]').val()==""){
		$('#subjectCheck').text('제목을 입력해주세요');
		$("#subjectCheck").show();
		f.subject.focus();
		return false;
	}
	if($('input[name="uploadthumbnail"]').val()==""){
		$('#thumbnailCheck').text('섬네일을 입력해주세요');
		$("#thumbnailCheck").show();
		f.uploadthumbnail.focus();
		return false;
	}
	if($('input[name="upload"]').val()==""){
		$('#uploadCheck').text('이미지를 입력해주세요');
		$("#uploadCheck").show();
		f.upload.focus();
		return false;
	}
});
});

</script>
<div class="default">
<div class="contents">
<form name="f" method="post" action="eventupdate.brd" enctype="multipart/form-data">
	<input type="hidden" name="nnum" value="${board1.nnum }">
	<input type="hidden" name="originalContent" value="${board1.content }">
	<input type="hidden" name="originalThumbnail" value="${board1.thumbnail }">
	<input type="hidden" name="pageNumber" value="${pageNumber }">
	<h2 align="center">이벤트 수정</h2>
	<table>
		<tr>
			<td>
				<input type="text" name="subject" placeholder="제목을 입력하세요." value="${board1.subject }">
				<font id="subjectCheck" class="err"></font>
			</td>
		</tr>
		<tr>
			<td>
				<label class="upd_ins_label">기존 썸네일 이미지 파일</label>
				<img src="<%=application.getContextPath()%>/resources/images/event/${board1.thumbnail}"><br>
				<label class="upd_ins_label">수정할 썸네일 이미지 파일</label>
				<input type="file" name="uploadthumbnail"><br><br>
				<font id="thumbnailCheck" class="err"></font>
			</td>
		</tr>
		<tr>
			<td>
				<label class="upd_ins_label">기존 이미지 파일</label>
				<img src="<%=application.getContextPath()%>/resources/images/event/${board1.content}"><br>
				<label class="upd_ins_label">수정할 이미지 파일</label>
				<input type="file" name="upload"><br><br>
				<font id="uploadCheck" class="err"></font>
			</td>
		</tr>
	</table>
	<div class="right_button">
	<input type="submit" id="submit" value="수정하기">
	</div>
</form>
</div>
</div>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
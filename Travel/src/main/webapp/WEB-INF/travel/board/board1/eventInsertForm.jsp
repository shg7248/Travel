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
		return false;
	}
	if($('input[name="uploadthumbnail"]').val()==""){
		$('#thumbnailCheck').text('섬네일을 입력해주세요');
		$("#thumbnailCheck").show();
		return false;
	}
	if($('input[name="upload"]').val()==""){
		$('#uploadCheck').text('이미지를 입력해주세요');
		$("#uploadCheck").show();
		return false;
	}
});
});

</script>
<div class="default">
<div class="contents">
<form method="post" action="insertevent.brd" enctype="multipart/form-data">
	<input type="hidden" name="type" value="event">
	<h2 align="center">이벤트 입력</h2>
	<table>
		<tr>
			<td>
				<input type="text" name="subject" placeholder="제목을 입력하세요"value=${board1.subject }>
				<font id="subjectCheck" class="err"></font>
			</td>
		</tr>
		<tr>
			<td>
				<label class="upd_ins_label">섬네일 이미지 파일</label>
				<input type="file" name="uploadthumbnail"><br><br>
				<font id="thumbnailCheck" class="err"></font>
			</td>
		</tr>
		<tr>
			<td>
				<label class="upd_ins_label">이미지 파일</label>
				<input type="file" name="upload"><br><br>
				<font id="uploadCheck" class="err"></font>
			</td>
		</tr>
	</table>
	<div class="right_button">
	<input type="submit" id="submit" value="입력하기">
	</div>
</form>
</div>
</div>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
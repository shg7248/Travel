<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/travel/common/common.jsp"%>
<%@include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>
<link rel="stylesheet" href="${contextPath }/resources/css/board.css">

<script type="text/javascript">
$(document).ready(function(){
	
});

function check(){
 	if($('input[name="subject"]').val()==""){
 		$('#subjectCheck').text('제목을 입력해주세요');
		f.subject.focus();
		return false;
	} 
 	if($('input[name="upload"]').val()==""){
 		$('#uploadCheck').text('이미지파일을 삽입해주세요');
		return false;
	} 
};
</script>

<style>
.err {
	font-weight: bold;
	color: red;
}
</style>

<div class="default">
<div class="contents">
<form name="f" method="post" action="insertadvertisement.admin" enctype="multipart/form-data">
	<h2 align="center">광고삽입</h2>
	<table>
		<tr>
			<td>
				<input type="text" name="subject" placeholder="제목을 입력하세요"value=${board1.subject }><br>
				<font id="subjectCheck" class="err" ></font>
			</td>
		</tr>
		<tr>
			<td>
				<label class="upd_ins_label">이미지 파일</label>
				<input type="file" name="upload"><br><br>
				<font id="uploadCheck" class="err" ></font>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right">
				<input type="submit" value="입력하기" onclick="return check()">
				</div>
			</td>
		</tr>
	</table>
</form>
</div>
</div>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
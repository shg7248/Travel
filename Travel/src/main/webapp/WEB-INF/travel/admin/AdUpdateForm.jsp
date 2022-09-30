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
<form name="f" method="post" action="updateadvertisement.admin" enctype="multipart/form-data">
	<input type="hidden" name="adnum" value="${ab.adnum }">
	<input type="hidden" name="originalContent" value="${ab.adimage }">
	<input type="hidden" name="pageNumber" value="${pageNumber }">
	<h2 align="center">광고 수정</h2>
	<table>
		<tr>
			<td>
				<input type="text" name="subject" placeholder="제목을 입력하세요." value="${ab.subject }"><br>
				<font id="subjectCheck" class="err" ></font>
			</td>
		</tr>
		<tr>
			<td>
				<label class="upd_ins_label">기존 이미지 파일</label>
				<img src="<%=application.getContextPath()%>/resources/images/advertisement/${ab.adimage}"><br>
				<label class="upd_ins_label">수정할 이미지 파일</label>
				<input type="file" name="upload"><br><br>
				<font id="uploadCheck" class="err" ></font>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right">
				<input type="submit" id="submit" value="수정하기"  onclick="return check()">
				</div>
			</td>
		</tr>
	</table>
</form>
</div>
</div>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
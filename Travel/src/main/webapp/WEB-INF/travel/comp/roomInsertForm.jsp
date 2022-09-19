<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/comp/header.jsp" %>
<script type="text/javascript">
	$(document).ready(function () {
	    $('#summernote').summernote({
	        placeholder: '숙박지 기본정보를 입력하세요',
	        height: 400,
	        maxHeight: 300
	    });
	});
</script>
<form method="post" action="insert.comp" enctype="multipart/form-data">
	<table>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name"/></td>
		</tr>
		<tr>
			<td>가격</td>
			<td><input type="text" name="price"/></td>
		</tr>
		<tr>
			<td>할인율</td>
			<td><input type="text" name="sale"/></td>
		</tr>
		<tr>
			<td>최대인원</td>
			<td><input type="text" name="max"/></td>
		</tr>
		<tr>
			<td>이미지</td>
			<td><input type="file" name="upload"/></td>
		</tr>
		<tr>
			<td>객실 정보</td>
			<td><textarea rows="" cols="" name="info" id="summernote"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="등록"/>
			</td>
		</tr>
	</table>
</form>
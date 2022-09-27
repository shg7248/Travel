<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/comp/header.jsp" %>
<form method="post" action="insert.comp" enctype="multipart/form-data" name="roomForm">
	<table>
		<tr>
			<th>객실 이름</th>
			<td><input type="text" name="name"/></td>
		</tr>
		<tr>
			<th>가격</th>
			<td><input type="text" name="price"/></td>
		</tr>
		<tr>
			<th>할인율</th>
			<td><input type="text" name="sale"/></td>
		</tr>
		<tr>
			<th>최대인원</th>
			<td><input type="text" name="max"/></td>
		</tr>
		<tr>
			<th>이미지</th>
			<td><input type="file" name="upload"/></td>
		</tr>
		<tr>
			<th>객실 정보</th>
			<td><textarea rows="20" cols="20" name="info" id="ir1" class="ir1"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="등록" onclick="return submitRoom()"/>
				<input type="button" value="뒤로" onclick="location.href='${contextPath}/comp/room/main.comp'"/>
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "ir1",
		sSkinURI : "${contextPath}/resources/se2/SmartEditor2Skin.html",
		fCreator : "createSEditor2",
		htParams : {
			fOnBeforeUnload : function() {}
		}
	});
</script>
<script type="text/javascript" src="${contextPath }/resources/js/comp/auth.js"></script>
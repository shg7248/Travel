<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/comp/header.jsp" %>
<form method="post" action="${contextPath }/comp/room/update.comp" enctype="multipart/form-data" name="roomForm">
	<input type="hidden" name="rnum" value="${rb.rnum }"/>
	<table>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" value="${rb.name }"/></td>
		</tr>
		<tr>
			<th>가격</th>
			<td><input type="text" name="price" value="${rb.price }"/></td>
		</tr>
		<tr>
			<th>최대인원</th>
			<td><input type="text" name="max" value="${rb.max }"/></td>
		</tr>
		<tr>
			<th>이미지</th>
			<td><input type="file" name="upload"/></td>
		</tr>
		<tr>
			<th>객실 정보</th>
			<td><textarea rows="20" cols="20" name="info" id="ir1" class="ir1">${rb.info }</textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="수정" onclick="return submitRoom()"/>
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
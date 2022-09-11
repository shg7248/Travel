<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/comp/header.jsp" %>

<form method="post" action="roomInsert.comp" enctype="multipart/form-data">
	<table>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name"/></td>
		</tr>
		<tr>
			<td>가격</td>
			<td><input type="text" name="price" value="0"/></td>
		</tr>
		<tr>
			<td>할인율</td>
			<td><input type="text" name="sale" value="0"/></td>
		</tr>
		<tr>
			<td>최대인원</td>
			<td><input type="text" name="max" value="0"/></td>
		</tr>
		<tr>
			<td>이미지</td>
			<td><input type="file" name="upload"/></td>
		</tr>
		<tr>
			<td>객실 정보</td>
			<td><textarea rows="" cols="" name="info">호잇</textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="등록"/>
			</td>
		</tr>
	</table>
</form>
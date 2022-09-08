<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
compDetail.jsp <br>

<form method="post" action="compDetailUpdate.comp" enctype="">
<table>
	<tr>
		<th>사업자 등록번호</th>
		<td>
			<input type="text">
		</td>
	</tr>
	<tr>
		<th>숙박지역</th>
		<td>
			<select>
				<option>지역을 선택하세요</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>숙박지 주소</th>
		<td>
			<input type="text">
		</td>
	</tr>
	<tr>
		<th>숙박지 기본정보</th>
		<td>
			<input type="text">
		</td>
	</tr>
	<tr>
		<th>숙박지 주변 편의시설</th>
		<td>
			<input type="checkbox">sample1
			<input type="checkbox">sample2
			<input type="checkbox">sample3
			<input type="checkbox">sample4
			<input type="checkbox">sample5
		</td>
	</tr>
	<tr>
		<th>객실 편의시설</th>
		<td>
			<input type="checkbox">sample1
			<input type="checkbox">sample2
			<input type="checkbox">sample3
			<input type="checkbox">sample4
			<input type="checkbox">sample5
		</td>
	</tr>
	<tr>
		<th>입실시간</th>
		<td>
			<input type="text">
		</td>
	</tr>
	<tr>
		<th>퇴실시간</th>
		<td>
			<input type="text">
		</td>
	</tr>
	<tr>
		<th>숙박지 이미지</th>
		<td>
			<input type="file">
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="등록">
		</td>
	</tr>
</table>
</form>
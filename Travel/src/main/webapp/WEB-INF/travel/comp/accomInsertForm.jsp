<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/comp/header.jsp" %>

		<form method="post" action="insertAccom.comp" enctype="multipart/form-data">
		<table>
			<tr>
				<th>사업자 등록번호</th>
				<td>
					<input type="text" name="cnum" value="1234567890">
				</td>
			</tr>
			<tr>
				<th>숙박지역</th>
				<td>
					<select name="rnum">
						<option>지역을 선택하세요</option>
						<c:forEach var="region" items="${rLists }">
							<option value="${region.rnum }">${region.name }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>숙박지 이름</th>
				<td>
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<th>숙박지 주소</th>
				<td>
					<input type="text" name="addr">
				</td>
			</tr>
			<tr>
				<th>숙박지 주변 편의시설</th>
				<td>
					<c:forEach var="fac" items="${fLists }">
						<c:if test="${fac.fgroup eq 'F1' }">
							<input type="checkbox" name="fac1" value="${fac.fnum }">${fac.name }
						</c:if>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>객실 편의시설</th>
				<td>
					<c:forEach var="fac" items="${fLists }">
						<c:if test="${fac.fgroup eq 'F2' }">
							<input type="checkbox" name="fac2" value="${fac.fnum }">${fac.name }
						</c:if>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>입실시간</th>
				<td>
					<input type="text" name="startTime">
				</td>
			</tr>
			<tr>
				<th>퇴실시간</th>
				<td>
					<input type="text" name="endTime">
				</td>
			</tr>
			<tr>
				<th>숙박지 이미지</th>
				<td>
					<input type="file" name="upload">
				</td>
			</tr>
			<tr>
				<th>숙박지 기본정보</th>
				<td>
					<textarea rows="" cols="" name="info"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록">
				</td>
			</tr>
		</table>
		</form>
	</section>
</main>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/comp/header.jsp" %>
<style>
	.tempWrap {
		display: grid;
		grid-template-columns: repeat(3, 1fr);
	}
	.tempDiv {
		border: 1px solid black;
		height: 200px;
	}
</style>
<input type="button" value="등록" onclick="location.href='${contextPath}/2/roomInsert.comp'"><br>
<form method="get" action="roomMain.comp">
	<select name="whatColumn">
		<option value="">전체 검색</option>
		<option value="name" <c:if test="${whatColumn eq 'name' }">selected</c:if>>객실 이름</option>
	</select>
	<input type="text" name="keyword" value="${keyword }">
	<input type="submit" value="검색">
</form>
<div class="tempWrap">
<c:forEach var="room" items="${lists }">
	<div class="tempDiv">
		${room.name }
		<div>
			<a href="roomDetail.comp?rnum=${room.rnum }">상세/수정</a>
			<a href="">삭제</a>
		</div>
	</div>
</c:forEach>
</div>
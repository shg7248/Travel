<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/comp/header.jsp" %>
<style>
	.search-wrap__result {
		display: grid;
		grid-template-columns: repeat(2, 1fr);
		column-gap: 10px;
		row-gap: 10px;
	}
	.search-wrap__search {
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-bottom: 20px;
	}
	.search-wrap__submit {
		margin: 0px 5px !important;
		height: 30px;
	}
	.search-wrap__list {
		position: relative;
		height: 200px;
	}
	.search-wrap__item {
		width: 100%;
		height: 100%;
		padding: 10px;
		border-radius: 10px;
	}
	.search-wrap__item::before {
		content: '';
		opacity: 0.5;
		position: absolute;
		top: 0px;
		bottom: 0px;
		right: 0px;
		left: 0px;
		background-color: #000;
		border-radius: 10px;
		z-index: 998;
	}
	.search-wrap__link {
		position: relative;
		color: white;
		font-weight: bold;
		font-size: 16px;
		cursor: pointer;
		z-index: 999;
	}
	.search-wrap__link--name {
		font-size: 24px;
	}
	.search-wrap__link:hover {
		color: red;
	}
	.search-wrap__noLists {
		font-size: 11px;
	}
</style>
<section class="search-wrap">
	<article class="search-wrap__search">
		<input class="search-wrap__input" type="button" value="객실등록" onclick="location.href='${contextPath}/comp/room/insert.comp'">
		<form method="get" action="main.comp">
			<select name="whatColumn" class="search-wrap__select">
				<option value="">전체</option>
				<option value="name" <c:if test="${whatColumn eq 'name' }">selected</c:if>>객실명</option>
			</select>
			<input class="search-wrap__text" type="text" name="keyword" value="${keyword }">
			<input class="search-wrap__submit" type="submit" value="검색">
		</form>
	</article>
	<article class="search-wrap__result">
		<c:if test="${fn:length(lists) eq 0 }">
			<div class="search-wrap__noLists">숙박지의 객실을 등록해 보세요!</div>
		</c:if>
		<c:if test="${fn:length(lists) ne 0 }">
			<c:forEach var="room" items="${lists }">
				<div class="search-wrap__list">
					<div class="search-wrap__item" style="background: url('${contextPath }/resources/images/room/${room.image }') center;">
						<p class="search-wrap__link search-wrap__link--name">${room.name }</p>
						<a class="search-wrap__link search-wrap__link--info" href="${contextPath }/comp/room/detail.comp?rnum=${room.rnum }">상세/수정</a>
						<!-- <a class="search-wrap__link search-wrap__link--delete" href="">삭제</a> -->
					</div>
				</div>
			</c:forEach>
		</c:if>
	</article>
</section>

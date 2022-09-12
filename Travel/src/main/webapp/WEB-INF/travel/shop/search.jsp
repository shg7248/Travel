<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/common.jsp" %>  
<script src="${contextPath }/resources/js/calendar.js"></script>
<link rel="stylesheet" href="${contextPath }/resources/css/calendar.css">
<style>
	.testDiv {
		width: 400px;
		height: 200px;
		border: 1px solid black;
	}
</style>
<form method="post" action="search.shop">
	<input type="submit" value="검색" /><br>
	기간 <input type="button" value="기간 선택" onclick="displayCal()"/>
	<div class="calendar"></div>
	<input type="hidden" name="start" value="${start }">
	<input type="hidden" name="end" value="${end }">
	<br>
	공용시설
	<br>
	<c:forEach var="fac" items="${facLists }">
		<c:if test="${fac.fgroup eq 'F1' }">
			<input type="checkbox" name="fac1" value="${fac.fnum }"<c:if test="${fn:contains(searchBean.fac1, fac.fnum) }">checked</c:if>>${fac.name }
		</c:if>
	</c:forEach>
	<br>
	객실 내 시설
	<br>
	<c:forEach var="fac" items="${facLists }">
		<c:if test="${fac.fgroup eq 'F2' }">
			<input type="checkbox" name="fac2" value="${fac.fnum }" <c:if test="${fn:contains(searchBean.fac2, fac.fnum) }">checked</c:if>>${fac.name }
		</c:if>
	</c:forEach>
	<br>
	인원 <input type="text" name="count" value="2"/>
	<br>
	가격 <input type="text" name="price" value="1234"/>
	<br>
	지역 
	<select name="resion">
		<option>선택</option>
		<c:forEach var="resion" items="${rLists }">
			<option value="${resion.rnum }">${resion.name }</option>
		</c:forEach>
	</select>
</form>
<a href="">추천 높은순</a>
<a href="">가격 높은순</a>
<a href="">가격 낮은순</a>
<c:forEach var="search" items="${sLists }">
	<div class="testDiv">
		<a href="accomDetail.shop?anum=${search.anum }&start=${start }&end=${end }">${search.name }</a><br>
		${search.addr }<br>
		${search.price }원<br>
		${search.image }
	</div>
</c:forEach>
<script>

	function displayCal() {
		const cal = document.querySelector('.calendar');
		cal.classList.toggle('on');
	}

	const start = ${start};
	const end = ${end};
	const cal = new Calendar({start: start, end: end});
</script>
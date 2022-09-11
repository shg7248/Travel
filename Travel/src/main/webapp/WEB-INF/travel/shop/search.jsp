<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/common.jsp" %>  
<form method="post" action="search.shop">
	<input type="submit" value="검색" />
	<br>
	공용시설
	<br>
	<c:forEach var="fac" items="${facLists }">
		<c:if test="${fac.fgroup eq 'F1' }">
			<input type="checkbox" name="fac1" value="${fac.fnum }">${fac.name }
		</c:if>
	</c:forEach>
	<br>
	객실 내 시설
	<br>
	<c:forEach var="fac" items="${facLists }">
		<c:if test="${fac.fgroup eq 'F2' }">
			<input type="checkbox" name="fac2" value="${fac.fnum }">${fac.name }
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
<c:forEach var="search" items="${sLists }">
	<div>
		${search.name }
		${search.addr }
		${search.price }
		${search.image }
	</div>
</c:forEach>
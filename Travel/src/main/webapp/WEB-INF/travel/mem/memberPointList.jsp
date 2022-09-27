<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %> 
<%@ include file="/WEB-INF/travel/common/layout/mem/memberList.jsp" %>  

<table>
	<tr>
		<th>번호</th>
		<th>사용내역</th>
		<th>포인트</th>
		<th>날짜</th>
	</tr>
	<c:forEach var="item" items="${pointBean }">
		<tr>
			<td>${item.pnum }</td>
			<td>${item.chargeType }</td>
			<td>${item.point }</td>
			<td>${item.reg_date }</td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="4">${pageInfo.pagingHtml }</td>
	</tr>
</table>

<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
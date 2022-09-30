<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %> 
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet"> 
<div class="all">
<%@ include file="/WEB-INF/travel/common/layout/mem/memberList.jsp" %>  
	<div class="contents">
		<table class="table">
			<tr>
				<th>번호</th>
				<th>사용내역</th>
				<th>포인트</th>
				<th>날짜</th>
			</tr>
			<c:if test="${fn:length(pointBean) == 0 }">
				<tr>
					<td colspan="4" align="center">포인트가 없습니다</td>
				</tr>
			</c:if>
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
	</div>
</div>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
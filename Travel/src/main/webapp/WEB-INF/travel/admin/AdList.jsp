<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/travel/common/common.jsp"%>
<%@include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>
<link rel="stylesheet" href="${contextPath }/resources/css/board.css">

<div class="default">
<%@ include file ="Main.jsp" %>
<div class="contents">
	<h2>광고 목록</h2>
	<table>
		<c:forEach items="${lists }" var="advertisement">
		<tr>
			<td class="title_td">
				<a class="title" href="advertisementdetail.admin?adnum=${advertisement.adnum }&pageNumber=${pageInfo.pageNumber}">
				<c:if test="${fn:length(advertisement.subject)>=60 }">
					${fn:substring(advertisement.subject,0,60)}...
					</c:if>
					<c:if test="${fn:length(advertisement.subject)<60 }">
					${advertisement.subject }
					</c:if>
				</a>
				<span class="written-date">
					<fmt:parseDate var="date" value="${advertisement.reg_date }" pattern="yyyy-MM-dd" />
					<fmt:formatDate var="reg_date" value="${date }" pattern="yyyy.MM.dd" /> ${reg_date }
				</span>
			</td>
		</tr>
		</c:forEach>
	</table>
${pageInfo.pagingHtml }
<c:if test="${email eq 'admin' }">
	<div class="right_button">
		<input type="button" value="추가하기" onclick="location.href='insertadvertisement.admin'">
	</div>
</c:if>
</div>
</div>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/travel/common/common.jsp"%>
<%@include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>
<link rel="stylesheet" href="${contextPath }/resources/css/board.css">
<style>
.advertisement_img{
	width: 700px;
	height: auto;
}
</style>
<div class="default">
<div class="contents">
<h2>광고 상세내역</h2>
<table>
	<tr>
		<td class="title_td title" >
			${ab.subject }
			<span class="written-date">
				<fmt:parseDate var="date" value="${ab.reg_date }" pattern="yyyy-MM-dd" />
				<fmt:formatDate var="reg_date" value="${date }" pattern="yyyy.MM.dd" /> ${reg_date }
			</span>
		</td>
	</tr>
	<tr>
		<td><img class="advertisement_img" src="<%=request.getContextPath()%>/resources/images/advertisement/${ab.adimage}"></td>
	</tr>
</table>
<div class="right_button">
	<c:set var="email" value='<%=(String)session.getAttribute("email") %>'/>
	<c:if test="${email eq 'admin' }">
		<input type="button" value="수정" onclick="location.href='updateadvertisement.admin?adnum=${ab.adnum}&pageNumber=${pageNumber}'">
		<input type="button" value="삭제" onclick="location.href='deleteadvertisement.admin?adnum=${ab.adnum}'">
	</c:if>
	<input type="button" value="목록보기" class="button1" onclick="location.href='advertisementlist.admin?pageNumber=${pageNumber}'">
</div>
</div>
</div>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
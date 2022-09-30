<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>  
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
function check(onum){
	if(confirm("예약을 취소하시겠습니까?")){
		location.href='bookingCancel.mem?onum='+onum;
	}
}
</script>

<div class="all">
<%@ include file="/WEB-INF/travel/common/layout/mem/memberList.jsp" %>  
<div class="contents">
<label>예약 내역</label>
<br>
<span class="important">※ 리뷰작성 시 50포인트를 드립니다.</span>
<table class="res-grid">
	<tr>
		<th>숙소명</th>
		<th>객실명</th>
		<th>날짜</th>
		<th>가격</th>
		<th>결제일</th>
		<th>예약상태</th>
		<th>리뷰쓰기</th>
		<th>예약취소</th>
	</tr>
	<c:forEach items="${lists }" var="list">
		<tr>
			<td>${list.aname }</td>
			<td>${list.rname }</td>
			<td>${list.startDate } ~ ${list.endDate }</td>
			<td><fmt:formatNumber value="${list.price }"/>원</td>
			<td>
				<fmt:parseDate var="paredDate" value="${list.oDate }" pattern="yyyy-MM-dd"/>
				<fmt:formatDate value="${paredDate }" var="formatedDate" pattern="yyyy.MM.dd"/>			
				${formatedDate }
			</td>
			<td>
				<c:choose>
					<c:when test="${list.resStatus eq 0}">
						<font color="#DC143C">예약중</font>
					</c:when>
					<c:when test="${list.resStatus eq 1}">
						<font color="#FF8C00">숙박중</font>
					</c:when>
					<c:when test="${list.resStatus eq 2}">
						<font color="#DC143C">숙박완료</font>
					</c:when>
				</c:choose>
			</td>
			<td>
				<c:choose>
					<c:when test="${list.reviewCount > 0}">
						<font color="#DC143C">리뷰작성 완료</font>
					</c:when>
					<c:when test="${list.reviewCount == 0 && list.resStatus == 2}">
						<form  action="${contextPath}/shop/detail.shop" method="post" name="f">
							<input type="hidden" name="onum" value="${list.onum }"/>
							<input type="hidden" name="anum" value="${list.anum }"/>
							<a href="javascript:document.forms[0].submit()"><font color="#4169E1">리뷰작성</font></a>
						</form>						
					</c:when>
					<c:otherwise>
						<font color="#DC143C">비활성화</font>
					</c:otherwise>
				</c:choose>
			</td>
			<td>
				<c:choose>
					<c:when test="${list.resStatus eq 0}">
						<a href="#" onclick="return check(${list.onum})">취소하기</a>
					</c:when>
					<c:when test="${list.resStatus ne 0}">
						<font color="#DC143C">취소불가</font>
					</c:when>
				</c:choose>
			</td>
		</tr>
	</c:forEach>
</table>
</div>
</div>

<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
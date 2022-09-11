<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/comp/header.jsp" %>
    <div class="section">
    	<c:if test="${empty requestScope.accom }">
        	<input type="button" value="등록하기" onclick="location.href='${pageContext.request.contextPath }/1/insertAccom.comp'">
        </c:if>
        <c:if test="${!empty requestScope.accom }">
        	<input type="button" value="수정하기" onclick="location.href='${pageContext.request.contextPath }/1/updateAccom.comp'">
        </c:if>
        <table>
        	<tr>
        		<td>사업자 등록번호</td>
        		<td>${requestScope.accom.cnum }</td>
        	</tr>
        	<tr>
        		<td>숙박지역</td>
        		<td>${requestScope.accom.rname }</td>
        	</tr>
        	<tr>
        		<td>숙박지 이름</td>
        		<td>${requestScope.accom.name }</td>
        	</tr>
        	<tr>
        		<td>숙박지 주소</td>
        		<td>${requestScope.accom.addr }</td>
        	</tr>
        	<tr>
        		<td>숙박지 주변 편의시설</td>
        		<td>${requestScope.accom.fac1 }</td>
        	</tr>
        	<tr>
        		<td>객실 편의시설</td>
        		<td>${requestScope.accom.fac2 }</td>
        	</tr>
        	<tr>
        		<td>입실시간</td>
        		<td>${requestScope.accom.startTime }</td>
        	</tr> 
        	<tr>
        		<td>퇴실시간</td>
        		<td>${requestScope.accom.endTime }</td>
        	</tr> 
        	<tr>
        		<td>숙박지 이미지</td>
        		<td>
        			<img alt="이미지" src="${context }/resources/uploadImage/${requestScope.accom.image }">
        		</td>
        	</tr> 
        	<tr>
        		<td>숙박지 기본정보</td>
        		<td>${requestScope.accom.info }</td>
        	</tr> 
        </table>
    </div>
</div>
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
        		<td>${requestScope.accom.rnum }</td>
        	</tr>
        </table>
    </div>
</div>
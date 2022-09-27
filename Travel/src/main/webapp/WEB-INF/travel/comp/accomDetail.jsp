<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/comp/header.jsp" %>
				<div class="accom-detail__btns">
			    	<c:if test="${empty requestScope.accom }">
			        	<input type="button" value="등록하기" class="accom-detail__btn accom-detail__btn--insert" onclick="location.href='${contextPath }/comp/accom/insert.comp'">
			        </c:if>
			        <c:if test="${!empty requestScope.accom }">
			        	<input type="button" value="수정하기" class="accom-detail__btn accom-detail__btn--update" onclick="location.href='${contextPath }/comp/accom/update.comp?anum=${requestScope.accom.anum }'">
					</c:if>
				</div>
		        
		        <table class="accom-detail__info">
		            <c:if test="${empty requestScope.accom }">
						<tr>
							<td>등록된 숙박지가 없습니다.</td>
						</tr>
		         	</c:if>
		         	<c:if test="${!empty requestScope.accom }">
			        	<tr>
			        		<td colspan="2"><img class="accom-detail__img"src="${contextPath }/resources/images/${requestScope.accom.image }"></td>
			        	</tr>
			        	<tr>
			        		<td>사업자 등록번호</td>
			        		<td>${requestScope.accom.cnum }</td>
			        	</tr>
			        	<tr>
			        		<td>숙박 지역</td>
			        		<td>${requestScope.accom.sido } ${requestScope.accom.sigungu }</td>
			        	</tr>
			        	<tr>
			        		<td>숙박지 상세주소</td>
			        		<td>${requestScope.accom.etcAddr }</td>
			        	</tr>
			        	<tr>
			        		<td>숙박지 이름</td>
			        		<td>${requestScope.accom.name }</td>
			        	</tr>
			        	<tr>
			        		<td>입실시간</td>
			        		<td>${requestScope.accom.startTime }시</td>
			        	</tr> 
			        	<tr>
			        		<td>퇴실시간</td>
			        		<td>${requestScope.accom.endTime }시</td>
			        	</tr> 
			        	<tr>
			        		<td colspan="2">숙박지 기본정보</td>
			        	</tr> 
			        	<tr>
			        		<td colspan="2">${requestScope.accom.info }</td>
			        	</tr>
		        	</c:if>
		        </table>
	        </div> <!-- inner -->
        </section> <!-- section -->
    </div> <!-- main -->
</div> <!-- wrap -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/comp/header.jsp" %>
<table class="accom-detail__info">
		        	<tr>
		        		<th width="20%">사업자 등록번호</th>
		        		<td width="80%">${loginInfo.cnum }</td>
		        	</tr>
		        	<tr>
		        		<th>이메일</th>
		        		<td>${loginInfo.email }</td>
		        	</tr>
		        	<tr>
		        		<th>핸드폰번호</th>
		        		<td>${loginInfo.phone }</td>
		        	</tr>
		        	<tr>
		        		<th>가입일자</th>
		        		<td>${loginInfo.reg_date }</td>
		        	</tr>
		        	<tr>
		        		<th>사업자 등록증</th>
		        		<td>
		        			<img width="100%" src="${contextPath }/resources/images/company/${loginInfo.image }">
		        		</td>
		        	</tr>
		        </table>
	        </div> <!-- inner -->
        </section> <!-- section -->
    </div> <!-- main -->
</div> <!-- wrap -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/comp/header.jsp" %>

<table class="accom-detail__info">
			        	<tr>
			        		<td>사업자 등록번호</td>
			        		<td>${loginInfo.cnum }</td>
			        	</tr>
			        	<tr>
			        		<td>이메일</td>
			        		<td>${loginInfo.email }</td>
			        	</tr>
			        	<tr>
			        		<td>핸드폰번호</td>
			        		<td>${loginInfo.phone }</td>
			        	</tr>
			        	<tr>
			        		<td>가입일자</td>
			        		<td>${loginInfo.reg_date }</td>
			        	</tr>
		        </table>
	        </div> <!-- inner -->
        </section> <!-- section -->
    </div> <!-- main -->
</div> <!-- wrap -->
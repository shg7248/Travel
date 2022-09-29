<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/comp/header.jsp" %>
<table class="accom-detail__info">
		        	<tr>
		        		<th>사업자 등록번호</th>
		        		<td>${loginInfo.cnum }</td>
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
		        		<td colspan="2">
		        			<img src="">
		        		</td>
		        	</tr>
		        </table>
	        </div> <!-- inner -->
        </section> <!-- section -->
    </div> <!-- main -->
</div> <!-- wrap -->
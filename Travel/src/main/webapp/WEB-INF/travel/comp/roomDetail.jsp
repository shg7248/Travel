<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/comp/header.jsp" %>
<style>
	.tempImage {
		width: 100%;
		height: 300px;
		border: 1px solid black;
	}
</style>
<input type="button" value="정보수정" />
<div class="tempImage">
	<img src="" >
</div>
<table>
	<tr>
		<td>객실 이름</td>
		<td>${roomBean.name }</td>
	</tr>
	<tr>
		<td>객실 가격</td>
		<td>${roomBean.price }원</td>
	</tr>
</table>

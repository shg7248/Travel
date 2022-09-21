<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/comp/header.jsp" %>

<link rel="stylesheet" href="${contextPath }/resources/css/compCalendar.css">
<script src="${contextPath }/resources/js/compCalendar.js"></script>

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
<div class="calendar"></div>
<table>
	<tr>
		<td>객실 이름</td>
		<td>${rb.name }</td>
	</tr>
	<tr>
		<td>객실 가격</td>
		<td>${rb.price }원</td>
	</tr>
</table>
<script type="text/javascript">
	window.onload = function() {
		new Calendar([
			{
				name: '송학관',
				start: '20220921',
				end: '20220928'
			}
		]);
	}
</script>

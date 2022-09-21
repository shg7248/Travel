<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/comp/header.jsp" %>

<link rel="stylesheet" href="${contextPath }/resources/css/compCalendar.css">
<script src="${contextPath }/resources/js/compCalendar.js"></script>

<style>

</style>
<input type="button" value="객실정보 수정" onclick="location.href='${contextPath}/comp/room/update.comp?rnum=${rb.rnum }'"/><br>
※ 예약 정보는 이번달부터 이후까지만 보여집니다.
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
		
		const data = {
				rnum: '${rb.rnum}'
		}
		
		fetch('/travel/getRoomResList.comp', {
			method: 'post',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify(data)
		})
		.then((data)=> {
			return data.json();
		})
		.then((result)=> {
			const arr = result.map((elem)=> {
				return {
					name: elem.resName,
					start: elem.startDate,
					end: elem.endDate
				}
			});
			new Calendar(arr);
		});
	}
</script>

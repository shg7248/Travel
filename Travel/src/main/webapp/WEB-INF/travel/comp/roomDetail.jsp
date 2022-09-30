<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/comp/header.jsp" %>
<link rel="stylesheet" href="${contextPath }/resources/css/compCalendar.css">
<script src="${contextPath }/resources/js/compCalendar.js"></script>
<section class="res-calendar">
	<h2 class="res-calendar__title">사용자 객실 예약 내역</h2>
	<p class="msg--import res-calendar__import">※ 예약 정보는 이번달부터 이후까지만 보여집니다.</p>
	<div class="calendar res-calendar__calendar"></div>
</section>
<section>
	<input type="button" value="객실정보 수정" onclick="location.href='${contextPath}/comp/room/update.comp?rnum=${rb.rnum }'"/><br>
	<table>
		<tr>
			<th width="20%">객실 이름</th>
			<td width="80%">${rb.name }</td>
		</tr>
		<tr>
			<th>객실 가격</th>
			<td>${rb.price }원</td>
		</tr>
		<tr>
			<th>객실 인원수</th>
			<td>${rb.max }명</td>
		</tr>
		<tr>
			<th>설명</th>
			<td>${rb.info }</td>
		</tr>
	</table>
</section>
<script type="text/javascript">
	(function() {
		
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
	}());
</script>

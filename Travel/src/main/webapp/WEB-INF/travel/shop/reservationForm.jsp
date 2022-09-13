<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form method="post" action="reserve.shop">
	<input type="hidden" name="rnum" value="${rnum }">
	<input type="hidden" name="startDate" value="${startDate }">
	<input type="hidden" name="endDate" value="${endDate }">
	예약자 이름
	<input type="text" name="resName"/><br>
	휴대폰 번호
	<input type="text" name="resPhone"/>
	<br>
	계좌번호
	<select>
		<option>직접입력</option>
		<option>은행1</option>
		<option>은행2</option>
	</select><br>
	은행
	<input type="text" name="bank"><br>
	계좌번호
	<input type="text" name="accnum"><br>
	<input type="submit" value="예약하기">
</form>
<br><br><br><br>
숙박지이름: ${rb.aname }<br>
객실이름: ${rb.rname }<br>
주소: ${rb.addr }<br>
기간${rb.startDate } - ${rb.endDate }<br>
가격: ${rb.totalDate * rb.price }원
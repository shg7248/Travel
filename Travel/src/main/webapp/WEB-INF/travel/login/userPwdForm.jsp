<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
</script>
<body>
	<h2>비밀번호 찾기</h2>

	<label for="email">이메일</label> <input type="text" class="form-control"
		name="userEmail1" id="userEmail1" placeholder="이메일"> <select
		class="form-control" name="userEmail2" id="userEmail2">
		<option>@naver.com</option>
		<option>@daum.net</option>
		<option>@gmail.com</option>
		<option>@hanmail.com</option>
		<option>@yahoo.co.kr</option>
	</select>
	<button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
	<input class="form-control mail-check-input"
		placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
	<span id="mail-check-warn"></span>
</body>
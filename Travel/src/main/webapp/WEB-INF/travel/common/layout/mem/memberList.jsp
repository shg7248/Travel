<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/sidebar.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	window.onload = function start() {
		var arr = new Array;
		arr[0] = "memberInfo.mem";
		arr[1] = "pwdUpdate.mem";
		arr[2] = "memberAccount.mem";
		arr[3] = "bookingList.mem";
		arr[4] = "memberPoint.mem";

		//현재주소
		url = location.href;
		
		//주소에 맞게 백그라운드
		$.each(arr,function(index){
			if (url.indexOf(arr[index]) != -1) {
				//해당주소 css
				$('.list:eq('+index+')').css('background-color', '#ff0000');
				$('.list:eq('+index+') a').css('color', '#ffffff');
			}else{
				//나머지 css
				$('.list:eq('+index+') a').css('color', 'black');
			}
		});

	}
</script>

<!--Top menu -->
<div class="sidebar">
	<ul>
		<li class="list"><a href="memberInfo.mem">내정보 보기</a></li>
		<li class="list"><a href="pwdUpdate.mem">비밀번호 변경</a></li>
		<li class="list"><a href="memberAccount.mem">출금계좌 등록</a></li>
		<li class="list"><a href="bookingList.mem">예약 내역</a></li>
		<li class="list"><a href="memberPoint.mem">포인트 현황</a></li>
	</ul>
</div>







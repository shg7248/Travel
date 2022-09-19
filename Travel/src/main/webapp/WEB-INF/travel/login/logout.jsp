<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
window.load = function kakaoLogout() {
	//토큰확인
	if (!Kakao.Auth.getAccessToken()) {
		console.log('Not logged in.');
		alert("로그인 정보가 없습니다.");
		return;
	}
	//로그아웃
	Kakao.Auth.logout(function() {
		console.log(Kakao.Auth.getAccessToken());
	});
	//연결끊기
	Kakao.API.request({
		url : '/v1/user/unlink',
		success : function(response) {
			console.log(response);
		},
		fail : function(error) {
			console.log(error);
		}
	});
}
</script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	alert("로그아웃이 완료되었습니다.");
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	var uri = location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) )+"/";

	//메인으로 이동
	//location.href = uri;
})//ready
</script>
<%-- 
<% response.sendRedirect(request.getContextPath()+"/"); %>
 --%>
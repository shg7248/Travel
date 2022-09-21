<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	/* 
	//2a2af0084ddd5b6b3167da014e30faa3
	Kakao.init('2a2af0084ddd5b6b3167da014e30faa3');

	// SDK 초기화 여부를 판단합니다.
	console.log(Kakao.isInitialized());

		function kakaoLogout() {
			//토큰확인
			if (Kakao.Auth.getAccessToken()) {
				console.log('Not logged in.');
				
				//연결끊기
				Kakao.API.request({
					url : '/v1/user/unlink',
					success : function(response) {
						console.log(response);
						alert("로그아웃1");
					},
					fail : function(error) {
						console.log(error);
						alert("로그아웃 fail");
					}
				});
				//로그아웃
				Kakao.Auth.logout(function() {
					console.log(Kakao.Auth.getAccessToken());
					alert("로그아웃2");
				});

			}
			
		}
		 */
	alert("로그아웃이 완료되었습니다.");
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	var uri = location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) )+"/";
	
	
	//메인으로 이동
	location.href = uri;
})//ready
</script>
<%-- 
<% response.sendRedirect(request.getContextPath()+"/"); %>
 --%>
 <body>
 
 </body>
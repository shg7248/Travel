<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/sidebar.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	window.onload = function start() {
		var arr = new Array;
		arr[0] = "U";
		arr[1] = "H";
		arr[2] = "Cate";
		arr[3] = "Faci";
		arr[4] = "advert";
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
				$('.list:eq('+index+') a').css('color', '#ff8080');
			}
		});
	}
</script>

<div class="sidebar">
	<ul>
		<li class="list"><a href="Ulist.admin">사용자</a></li>
		<li class="list"><a href="Hlist.admin">사업자</a></li>
		<li class="list"><a href="Catelist.admin">카테고리</a></li>
		<li class="list"><a href="Facilist.admin">시설목록</a></li>
		<li class="list"><a href="advertisementlist.admin">광고목록</a></li>
	</ul>
</div>





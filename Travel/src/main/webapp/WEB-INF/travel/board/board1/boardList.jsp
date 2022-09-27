<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/sidebar.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	window.onload = function start() {
		var arr = new Array;
		arr[0] = "notice";
		arr[1] = "event";
		arr[2] = "faqlist.brd";
		arr[3] = "inqlist.brd";

		//현재주소
		url = location.href;
		
		//주소에 맞게 백그라운드
		for(index=0; index<arr.length; index++){
			if (url.includes(arr[index])) {
				//해당주소 css
				$('.list:eq('+index+')').css('background-color', '#ff0000');
				$('.list:eq('+index+')').css('color', '#ffffff');
				$('.list:eq('+index+') a').css('color', '#ffffff');
			}else{
				//나머지 css
				$('.list:eq('+index+') a').css('color', '#ff8080');
			}
		}
			

	}
</script>

<!--Top menu -->
<div class="sidebar">
	<ul>
		<li class="list"><a href="noticelist.brd">공지사항</a></li>
		<li class="list"><a href="eventlist.brd">이벤트</a></li>
		<li class="list"><a href="faqlist.brd">자주묻는 질문</a></li>
		<c:if test='<%=session.getAttribute("loginInfo")==null%>'>
			<li class="list"><a href="inqlist.brd">1대1 문의</a></li>
		</c:if>
	</ul>
</div>
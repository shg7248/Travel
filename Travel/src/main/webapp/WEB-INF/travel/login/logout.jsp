<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	alert("로그아웃이 완료되었습니다.");
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	var uri = location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) )+"/";
	
	location.href = uri;
});
</script>
<%-- 
<% response.sendRedirect(request.getContextPath()+"/"); %>
 --%>
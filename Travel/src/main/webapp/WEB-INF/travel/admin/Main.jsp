<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/sidebar.css">
    <link href="<%= request.getContextPath() %>/resources/css/admin.css" rel="stylesheet">
<!-- admin.Main.jsp<br> -->


<div class="sidebar">
<h2>회원, 시설 관리</h2>
<ul>
	<li class="list"><a href ="<%=request.getContextPath() +"/Ulist.admin"%>" style="color: rgb(255,128,128);">사용자</a></li>
	<li class="list"><a href="<%=request.getContextPath() +"/Hlist.admin"%>" style="color: rgb(255,128,128);">사업자</a></li>
	<li class="list"><a href="<%=request.getContextPath() +"/Catelist.admin"%>" style="color: rgb(255,128,128);">카테고리</a></li>
	<li class="list"><a href="<%=request.getContextPath() +"/Facilist.admin"%>" style="color: rgb(255,128,128);">시설목록</a></li>
</ul>
</div>







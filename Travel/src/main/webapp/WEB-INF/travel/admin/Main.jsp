<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- admin.Main.jsp<br> -->
<style>
	h1 {
	size: 200px;
}

</style>
<br><br>
<h1>회원관리</h1>

<li><a href="<%=request.getContextPath() +"/Ulist.admin"%>">사용자</a></li>

<li><a href="<%=request.getContextPath() +"/Hlist.admin"%>">사업자</a></li>

<br><br>
<h1 >코드관리</h1>

<li><a href="<%=request.getContextPath() +"/Catelist.admin"%>">카테고리</a></li>

<li><a href="<%=request.getContextPath() +"/Facilist.admin"%>">시설목록</a></li>

<br><br>









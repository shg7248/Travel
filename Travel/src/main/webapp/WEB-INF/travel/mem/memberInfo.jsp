<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>  
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">
<div class="all">
<%@include file="./memberList.jsp" %>

<div class="contents">
<div class="div">
<label for="name">이름</label>
<input type="text" name="name" id="name" value="${userInfo.name }"  disabled="disabled">
</div>

<div class="div">
<label for="email">이메일</label> 
<input type="text" name="email" id="email" value="${userInfo.email }" disabled="disabled">
<font id="checkMsg"></font>
</div>


<div class="div">
<label for="point">포인트</label>  
<input type="text" name="point" id="point" value="${userInfo.point }" disabled="disabled">
</div>

<input type="button" name="logout" id="logout" value="로그아웃" onclick="location.href='logout.log'">
<input type="button" name="memDelete" id="memDelete" value="회원탈퇴" onclick="location.href='confirm.mem'">
</div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">
MemberInfo.jsp
<%@include file="./memberList.jsp" %>
<div class="all">
<div class="div">
<label for="name">이름</label>
<input type="text" name="name" id="name" value="${loginInfo.name }"  disabled="disabled">
</div>

<div class="div">
<label for="email">이메일</label> 
<input type="text" name="email" id="email" value="${loginInfo.email }" disabled="disabled">
<font id="checkMsg"></font>
</div>


<div class="div">
<label for="pwd">비밀번호</label>  
<input type="text" name="pwd" id="pwd" value="${loginInfo.pwd }" disabled="disabled">
</div>

<input type="button" name="logout" id="logout" value="로그아웃" onclick="location.href='logout.mem'">
<input type="button" name="memDelete" id="memDelete" value="회원탈퇴" onclick="location.href='memDelete.mem'">
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>  
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">
<div class="all">
<%@ include file="/WEB-INF/travel/common/layout/mem/memberList.jsp" %>  
<div class="contents">
<div class="div">
<label for="name">이름</label>
<input type="text" name="name" id="name" value="${myInfo.name }"  disabled="disabled">
</div>

<div class="div">
<label for="email">이메일</label> 
<input type="text" name="email" id="email" value="${myInfo.email }" disabled="disabled">
<font id="checkMsg"></font>
</div>


<div class="div">
<label for="point">포인트</label>  
<input type="text" name="point" id="point" value="${myInfo.point }" disabled="disabled">
</div>

<div class="div">
<label for="phone">핸드폰</label>  
<input type="text" name="phone" id="phone" value="${userInfo.phone }" disabled="disabled">
</div>

<div class="div">
<label for="reg_date">가입일</label>  
<input type="text" name="reg_date" id="reg_date" value="${userInfo.reg_date }" disabled="disabled">
</div>

<input type="button" name="logout" id="logout" value="로그아웃" onclick="location.href='logout.log'">
<input type="button" name="memDelete" id="memDelete" value="회원탈퇴" onclick="location.href='confirm.mem'">
</div>
</div>

<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
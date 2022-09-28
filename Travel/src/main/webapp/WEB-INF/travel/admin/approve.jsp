<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file ="../common/common.jsp" %>
approve.jsp<br>
<center>


<h2>사업자 승인 페이지</h2>

${appr.image }
<br><br>
<a href="https://teht.hometax.go.kr/websquare/websquare.html?w2xPath=/ui/ab/a/a/UTEABAAA13.xml">[사업자등록상태 조회 바로가기]</a>
<br><br>
<form method="post" action="Comapprove.admin?cnum=${appr.cnum}" enctype="multipart/form-data">

<p>
	<input type="submit" value="승인하기" id="BtnSubmit">		
</p>
</form>

</center>
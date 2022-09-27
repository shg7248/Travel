<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file ="../common/common.jsp" %>
approve.jsp<br>

<td>
${appr.image }
</td>

<td><input value="사업자 등록증 확인" type="button" onclick="location.href='https://teht.hometax.go.kr/websquare/websquare.html?w2xPath=/ui/ab/a/a/UTEABAAA13.xml'"></td>

<form:form commandName="ApprUpdate" method="post" action="Comapprove.admin?cnum=${appr.cnum}" enctype="multipart/form-data">

<p>
	<input type="submit" value="승인하기" id="BtnSubmit">		
</p>
</form:form>








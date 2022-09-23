<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file ="../common/common.jsp" %>

ApprUpdate.jsp<br>

<form:form commandName="ApprUpdate" method="post" action="ApprUdate.admin" enctype="multipart/form-data">
<h1>승인하시겠습니까?</h1>

<p>
	<input type="submit" value="승인하기" id="BtnSubmit">		
</p>
</form:form>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/travel/common/common.jsp"%>
<%@include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>

<style>
.err {
	font-weight: bold;
	color: red;
}
</style>
inquiryInsertForm.jsp<br>
<center>
<form:form commandName="inquiry" method="post" action="inqinsert.brd">
<table>
	<tr>
		<td>
			<h2 align="center">1:1 문의사항</h2>
			제목 : <input type="text" name="subject" value=${inquiry.subject }>
			<form:errors cssClass="err" path="subject"/><br>
			
			내용 : <textarea name="question" rows="13" cols="50" style="resize:none">${inquiry.question }</textarea><br>
			<form:errors cssClass="err" path="question"/><br>
			<input type="submit" value="문의하기">
		</td>
	</tr>
</table>
</form:form>
</center>
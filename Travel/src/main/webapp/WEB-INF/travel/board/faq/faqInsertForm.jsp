<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/travel/common/common.jsp"%>
<style>
.err {
	font-weight: bold;
	color: red;
}
</style>
faqInsertForm.jsp<br>
<center>
<form:form commandName="faq" method="post" action="faqinsert.brd">
<table>
	<tr>
		<td>
			<h2 align="center">FAQ 입력하기</h2>
			질문 : <input type="text" name="question" value=${faq.question }>
			<form:errors cssClass="err" path="question"/><br>
			
			답변 : <textarea name="answer" rows="13" cols="50" style="resize:none">${faq.answer }</textarea><br>
			<form:errors cssClass="err" path="answer"/><br>
			<input type="submit" value="입력하기">
		</td>
	</tr>
</table>
</form:form>
</center>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/travel/common/common.jsp"%>
<%@include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>
<style>
.fq{
	cursor : pointer;
}
.fa{
	display : none;
}
</style>

<script>
$(document).ready(function(){
	$('.fq').click(function(){
		$(this).next().toggle('fast');
	});
});
</script>

<center>
<h2>자주 묻는 질문 FAQ</h2><br>
<form action="faqlist.brd" method="post">
	<select name="whatColumn">
		<option value="">전체 검색</option>
		<option value="question" <c:if test="${whatColumn eq 'question' }">selected</c:if>>제목</option>
		<option value="answer" <c:if test="${whatColumn eq 'answer' }">selected</c:if>>내용</option>
	</select>
	<input type="text" name="keyword" value="${keyword }">
	<input type="submit" value="검색">
</form>
	<table border="1" width="800">
		<tr>
			<td align="right" height="50">
			<c:if test="${email eq 'admin' }">
				<input type="button" value="추가하기" onclick="location.href='faqinsert.brd'">
			</c:if>
			</td>
		</tr>
		<c:forEach var="faq" items="${lists }">
		<tr height="50" class="fq">
			<td>${faq.question }</td>
		</tr>
		<tr class="fa">
			<td width="800">
			<pre style="word-wrap: break-word; white-space: pre-wrap;">${faq.answer }</pre><br>
			<c:if test="${email eq 'admin' }">
			<div align="right">
			<input type="button" value="수정하기" onclick="location.href='faqupdate.brd?fnum=${faq.fnum}'">
			<input type="button" value="삭제하기" onclick="location.href='faqdelete.brd?fnum=${faq.fnum}'">
			</div>
			</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
</center>
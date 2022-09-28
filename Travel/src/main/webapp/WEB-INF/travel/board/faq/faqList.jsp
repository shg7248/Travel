<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/travel/common/common.jsp"%>
<%@include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>
<link rel="stylesheet" href="${contextPath }/resources/css/board.css">

<style>
.fq{
	cursor : pointer;
}
.fa{
	display : none;
	border: 0px;
}
.search{
	display: flex;
	justify-content: space-between;
}
</style>

<script>
$(document).ready(function(){
	$('.fq').click(function(){
		$(this).next().toggle();
	});
});
</script>

<div class="default">
<%@include file="/WEB-INF/travel/board/board1/boardList.jsp" %>
<div class="contents">
<h2>자주묻는 질문 FAQ</h2>
<form action="faqlist.brd" method="post">
<div class="search">
	<select name="whatColumn">
		<option value="">전체 검색</option>
		<option value="question" <c:if test="${whatColumn eq 'question' }">selected</c:if>>제목</option>
		<option value="answer" <c:if test="${whatColumn eq 'answer' }">selected</c:if>>내용</option>
	</select>
	<input type="text" name="keyword" placeholder="키워드 검색" value="${keyword }">
	<input type="submit" value="검색">
</div>
</form><br>
	<c:if test="${email eq 'admin' }">
		<div class="right_button">
			<input type="button" value="추가하기" onclick="location.href='faqinsert.brd'">
		</div>
	</c:if>
	<table>
		<c:forEach var="faq" items="${lists }">
		<tr height="50" class="fq">
			<td class="title_td title">
			<c:if test="${fn:length(faq.question)>=60 }">
					${fn:substring(faq.question,0,60)}...
					</c:if>
					<c:if test="${fn:length(faq.question)<60 }">
					${faq.question }
			</c:if>
			</td>
		</tr>
		<tr class="fa">
			<td width="800" class="inner_td">
			<pre class="pre_content" style="word-wrap: break-word; white-space: pre-wrap;">${faq.answer }</pre><br>
			<c:if test="${email eq 'admin' }">
			<div class="right_button">
			<input type="button" value="수정하기" onclick="location.href='faqupdate.brd?fnum=${faq.fnum}'">
			<input type="button" value="삭제하기" onclick="location.href='faqdelete.brd?fnum=${faq.fnum}'">
			</div>
			</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
</div>
</div>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
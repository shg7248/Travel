<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/comp/header.jsp" %>

<table class="accom-insert__form">
	<tr>
		<th>댓글 내용</th>
		<td>${replyBean.content }</td>
	</tr>
	<c:if test="${replyBean.reply eq null }">
		<tr>
			<th>
				답변
			</th>
			<td align="right">
				<form method="post" action="${contextPath }/comp/review/detail.comp">
					<input type="hidden" name="rvnum" value="${replyBean.rvnum }"/>
					<input type="hidden" name="pageNumber" value="${pageNumber }"/>
					<textarea name="reply" style="width: 600px; height: 300px; resize: none;" ></textarea>
					<input type="submit" value="작성"/>
				</form>
			</td>
		</tr>
	</c:if>
	
	<c:if test="${replyBean.reply ne null }">
		<tr>
			<th>답변 내용</th><td>${replyBean.reply }</td>
		</tr>
	</c:if>
	<tr>
		<td colspan="2" align="right"><input type="button" value="목록으로" onclick='location.href="${contextPath }/comp/review/list.comp?pageNumber=${pageNumber }"'/></td>
	</tr>

</table>
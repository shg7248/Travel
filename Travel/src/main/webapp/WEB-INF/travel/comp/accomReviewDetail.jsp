<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/comp/header.jsp" %>
${replyBean.rvnum }
${replyBean.content }

<c:if test="${replyBean.reply eq null }">
	<form method="post" action="${contextPath }/comp/review/detail.comp">
		<input type="hidden" name="rvnum" value="${replyBean.rvnum }"/>
		<input type="hidden" name="pageNumber" value="${pageNumber }"/>
		<textarea name="reply"></textarea>
		<input type="submit" value="작성"/>
	</form>
</c:if>

<c:if test="${replyBean.reply ne null }">
	${replyBean.reply }
</c:if>
<input type="button" value="목록으로" onclick='location.href="${contextPath }/comp/review/list.comp?pageNumber=${pageNumber }"'/>
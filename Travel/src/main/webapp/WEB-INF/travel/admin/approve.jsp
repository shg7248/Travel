<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ include file ="../common/common.jsp" %>
approve.jsp<br>

<c:forEach items="${lists}" var="u">
<div>

${u.image }
</div>

<input type="button" value="����" onclick="${u.approyn}">

</c:forEach>
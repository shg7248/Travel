<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file ="../common/common.jsp" %>
approve.jsp<br>

<td>
${appr.image }
</td>



<form:form commandName="ApprUpdate" method="post" action="Comapprove.admin?cnum=${appr.cnum}" enctype="multipart/form-data">

<p>
	<input type="submit" value="승인하기" id="BtnSubmit">		
</p>
</form:form>







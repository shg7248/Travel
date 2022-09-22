<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/travel/common/common.jsp"%>
<%@include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>
<link rel="stylesheet" href="${contextPath }/resources/css/board.css">

<style>
.err {
	font-weight: bold;
	color: red;
}
</style>

<div class="default">
<div class="contents">
<form:form commandName="faq" method="post" action="faqinsert.brd">
<h2 align="center">FAQ 입력하기</h2>
<table>
	<tr>
		<td>
			<input type="text" name="question" placeholder="질문을 입력하세요." value="${faq.question }">
			<form:errors cssClass="err" path="question"/><br>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<textarea name="answer" id="answer">${faq.answer }</textarea><br>
			<form:errors cssClass="err" path="answer"/><br>
			<div align="right">
			<input type="submit" id="submit" value="입력하기">
			</div>
		</td>
	</tr>
</table>
</form:form>
</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
var oEditors = [];

   nhn.husky.EZCreator.createInIFrame({
      oAppRef: oEditors,
      elPlaceHolder: "answer",
      sSkinURI: "<%=request.getContextPath()%>/resources/se2/SmartEditor2Skin.html",  
      htParams : {
          bUseToolbar : true,             
          bUseVerticalResizer : false,     
          bUseModeChanger : false,
          fOnBeforeUnload : function(){}
      }
      });
   
   $("#submit").click(function() {
	   oEditors.getById["answer"].exec("UPDATE_CONTENTS_FIELD", []);
	});
});
</script>
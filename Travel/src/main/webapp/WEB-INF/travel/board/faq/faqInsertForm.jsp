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
<form:form commandName="faq" name="f" method="post" action="faqinsert.brd">
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
		</td>
	</tr>
</table>
<div class="right_button">
<input type="submit" id="submit" value="입력하기">
</div>
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
	   if($('input[name="question"]').val()==""){
		   alert('질문을 입력해주세요');
		   f.question.focus();
			return false;
		} 
	   $("#subjectCheck").hide();
	   oEditors.getById["answer"].exec("UPDATE_CONTENTS_FIELD", []);
	   var answer = $("#answer").val();
	   if( answer == ""  || answer == null || answer == '&nbsp;' || answer == '<p>&nbsp;</p>' || answer =='<br>')  {
           alert("내용을 입력하세요.");
           oEditors.getById["answer"].exec("FOCUS");
           return false;
      }
	});
});
</script>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
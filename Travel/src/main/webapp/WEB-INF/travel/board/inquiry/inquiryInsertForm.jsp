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
<h2>1:1 문의사항</h2>
<form:form commandName="inquiry" name="f" method="post" action="inqinsert.brd">
<table>
	<tr>
		<td>
			<input type="text" name="subject" placeholder="제목을 입력하세요." value=${inquiry.subject }>
			<form:errors cssClass="err" path="subject"/><br>
			
			<textarea name="question" id="question">${inquiry.question }</textarea>
			<form:errors cssClass="err" path="question"/>
			<div align="right">
			<input type="submit" id="submit" value="문의하기">			
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
      elPlaceHolder: "question",
      sSkinURI: "<%=request.getContextPath()%>/resources/se2/SmartEditor2Skin.html",  
      htParams : {
          bUseToolbar : true,             
          bUseVerticalResizer : false,     
          bUseModeChanger : false,
          fOnBeforeUnload : function(){}
      }
      });
   
   $("#submit").click(function() {
	   if($('input[name="subject"]').val()==""){
		   alert('제목을 입력해주세요');
		   f.subject.focus();
			return false;
		} 
	   oEditors.getById["question"].exec("UPDATE_CONTENTS_FIELD", []);
	   var question = $("#question").val();
	   if( question == ""  || question == null || question == '&nbsp;' || question == '<p>&nbsp;</p>' || question =='<br>')  {
           alert("내용을 입력하세요.");
           oEditors.getById["question"].exec("FOCUS");
           return false;
      }
	});
});
</script>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
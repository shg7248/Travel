<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/travel/common/common.jsp"%>
<%@include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>
<link rel="stylesheet" href="${contextPath }/resources/css/board.css">

<style>
.err {
	font-weight: bold;
	color: red;
	text-align: left;
}
</style>

<div class="default">
<div class="contentsnotcenter">
<form name="f" method="post" action="insertnotice.brd" enctype="multipart/form-data">
	<h2 align="center">공지사항 입력</h2>
	<div class="">
		<input type="hidden" name="type" value="notice">
		<input type="text" class="non_table_input_text" name="subject" placeholder="제목을 입력하세요" value="${board1.subject }">
		<font id="subjectCheck" class="err" ></font>
		
		<textarea name="content" id="content">${board1.content }</textarea><br>
		<font id="contentCheck" class="err" ></font>
		<div class="right_button">
		<input type="submit" id="submit" value="입력하기">
		</div>
	</div>
</form>
</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
var oEditors = [];

   nhn.husky.EZCreator.createInIFrame({
      oAppRef: oEditors,
      elPlaceHolder: "content",
      sSkinURI: "<%=request.getContextPath()%>/resources/se2/SmartEditor2Skin.html",  
      htParams : {
          bUseToolbar : true,             
          bUseVerticalResizer : false,     
          bUseModeChanger : false,
          fOnBeforeUnload : function(){}
      }
      });
   
   $("#submit").click(function() {
	   $("#subjectCheck").hide();
	   $("#contentCheck").hide();
	   
	   if($('input[name="subject"]').val()==""){
	 		$('#subjectCheck').text('제목을 입력해주세요');
	 		$("#subjectCheck").show();
	 		f.subject.focus();
			return false;
		} 
	   
	   oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	   var content = $("#content").val();
	   if( content == ""  || content == null || content == '&nbsp;' || content == '<p>&nbsp;</p>' || content =='<br>')  {
		   $('#contentCheck').text('내용을 입력해주세요');
		   $("#contentCheck").show();
		   f.content.focus();
           return false;
      }
	});
   
});
</script>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
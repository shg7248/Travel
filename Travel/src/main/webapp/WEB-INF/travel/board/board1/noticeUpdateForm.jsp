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
<div class="contentsnotcenter">
<form name="f" method="post" action="noticeupdate.brd" enctype="multipart/form-data">
<input type="hidden" name="pageNumber" value="${pageNumber }">
	<h2 align="center">공지사항 수정</h2>
	<input type="hidden" name="nnum" value="${board1.nnum }">
	
	<input type="text" name="subject" placeholder="제목을 입력하세요." value="${board1.subject }">
	<font id="subjectCheck" class="err" ></font>
	
	<textarea name="content" id="content"><c:out value="${board1.content}" /></textarea><br>
	<font id="contentCheck" class="err" ></font>
	<div class="right_button">
	<input type="submit" id="submit" value="수정하기">
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
	   $("#subjectCheck").hide();
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
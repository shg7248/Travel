<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file ="../common/common.jsp" %>
CateInsertForm.jsp<br>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">
<script type="text/javascript">
$(document).ready(function(){
	
});

function checkAdmin(){
 	if($('input[name="caname"]').val()==""){
 		$('#checkCname').text('카테고리 이름을 입력해 주세요.');
		c.caname.focus();
		return false;
	} 
 	if($('input[name="url"]').val()==""){
 		$('#checkUrl').text('URL을 입력해 주세요.');
		c.url.focus();
		return false;
	} 
 	if($('input[name="cagroup"]').val()==""){
 		$('#checkCagroup').text('카테고리 그룹을 입력해 주세요.');
		c.cagroup.focus();
		return false;
	} 
};

</script>

<style>
.err{
 font-size:10px;
 color: red;
 font-weight: bold;
}
</style>

<form name="c"  method="post" action="Cateinsert.admin" enctype="multipart/form-data">
	<h1><span>상품 추가 화면</span></h1>
	<p>
		<label for="caname">카테고리 이름</label>
		<input type="text" name="caname" id="caname" value="${cate.caname }" >
		<font id="checkCname" class="err" ></font>
	</p>
	<p>
		<label for="url">URL</label>
		<input type="text" name="url" id="url" value="${cate.url}">
		<font id="checkUrl" class="err" ></font>
		</p>
		
		<p>
		<label for="cagroup">카테고리 그룹</label>
		<input type="text" name="cagroup" id="cagroup" value="${cate.cagroup}">
		<font id="checkCagroup" class="err" ></font>
		</p>
	<p>
		<input type="submit" value="추가하기" id="BtnSubmit" onclick="return checkAdmin()">		
	</p>
	
</form>
	

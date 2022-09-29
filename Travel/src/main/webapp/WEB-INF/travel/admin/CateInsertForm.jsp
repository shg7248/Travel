<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %> 
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">
<%@ include file ="../common/common.jsp" %>
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
<div class="all">
<%@ include file ="Main.jsp" %>
<form name="c"  method="post" action="Cateinsert.admin" enctype="multipart/form-data">
	<h2>상품 추가 화면</h2>
	<div class="div">
		<label for="caname">카테고리 이름</label>
		<input type="text" name="caname" id="caname" value="${cate.caname }" >
		<font id="checkCname" class="err" ></font>
	</div>
	<div class="div">
		<label for="url">URL</label>
		<input type="text" name="url" id="url" value="${cate.url}">
		<font id="checkUrl" class="err" ></font>
		</div>
		
		<div class="div">
		<label for="cagroup">카테고리 그룹</label>
		<input type="text" name="cagroup" id="cagroup" value="${cate.cagroup}">
		<font id="checkCagroup" class="err" ></font>
		</div>
		<input type="submit" value="추가하기" id="BtnSubmit" onclick="return checkAdmin()">		
	
</form>
	
</div>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
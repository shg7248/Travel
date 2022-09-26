<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file ="../common/common.jsp" %>
FaciUpdateForm.jsp<br>
   
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">
<script type="text/javascript">
$(document).ready(function(){
	
});

function checkFaci(){
 	if($('input[name="fgroup"]').val()==""){
 		$('#checkFgroup').text('카테고리 이름을 입력해 주세요.');
		f.fgroup.focus();
		return false;
	} 
 	if($('input[name="fnum"]').val()==""){
 		$('#checkFnum').text('시설번호를 입력해 주세요.');
		f.fnum.focus();
		return false;
	} 
 	if($('input[name="name"]').val()==""){
 		$('#checkname').text('시설이름을 입력해 주세요.');
		f.name.focus();
		return false;
	} 
};

</script>

<style>
	.err {
		font-size: 10px;
		font-weight: bold;
		color: red; 
	}
</style>

<style>
	.option {
		font-size: 15px;
		font-weight: bold;
		color: black; 
	}
</style>

<form method="post" action="Faciupdate.admin" enctype="multipart/form-data">
	<h1><span>시설 수정 화면</span></h1>
	<input type="hidden" name="fno" value="${faci.fno }">
	<input type="hidden" name="pageNumber" value="${pageNumber }">
	
	<p>
	<label for="fgroup">시설 그룹</label>
	<input type="text" name="fgroup" id="fgroup" value="${faci.fgroup}">
	<font id="checkFgroup" class="err" ></font>
	</p>
	
	<p>
		<label for="fnum">시설 번호</label>
		<input type="text" name="fnum" id="fnum" value="${faci.fnum }">
		<font id="checkFnum" class="err" ></font>
	</p>
	
	<p>
		<label for="name">시설 이름</label>
		<input type="text" name="name" id="name" value="${faci.name }">
<<<<<<< HEAD
		<font id="checkname" class="err" ></font>
=======
>>>>>>> branch 'dev' of https://github.com/shg7248/Travel.git
	</p>
	
	
	
	<p>
		<input type="submit" value="수정하기" id="BtnSubmit" onclick="return checkFaci()">		
	</p>
	
</form>
	

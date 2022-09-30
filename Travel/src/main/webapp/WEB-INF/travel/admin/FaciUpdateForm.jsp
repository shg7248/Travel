<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %> 
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">
<%@ include file ="../common/common.jsp" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
});

function checkFaci(){
	
	if($('input[name="fgroup"]').val()==""){
 		$('#checkFgroup').text('시설그룹을 입력해 주세요.');
		f.fgroup.focus();
		return false;
	} 
	if($('input[name="fgroup"]').val()!='F1'&&$('input[name="fgroup"]').val()!='F2'){
 		$('#checkFgroup').text('F1이나F2로 입력해주세요.');
		f.fgroup.focus();
		return false;
	} 
 	if($('input[name="fnum"]').val()==""){
 		$('#checkFnum').text('시설번호를 입력해 주세요.');
		f.fnum.focus();
		return false;
	} 
 	if($('input[name="name"]').val()==""){
 		$('#checkName').text('시설이름을 입력해 주세요.');
		f.name.focus();
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

 .option{
font-size:15px;
 color: black;
 font-weight: bold;

} 
</style>
<div class="all">
<%@ include file ="Main.jsp" %>
<div class="one height">
<form name="f" method="post" action="Faciupdate.admin" enctype="multipart/form-data">
	<h2>시설 수정 화면</h2>
	<input type="hidden" name="fno" value="${faci.fno }">
	<input type="hidden" name="pageNumber" value="${pageNumber }">
	
	<div class="div">
		<label for="fgroup">시설 그룹</label>
		<input type="text" name="fgroup" id="fgroup" value="${faci.fgroup }">
		<font id="checkFgroup" class="err" ></font>
	</div>
	
	<div class="div">
		<label for="fnum">시설 번호</label>
		<input type="text" name="fnum" id="fnum" value="${faci.fnum }">
		<font id="checkFnum" class="err" ></font>
	</div>
	
	<div class="div">
		<label for="name">시설 이름</label>
		<input type="text" name="name" id="name" value="${faci.name }">
		<font id="checkName" class="err" ></font>
	</div>
	
	
	
	<p>
		<input type="submit" value="수정하기" id="BtnSubmit" onclick="return checkFaci()">		
	</p>
	
</form>
</div>
</div>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
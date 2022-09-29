<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %> 
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">
<%@ include file ="../common/common.jsp" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">
<script type="text/javascript">
/* $(document).ready(function(){
	
});

function checkFaci(){
	if($('select option:selected').val()==""){
 		$('#checkFgroup').text('시설그룹을 입력해 주세요.');
		f.fgroup.focus();
		return false;
	} 
 	if($('input[name="fnum"]').val()==""){
 		$('#checkFnum').text('시설번호 입력해 주세요.');
		f.fnum.focus();
		return false;
	} 
 	if($('input[name="name"]').val()==""){
 		$('#checkName').text('시설이름을 입력해 주세요.');
		f.name.focus();
		return false;
	} 
}; */

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
<div class="contents">
<form name="f" method="post" action="Faciinsert.admin" enctype="multipart/form-data">
	<div class="div">
	<h2>시설 추가 화면</h2>
	</div>
	<div class="div">
		<select class="option"  name="fgroup">
		<option  value="">시설그룹 선택</option>
			<c:forEach var="item" items="${lists }">
				<option value="${item.fnum }">${item.name } (${item.fnum })</option>
			</c:forEach>
		</select>
		<font id="checkFgroup" class="err" ></font>
	</div>
	
	
	<div class="div">
		<label for="fnum">시설번호</label>
		<input type="text" name="fnum" id="fnum" value="${faci.fnum }">
		<font id="checkFnum" class="err" ></font>
	</div>
	<div class="div">
		<label for="name">시설이름</label>
		<input type="text" name="name" id="name" value="${faci.name}">
		<font id="checkName" class="err" ></font>
	</div>
		
			
	
		
		<input type="submit" value="추가하기" id="BtnSubmit" onclick="return checkFaci()">		

</form>
</div>
</div>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
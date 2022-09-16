<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file ="../common/common.jsp" %>
FaciInsertForm.jsp<br>
   
<style>
	.err {
		font-size: 9px;
		font-weight: bold;
		color: red; 
	}
</style>

<form:form commandName="faci" method="post" action="faciinsert.admin" enctype="multipart/form-data">
	<h1><span>상품 추가 화면</span></h1>
	<p>
		<label for="fnum">시설번호</label>
		<input type="text" name="fnum" id="fnum" value="${faci.fnum }">
	</p>
	<p>
		<label for="name">시설이름</label>
		<input type="text" name="name" id="name" value="${faci.name}">
		</p>
		
		<p>
		<label for="fgroup">카테고리 그룹</label>
		<input type="text" name="fgroup" id="fgroup" value="${faci.fgroup}">
		</p>
	<p>
		<input type="submit" value="추가하기" id="BtnSubmit">		
	</p>
	
</form:form>
	

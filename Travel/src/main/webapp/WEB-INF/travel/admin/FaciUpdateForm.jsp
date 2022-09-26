<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file ="../common/common.jsp" %>
FaciUpdateForm.jsp<br>
   


<form:form commandName="faci" method="post" action="Faciupdate.admin" enctype="multipart/form-data">
	<h1><span>시설 수정 화면</span></h1>
	<input type="hidden" name="fno" value="${faci.fno }">
	<input type="hidden" name="pageNumber" value="${pageNumber }">
	
	<p>
	<label for="fgroup">시설 그룹</label>
	<input type="text" name="fgroup" id="fgroup" value="${faci.fgroup}">
	</p>
	
	<p>
		<label for="fnum">시설 번호</label>
		<input type="text" name="fnum" id="fnum" value="${faci.fnum }">
	</p>
	
	<p>
		<label for="fname">시설 이름</label>
		<input type="text" name="fname" id="fname" value="${faci.fname }">
	</p>
	
	
	
	<p>
		<input type="submit" value="수정하기" id="BtnSubmit">		
	</p>
	
</form:form>
	

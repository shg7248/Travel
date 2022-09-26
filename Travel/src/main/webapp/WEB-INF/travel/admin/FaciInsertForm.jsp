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

<form:form commandName="faci" method="post" action="Faciinsert.admin" enctype="multipart/form-data">
	<h1><span>시설 추가 화면</span></h1>

	<p>
		<select name="fgroup">
			<c:forEach var="item" items="${lists }">
				<option value="${item.fnum }">${item.fname } (${item.fnum })</option>
			</c:forEach>
		</select>
	</p>
	
	
	<p>
		<label for="fnum">시설번호</label>
		<input type="text" name="fnum" id="fnum" value="${faci.fnum }">
		
	</p>
	<p>
		<label for="fname">시설이름</label>
		<input type="text" name="fname" id="fname" value="${faci.fname}">
	</p>
		
			
	
		
	<p>
		<input type="submit" value="추가하기" id="BtnSubmit">		
	</p>

</form:form>


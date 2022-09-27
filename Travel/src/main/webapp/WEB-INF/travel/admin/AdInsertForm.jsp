<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<form name="c"  method="post" action="Adinsert.admin" enctype="multipart/form-data">
	<h1><span>광고 추가 화면</span></h1>
	<p>
		<label for="adname">광고 이름</label>
		<input type="text" name="adname" id="adname" value="${a.adname }" >
	</p>
	
	<p>
		<label for="adimage">광고 이미지</label>
		<input type="text" name="adimage" id="adimage" value="${a.adimage}">
	</p>
		
	<p>
		<label for="adcontents">광고 컨텐츠</label>
		<input type="text" name="adcontents" id="adcontents" value="${a.adcontents}">
	</p>
	
	<p>
		<input type="submit" value="추가하기" id="BtnSubmit">		
	</p>
	
</form>
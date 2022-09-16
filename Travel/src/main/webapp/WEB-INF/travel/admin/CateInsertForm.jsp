<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file ="../common/common.jsp" %>
CateInsertForm.jsp<br>
   
<style>
	.err {
		font-size: 9px;
		font-weight: bold;
		color: red; 
	}
</style>

<form:form commandName="cate" method="post" action="Cateinsert.admin" enctype="multipart/form-data">
	<h1><span>상품 추가 화면</span></h1>
	<p>
		<label for="caname">카테고리 이름</label>
		<input type="text" name="caname" id="caname" value="${cate.caname }">
	</p>
	<p>
		<label for="url">URL</label>
		<input type="text" name="url" id="url" value="${cate.url}">
		</p>
		
		<p>
		<label for="cagroup">카테고리 그룹</label>
		<input type="text" name="cagroup" id="cagroup" value="${cate.cagroup}">
		</p>
	<p>
		<input type="submit" value="추가하기" id="BtnSubmit">		
	</p>
	
</form:form>
	

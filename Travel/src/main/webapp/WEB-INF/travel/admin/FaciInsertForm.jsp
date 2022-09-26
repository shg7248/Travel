<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file ="../common/common.jsp" %>
FaciInsertForm.jsp<br>

<form name="f" method="post" action="Faciinsert.admin" enctype="multipart/form-data">
	<h1><span>시설 추가 화면</span></h1>

	<p>
		<select class="option" name="fgroup">
			<c:forEach var="item" items="${lists }">
<<<<<<< HEAD
				<option class="option" value="${item.fnum }">${item.name } (${item.fnum })</option>
=======
				<option value="${item.fnum }">${item.name } (${item.fnum })</option>
>>>>>>> branch 'dev' of https://github.com/shg7248/Travel.git
			</c:forEach>
		</select>
	</p>
	
	
	<p>
		<label for="fnum">시설번호</label>
		<input type="text" name="fnum" id="fnum" value="${faci.fnum }">
	</p>
	<p>
		<label for="name">시설이름</label>
		<input type="text" name="name" id="name" value="${faci.name}">
	</p>
		
		
	<p>
		<input type="submit" value="추가하기" id="BtnSubmit" >		
	</p>

</form>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	function insert(){
		location.href="registerForm.mem";
		//MemberRegisterController => memberRegisterForm.jsp
	}
</script>
memberList.jsp <br>
<%@ include file ="../common/common.jsp" %>
    <center>
    <h1>회원 리스트 화면</h1>
   <form action="list.mem" method="get">
	   	<select name="whatColumn">
	   		<option value="">전체검색</option>
	   		<option value="name">이름</option>
	   		<option value="gender">성별</option>
	   		<option value="hobby">취미</option>
	   	</select>
	   	<input type="text" name="keyword">
	   	<input type="submit" value="검색">
   </form>
   	<table border="1">
   		<tr>
   			<td colspan="9">
   			<input type="button" value="추가하기" onClick="insert()">
   			</td>
   		</tr>
   		
   		<tr>
   			<td>ID</td>
   			<td>이름</td>
   			<td>비번</td>
   			<td>성별</td>
   			<td>취미</td>
   			<td>주소</td>
   			<td>포인트</td>
   			<td>삭제</td>
   			<td>수정</td>
   		</tr>
		<c:forEach var="m" items="${lists }">
	   		<tr>
	   			<td>${m.id }</td>
	   			<td>${m.name }</td>
	   			<td>${m.password }</td>
	   			<td>${m.gender }</td>
	   			<td>${m.hobby }</td>
	   			<td>${m.address1 }&${m.address2}</td>
	   			<td>${m.mpoint }</td>
	   			<td><a>삭제</a></td>
	   			<td><input type="button" value="수정"></td>
	   		</tr>
   		</c:forEach>
   	</table>
   	</center>
   	<center>
   	${pageInfo.pagingHtml }
   	</center>


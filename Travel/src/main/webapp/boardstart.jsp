<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<a href="noticelist.brd">공지사항</a>
<a href="eventlist.brd">이벤트</a>
<a href="insert.brd">이벤트/공지사항 삽입</a>
<a href="">자주묻는 질문</a>
<a href="inqlist.brd">1대1문의</a>

<script type="text/javascript">
	function logout(){
		location.href="<%=request.getContextPath() %>/logout.jsp"
	}
	function admin(){
		location.href="<%=request.getContextPath() %>/admin.jsp"
	}
	function other(){
		location.href="<%=request.getContextPath() %>/other.jsp"
	}
	function other2(){
		location.href="<%=request.getContextPath() %>/other2.jsp"
	}
</script>
<input type="button" value="로그아웃" onclick="logout()">
<input type="button" value="admin로 로그인" onclick="admin()">
<input type="button" value="other로 로그인" onclick="other()">
<input type="button" value="other2로 로그인" onclick="other2()">

<!-- 로그인시 email과 mnum 세션으로 올려줘야한다 !!-->
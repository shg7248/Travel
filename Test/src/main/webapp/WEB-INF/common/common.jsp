<%@page import="member.model.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- common\common.jsp -->

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- 
<%MemberBean member=(MemberBean)session.getAttribute("loginInfo"); %>
접속자 아이디 : <%=member.getId()%>
 --%>
 
접속자 아이디 : ${loginInfo.id } <br>
접속자 아이디 : ${sessionScope.loginInfo.id } <br><br>

 
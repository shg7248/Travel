<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
other.jsp<br>
<%
session.setAttribute("email", "qrzv123@naver.com");
session.setAttribute("mnum", "1");
response.sendRedirect("boardstart.jsp");
System.out.println(session.getAttribute("email"));
%>
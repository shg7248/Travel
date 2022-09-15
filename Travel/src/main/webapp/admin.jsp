<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
admin.jsp<br>
<%
session.setAttribute("email", "admin");
session.setAttribute("mnum", "0");
response.sendRedirect("boardstart.jsp");
System.out.println(session.getAttribute("email"));
%>
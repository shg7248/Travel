<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
<c:set var="page" value="${fn:substring(path, 1, 3) }" />

<!-- script -->
<script src="${contextPath }/resources/js/jquery-2.0.2.js"></script>
<script src="${contextPath }/resources/se2/js/HuskyEZCreator.js"></script>
<script src="${contextPath }/resources/js/common.js"></script>

<!-- css -->
<link rel="stylesheet" href="${contextPath }/resources/css/reset.css">
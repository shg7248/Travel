<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>
	<meta http-equiv="page-enter" content="blendTrans(duration=1000000)">
	<meta http-equiv="page-exit" content="blendTrans(duration=1000000)">
</head>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
<c:set var="page" value="${fn:substring(path, 1, 3) }" />

<!-- script -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7aa66b36bac14d52a5dbbdb09a9f4b5a&libraries=services,clusterer,drawing"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${contextPath }/resources/js/jquery-2.0.2.js"></script>
<script src="${contextPath }/resources/se2/js/HuskyEZCreator.js"></script>
<script src="${contextPath }/resources/js/common.js"></script>

<!-- css -->
<link rel="stylesheet" href="${contextPath }/resources/css/reset.css">





<style>
	#load {
	    width: 100%;
	    height: 100%;
	    top: 0;
	    left: 0;
	    position: fixed;
	    display: block;
	    opacity: 0.8;
	    background: white;
	    z-index: 999;
	    text-align: center;
	}
	
	#load > img {
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    z-index: 100;
	}
</style>
<%-- 
<div id="load">
    <img src="${contextPath }/resources/images/loading.gif" alt="loading">
</div>
<script>
	window.onload = function() {
		document.querySelector('#load').style.display = 'none';
		//$('#load').hide();    
		//$('#load').empty();  
	}
</script>
 --%>
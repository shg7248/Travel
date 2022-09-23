<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/common.jsp" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7aa66b36bac14d52a5dbbdb09a9f4b5a&libraries=services,clusterer,drawing"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="${contextPath }/resources/css/comp.css">
<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
<c:set var="page" value="${fn:substring(path, 6, 8) }" />

<div class="wrap">
	<header class="header">
	    <div class="logo"></div>
	    <nav class="nav">
	        <div class="nav__inner">
	            <ul class="nav__list">
	                <li class="nav__item"><a href="${contextPath }/comp/accom/detail.comp" class='nav__link <c:if test="${page eq 'ac' }">on</c:if>'>숙박지 정보</a></li>
	                <li class="nav__item"><a href="${contextPath }/comp/room/main.comp" class='nav__link <c:if test="${page eq 'ro' }">on</c:if>'>객실 관리</a></li>
	                <li class="nav__item"><a href="#" class="nav__link">객실이용 후기</a></li>
	                <li class="nav__item">
	                	<a href="#" class="nav__link">사업자 정보</a>
	            		<ul class="nav__list">
	            			<li class="nav__item"><a href="" class='nav-2dept__link'>수정</a></li>
	            			<li class="nav__item"><a href="" class='nav-2dept__link'>탈퇴</a></li>
	            		</ul>
	                </li>
	            	<li class="nav__item">
	            		<a href="#" class="nav__link">이동하기</a>
	            		<ul>
	            			<li class="nav__item"><a href="${contextPath }/" class='nav-2dept__link'>사용자 화면</a></li>
	            			<li class="nav__item"><a href="${contextPath }/logout.log" class='nav-2dept__link'>로그아웃</a></li>
	            		</ul>
	            	</li>
	            </ul>
	        </div>
	    </nav>
	</header>
	<main class="main">
		<section class="section">
			<div class="section__inner">
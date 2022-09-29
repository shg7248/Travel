<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/common.jsp" %>
<link rel="stylesheet" href="${contextPath }/resources/css/comp.css">
<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
<c:set var="page" value="${fn:substring(path, 6, 8) }" />
<div class="wrap">
	<header class="header">
	    <div class="logo">
	    	<img class="logo__image" src="${contextPath }/resources/images/Logo.png">
	    </div>
	    <img class="bindclib" src="${contextPath }/resources/images/bind.png">
	    <nav class="nav">
	        <div class="nav__inner">
	            <ul class="nav__list">
	                <li class="nav__item"><a href="${contextPath }/comp/accom/detail.comp" class='nav__link <c:if test="${page eq 'ac' }">on</c:if>'>숙박지 정보</a></li>
	                <li class="nav__item"><a href="${contextPath }/comp/room/main.comp" class='nav__link <c:if test="${page eq 'ro' }">on</c:if>'>객실 관리</a></li>
	                <li class="nav__item"><a href="${contextPath }/comp/review/list.comp" class="nav__link <c:if test="${page eq 're' }">on</c:if>">객실이용 후기</a></li>
	                <li class="nav__item">
	                	<a href="${contextPath }/comp/compInfo.comp" class="nav__link <c:if test="${page eq 'co' }">on</c:if>">사업자 정보</a>
	            		<ul class="nav__list">
<!-- 	            			<li class="nav__item"><a href="" class='nav-2dept__link'>수정</a></li>
	            			<li class="nav__item"><a href="" class='nav-2dept__link'>탈퇴</a></li> -->
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
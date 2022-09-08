<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/common.jsp" %>    
<link rel="stylesheet" href="${contextPath }/resources/css/comp.css">
<div class="wrap">
	<header class="header">
	    <div class="logo"></div>
	    <nav class="nav">
	        <div class="nav__inner">
	            <ul class="nav__list">
	                <li class="nav__item"><a href="${contextPath }/1/compDetail.comp" class='nav__link <c:if test="${page eq '1' }">on</c:if>'>숙박지 정보</a></li>
	                <li class="nav__item"><a href="#" class="nav__link">객실 관리</a></li>
	                <li class="nav__item"><a href="#" class="nav__link">객실이용 후기</a></li>
	            </ul>
	        </div>
	    </nav>
	</header>

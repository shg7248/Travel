<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/common.jsp" %>
<link rel="stylesheet" href="${contextPath }/resources/css/shop.css"/>
<header class="header">
	<div class="header__inner">
		<div class="header__sub-menu">
			<ul class="sub-menu__list">
				<li class="sub-menu__item"><a href="userLoginForm.log">로그인</a></li>
				<li class="sub-menu__item"><a href="">예약내역</a></li>
				<li class="sub-menu__item">
					<a href="">더보기</a>
					<ul class="temp">
						<li><a href="noticelist.brd">공지사항</a></li>
						<li><a href="eventlist.brd">이벤트</a></li>
						<li><a href="faqlist.brd">자주묻는 질문</a></li>
						<li><a href="inqlist.brd">1대1 문의</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="logo">
		
		</div>
		<div class="search"></div>
		<nav class="main-nav">
			<div class="main-nav__inner">
				<ul class="main-nav__list">
					<li class="main-nav__item"><a class="main-nav__link" href="">주변검색</a></li>
					<li class="main-nav__item"><a class="main-nav__link" href="${contextPath }/shop/search/1.shop">모텔</a></li>
					<li class="main-nav__item"><a class="main-nav__link" href="${contextPath }/shop/search/2.shop">호텔</a></li>
					<li class="main-nav__item"><a class="main-nav__link" href="${contextPath }/shop/search/3.shop">펜션</a></li>
				</ul>
			</div>
		</nav>
	</div>
</header>
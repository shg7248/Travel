<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/common.jsp" %>
<link rel="stylesheet" href="${contextPath }/resources/css/shop.css"/>
<header class="header">
	<div class="header__inner">
		<div class="header__sub-menu">
			<ul class="sub-menu__list">
			<!-- 세션없음 -->
			<c:if test="${empty userInfo and empty loginInfo }">
				<li class="sub-menu__item"><a href="${contextPath }/userLoginForm.log">로그인</a></li>
				<li class="sub-menu__item"><a href="${contextPath }/bookingList.mem">예약내역</a></li>
			</c:if>
			<!-- 사용자 로그인 -->
			<c:if test="${!empty userInfo and userInfo.email ne 'admin' }">
				<li class="sub-menu__item"><a href="${contextPath }/bookingList.mem">예약내역</a></li>
				<li class="sub-menu__item"><a href="${contextPath }/memberInfo.mem">내정보</a></li>
			</c:if>
			<!-- 사업자 로그인 -->
			<c:if test="${!empty loginInfo }">
				<li class="sub-menu__item"><a href="${contextPath }/comp/accom/detail.comp">사업자페이지</a></li>
			</c:if>
			<c:if test="${!empty userInfo or !empty loginInfo }">
				<li class="sub-menu__item"><a href="${contextPath }/logout.log">로그아웃</a></li>
			</c:if>
			<!-- 관리자 로그인 -->
			<c:if test="${userInfo.email eq 'admin' }">
				<li class="sub-menu__item"><a href="${contextPath }/Ulist.admin">관리자페이지</a></li>
			</c:if>
			<!-- 공용 -->
				<li class="sub-menu__item">
					<a href="${contextPath }/noticelist.brd">더보기</a>
					<div class="sub-menu__more-info">
						<ul class="more-info__list">
							<li class="more-info__item"><a class="more-info__link" href="${contextPath }/noticelist.brd">공지사항</a></li>
							<li class="more-info__item"><a class="more-info__link" href="${contextPath }/eventlist.brd">이벤트</a></li>
							<li class="more-info__item"><a class="more-info__link" href="${contextPath }/faqlist.brd">자주묻는 질문</a></li>
							<c:if test='<%=session.getAttribute("loginInfo")==null%>'>
								<li class="more-info__item"><a class="more-info__link" href="${contextPath }/inqlist.brd">1대1 문의</a></li>
							</c:if>
						</ul>
					</div>
				</li>
			</ul>
		</div>
		<div class="logo" style="z-index: 1;">
			<a href="${contextPath }/"><img alt="" src="${contextPath }/resources/images/Logo.png"></a>
		</div>
		<div class="search"></div>
		<nav class="main-nav">
			<div class="main-nav__inner">
				<ul class="main-nav__list">
					<li class="main-nav__item"><a class="main-nav__link" href="${contextPath }/shop/around/1.shop">주변검색</a></li>
					<li class="main-nav__item"><a class="main-nav__link" href="${contextPath }/shop/search/1.shop">모텔</a></li>
					<li class="main-nav__item"><a class="main-nav__link" href="${contextPath }/shop/search/2.shop">호텔</a></li>
					<li class="main-nav__item"><a class="main-nav__link" href="${contextPath }/shop/search/3.shop">펜션</a></li>
				</ul>
			</div>
		</nav>
	</div>
</header>
<main class="main">
	<div class="main__inner">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>
<%@ include file="/WEB-INF/travel/common/common.jsp" %>

<a href="ownerLoginForm.log">사업자 로그인</a>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style>

.carousel-inner img{
	width: 100%;
	height: 300px;
	margin: 0 auto;
}
.inner{
	width:100%;
}
.inner img{
	width: 100%;
	height: 200px;
	margin: 0 auto;
}
.carousel-item, .active{
	width: 100%;
	}
.carousel, slide{
	width: 100%;
}
.noticesubjectlist{
	font-size : 20px;
	color: #747474;
}
.event-default{
	width: 100%;
	display: flex;
	flex-wrap: wrap;
}
.notice-default{
	width: 100%;
	display: flex;
	justify-content: space-around;
}
.notice-title{
	font-size:24pt;
	padding: 15px;
	padding-left: 0px;
}
.default-section{
	padding: 30px;
}
.small-section{
	margin : 0px;
	width: 50%;
	display: flex;
	justify-content: center;
	padding: 10px;
	border: 1px solid rgb(192,192,192);
	
}
</style>
<section class="default-section">
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
	
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 0"></button>
	    <c:if test="${fn:length(elists) >= 5 }">
		    <c:forEach var="i" varStatus="status" step="1" begin="1" end="4">
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${i }" aria-label="Slide ${i }"></button>
		    </c:forEach>
	    </c:if>
	    <c:if test="${fn:length(elists) < 5 }">
		    <c:forEach var="i" varStatus="status" step="1" begin="1" end="${fn:length(elists)-1}">
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${i }" aria-label="Slide ${i }"></button>
		    </c:forEach>
	    </c:if>
	  </div>
	  
	  <div class="carousel-inner">
		<div class="carousel-item active">
			<img src="<%= request.getContextPath() %>/resources/board1/${bb.content}" class="d-block" alt="0 slide">
		</div>
	  <c:forEach var="elists" items="${elists }" varStatus="status" begin="1">
		<div class="carousel-item">
			<img src="<%= request.getContextPath() %>/resources/board1/${elists.content}" class="d-block" alt="${status.count} slide">               
		</div>
		</c:forEach>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
</section>

<section class="default-section">
<div class="notice-title">공지사항</div>
<div class="notice-default">
	<c:forEach var="nlists" items="${nlists }" varStatus="status" end="2">
		<div class="noticesubjectlist"><a href="noticelist.brd">${nlists.subject }</a></div>
	</c:forEach>
</div>
</section>

<section class="default-section">
<div class="event-default">
<c:forEach var="elists" items="${elists }" varStatus="status" end="2">
	<section class="small-section">
	<div class="inner">
		<a href="eventdetail.brd?nnum=${elists.nnum }"><img src="<%= request.getContextPath() %>/resources/board1/${elists.content}"></a>
	</div>
	</section>
</c:forEach>
	
	<section class="small-section">
	<div class="inner">
		<a href="ownerLoginForm.log" class="inner"><img src="resources/board1/ownerLoginImage.png"></a>
	</div>
	</section>
</div>
</section>

<link rel="stylesheet" href="${contextPath }/resources/css/reset.css">
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>

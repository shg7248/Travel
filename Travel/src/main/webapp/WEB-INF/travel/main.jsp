<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>
<%@ include file="/WEB-INF/travel/common/common.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<style>
.default{
	width: 100%;
	height: 300px;
	display: flex;
	font-size:20px;
	font-weight:bold;
	justify-content: space-around;
	vertical-align: middle;
	background-color: rgb(192,192,192);
}
.carousel-inner img{
	width: 100%;
	height: 400px;
	margin: 0 auto;
}
.inner{
	width:100%;
	border: 1px solid rgb(192,192,192);
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
	font-size : 18px;
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
	padding: 10px 10px 10px 25px;
	background-color: rgb(192,192,192);
}
.title-default{
	font-size:22px;
	font-weight:bold;
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
}
body, html{
	background-color: #E0E7E9;
}
a:hover{
	color: white;
}
.inner_atag:hover{
	color: black;
}
</style>
	<c:if test="${ab ne null }">
	<section class="default-section">
		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
		
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 0"></button>
		    <c:if test="${fn:length(alists) >= 5 }">
			    <c:forEach var="i" varStatus="status" step="1" begin="1" end="4">
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${i }" aria-label="Slide ${i }"></button>
			    </c:forEach>
		    </c:if>
		    <c:if test="${fn:length(alists) < 5 }">
			    <c:forEach var="i" varStatus="status" step="1" begin="1" end="${fn:length(alists)-1}">
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${i }" aria-label="Slide ${i }"></button>
			</c:forEach>
		    </c:if>
		  </div>
		  
		  <div class="carousel-inner">
			<div class="carousel-item active">
				<img src="<%= request.getContextPath() %>/resources/images/advertisement/${ab.adimage}" class="d-block" alt="0 slide">
			</div>
		  <c:forEach var="alists" items="${alists }" varStatus="status" begin="1">
			<div class="carousel-item">
				<img src="<%= request.getContextPath() %>/resources/images/advertisement/${alists.adimage}" class="d-block" alt="${status.count} slide">               
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
	</c:if>
	<c:if test="${ab eq null }">
	<section class="default-section">
	<div class="default">
	광고 게재 준비중입니다.
	</div>
	</section>
	</c:if>
	<section class="default-section">
	<div class="title-default">공지사항</div>
		<c:forEach var="nlists" items="${nlists }" varStatus="status" end="2">
		<div class="notice-default">
				<div class="noticesubjectlist">
					<a class="inner_atag" href="noticedetail.brd?nnum=${nlists.nnum }">
						<c:if test="${fn:length(nlists.subject)>=30 }">
						${fn:substring(nlists.subject,0,30)}...
						</c:if>
						<c:if test="${fn:length(nlists.subject)<30 }">
						${nlists.subject }
						</c:if>
					</a>
					<span class="written-date" style="font-size: 14px;">
						<fmt:parseDate var="date" value="${nlists.reg_date }" pattern="yyyy-MM-dd" />
						<fmt:formatDate var="reg_date" value="${date }" pattern="yyyy.MM.dd" /> ${reg_date }
					</span>
				</div>
		</div>
		</c:forEach>
	</section>
	
	<section class="default-section">
	<div class="title-default">이벤트</div>
	<div class="event-default">
	<c:forEach var="elists" items="${elists }" varStatus="status" end="2">
		<section class="small-section">
		<div class="inner">
			<a href="eventdetail.brd?nnum=${elists.nnum }"><img src="<%= request.getContextPath() %>/resources/images/event/${elists.thumbnail}"></a>
		</div>
		</section>
	</c:forEach>
		
		<section class="small-section">
		<div class="inner">
			<a href="ownerLoginForm.log"><img src="resources/images/ownerLoginImage.png"></a>
		</div>
		</section>
	</div>
	</section>
<link rel="stylesheet" href="${contextPath }/resources/css/reset.css">
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>

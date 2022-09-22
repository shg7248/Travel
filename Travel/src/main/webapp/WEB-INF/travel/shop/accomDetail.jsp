<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>
<style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }
        a {
            color: black;
            text-decoration: none;
        }
        li {
            list-style: none;
        }
        .tab {
            --height: 50px;
            --border: 1px solid rgb(209 209 209);
        }
        .tab__list {
            width: 100%;
            display: flex;
            justify-content: space-around;
            border-left: var(--border);
            border-top: 2px solid red;
            border-bottom: var(--border);
        }
        .tab__item {
            position: relative;
            width: 100%;
            text-align: center;
            border-right: var(--border);
        }
        .tab__link {
            position: relative;
            height: var(--height);
            line-height: var(--height);
            display: inline-block;
            background-color: white;
            width: 100%;
            font-size: 20px;
        }
        .tab__link.on {
            color: red;
            height: calc(100% + 1px);
        }
        .tab__content {
            display: none;
        }

        .tab__content.on {
            display: block;
        }
        
        img {
        	width: 100%;
        }
</style>
<article>
	<img src="${contextPath }/resources/images/${accom.image }"/>
	${accom.name }
	${accom.info }
</article>


<div class="tab">
    <ul class="tab__list">
        <li class="tab__item"><a href="javascript: return false;" class="tab__link tab__link--1 on">객실목록</a></li>
        <li class="tab__item"><a href="javascript: return false;" class="tab__link tab__link--2">후기</a></li>
    </ul>
    <div class="tab__content on">
        <c:forEach var="room" items="${lists }">
			<div>
				${room.name }
				<a href="${contextPath }/shop/order.shop?rnum=${room.rnum }&startDate=${start }&endDate=${end }">예약하기</a>
			</div>
		</c:forEach>
    </div>
    <div class="tab__content">
        <input type="radio">★☆☆☆☆
        <input type="radio">★★☆☆☆
        <input type="radio">★★★☆☆
        <input type="radio">★★★★☆
        <input type="radio">★★★★★<br>
        <textarea rows="" cols="" style="width: 100%; height: 100px;" ></textarea>
    </div>
</div>
<script type="text/javascript">
	(function() {
	    const link = document.querySelectorAll('.tab__link');
	    const con = document.querySelectorAll('.tab__content')
	    
	    link.forEach((ele, i)=> {
	        ele.addEventListener('click', (e) =>{
	
	            document.querySelector('.tab__link.on').classList.toggle('on');
	            document.querySelector('.tab__content.on').classList.toggle('on');
	            
	            con[i].classList.toggle('on')
	            e.target.classList.toggle('on');
	        });
	    });
	}());
</script>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>
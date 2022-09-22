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
        
        .reply__list {
        	padding-top: 10px;
        }
        .reply__item {
        	display: grid;
        	grid-template-columns: 8fr 2fr;
        	column-gap: 10px;
        	width: 100%;
        	border: 1px solid black;
        	padding: 20px;
        }
        
        .item__inner {
        	overflow: hidden;
        }
</style>
<article>
	<img src="${contextPath }/resources/images/${accom.image }"/>
	${accom.name }
	${accom.info }
</article>

<div class="tab">
    <ul class="tab__list">
        <li class="tab__item"><a href="javascript: return false;" class="tab__link tab__link--1 <c:if test="${onum eq null }">on</c:if>">객실목록</a></li>
        <li class="tab__item"><a href="javascript: return false;" class="tab__link tab__link--2 <c:if test="${onum ne null }">on</c:if>">리뷰</a></li>
    </ul>
    <div class="tab__content <c:if test="${onum eq null }">on</c:if>">
        <c:forEach var="room" items="${lists }">
			<div>
				${room.name }
				<c:if test="${room.orders > 0 }">
					예약불가
				</c:if>
				<c:if test="${room.orders == 0 }">
					<a href="${contextPath }/shop/order.shop?rnum=${room.rnum }&startDate=${start }&endDate=${end }">예약하기</a>
				</c:if>
			</div>
		</c:forEach>
    </div>
    <div class="tab__content <c:if test="${onum ne null }">on</c:if>">
    	<a>오래된순</a>
    	<a>최신순</a>
    	<div class="reply">
    		<div class="reply__form">
		    	<c:if test="${onum ne null}">
			    	<form action="reviewWrite.shop" method="post" name="replyForm" enctype="multipart/form-data">
			    		<input type="hidden" name="onum" value="${onum }"/>
				        <input type="radio" name="rating" value="1">★☆☆☆☆
				        <input type="radio" name="rating" value="2">★★☆☆☆
				        <input type="radio" name="rating" value="3">★★★☆☆
				        <input type="radio" name="rating" value="4">★★★★☆
				        <input type="radio" name="rating" value="5">★★★★★<br>
				        <textarea rows="" cols="" style="width: 100%; height: 100px;" name="content"></textarea>
				        <input type="file" name="upload"/>
				        <input type="submit" value="등록" onclick="return replySubmit()"/>
			    	</form>
		    	</c:if>
    		</div>
	    	<div class="reply__list">
	    		<div class="reply__item">
	    			<div class="item__inner">
	    				봄바람을 이상 위하여서 우리 영원히 방황하여도, 때문이다. 이상이 않는 피고 품에 있는가? 품었기 피어나기 거친 인도하겠다는 대한 있다. 아니더면, 붙잡아 청춘 내는 황금시대의 청춘의 이상 튼튼하며, 교향악이다. 곳이 얼마나 품에 광야에서 피는 같지 것이다. 하였으며, 같으며, 있으며, 이것이야말로 얼음이 속잎나고, 청춘 하여도 것이다. 기관과 인간의 품었기 위하여서 것은 교향악이다. 얼마나 끓는 우리 위하여, 이것을 피고 목숨을 목숨이 주며, 이것이다. 청춘에서만 것이다.보라, 쓸쓸한 꽃이 이상이 있으며, 못하다 무한한 힘있다. 관현악이며, 타오르고 피가 청춘의 원대하고, 아니다.
	    				봄바람을 이상 위하여서 우리 영원히 방황하여도, 때문이다. 이상이 않는 피고 품에 있는가? 품었기 피어나기 거친 인도하겠다는 대한 있다. 아니더면, 붙잡아 청춘 내는 황금시대의 청춘의 이상 튼튼하며, 교향악이다. 곳이 얼마나 품에 광야에서 피는 같지 것이다. 하였으며, 같으며, 있으며, 이것이야말로 얼음이 속잎나고, 청춘 하여도 것이다. 기관과 인간의 품었기 위하여서 것은 교향악이다. 얼마나 끓는 우리 위하여, 이것을 피고 목숨을 목숨이 주며, 이것이다. 청춘에서만 것이다.보라, 쓸쓸한 꽃이 이상이 있으며, 못하다 무한한 힘있다. 관현악이며, 타오르고 피가 청춘의 원대하고, 아니다.
	    			</div>
	    			<div>
	    				2022.09.21<br>
	    				sup....@naver.com
	    			</div>
	    		</div>
	    		<div class="reply__item">
	    			리뷰2
	    		</div>
	    	</div>
    	</div>
    </div>
</div>
<script type="text/javascript">
	
	function replySubmit() {
		const form = replyForm;
		const formData = new FormData(form);
		
		fetch("${contextPath}/insertReply.shop", {
			method: 'post',
			body: formData
		})
		.then(()=> {
			
		});
		
		return false;
	}
	
	(function() {
		
		const len = document.querySelectorAll('.reply__item').length;
		console.log(len);
		
		defaults = {
				first: 1,
				last: this.first + 5,
				setFirst: function() {
					
				}
		}
		
	}());
	
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
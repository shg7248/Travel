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
        
        }
        .reply__item {
        	display: grid;
        	grid-template-columns: 8fr 2fr;
        	column-gap: 10px;
        	width: 100%;
        	border: 1px solid black;
        	padding: 20px;
        }
        
        .reply__info--content {
        	overflow: hidden;
        }
        
        .reply__info--writer {
        	display: flex;
        	flex-direction: column;
        	font-size: 11px;
        }
        
        .reply__info--addInfo {
        	width: 100%;
        	text-align: center;
        	border: 1px solid blue;
        	cursor: pointer;
        }
        
        .reply__order {
        	cursor: pointer;
        }
        
        .room_item {
        	border: 1px solid black;
        	height: 250px;
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
		<div class="room">
			<div class="room__list">
		        <c:forEach var="room" items="${lists }">
		        	<div class="room_item">
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
		</div>
    </div>
    <div class="tab__content <c:if test="${onum ne null }">on</c:if>">
    	<div class="reply">
    	    <a class="reply__order reply__order-asc" onclick="replyOrder(0)">오래된순</a>
    		<a class="reply__order reply__order-desc" onclick="replyOrder(1)">최신순</a>
		    	<c:if test="${onum ne null}">
	    			<div class="reply__form">
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
	    			</div>
		    	</c:if>
	    	<div class="reply__list"></div>
    	</div>
    </div>
</div>
<script type="text/javascript">
		
	let defaults = {
		pageNumber: 1,
		pageSize: 5,
		order: 1, // 0: asc / 1: desc
		addPageNumber: function() {
			this.pageNumber += 1;
		}
	};
	
	function reply() {
		
		const reply = document.querySelector('.reply');
		
		fetch("${contextPath}/getReply.shop", {
			method: 'post',
			headers: {
				'Content-Type': "application/json"
			},
			body: JSON.stringify({
				anum: '${accom.anum}',
				start: (defaults.pageNumber - 1) * defaults.pageSize + 1,
				end: defaults.pageNumber * defaults.pageSize,
				order: defaults.order
			})
		})
		.then((data)=> data.json())
		.then((data)=> {
		
				
			defaults.addPageNumber();
			
			const addInfo = document.querySelector('.reply__info--addInfo');
			if(addInfo) {
				document.querySelector('.reply__info--addInfo').remove();
			}
			
			const reply__list = document.createElement('div');
			reply__list.classList.add('reply__list');
			
			let reply__item = ``;
			
			if(data.totalCount == 0) {
				reply_item = "등록된 리뷰가 없습니다";
				reply.append(reply_item);
			}
			else {
				data.lists.forEach((obj, i)=> {
					reply__item += `<div class="reply__item">`;
					reply__item += `<div class="reply__info--content">`;
					reply__item += obj.content
					reply__item += `</div>`;
					reply__item += `<div class="reply__info--writer">`;
					reply__item += `<span>` + obj.reg_date + `</span>`;
					reply__item += `<span>`+ obj.rname +`</span>`;
					reply__item += `<span>` + obj.email + `</span>`;
					reply__item += `<span>` + obj.rating + `</span>`;
					reply__item += `</div></div>`
				});
				
				
				reply__list.innerHTML = reply__item;
				reply.append(reply__list);
				
				const item__length = document.querySelectorAll('.reply__item');
				
				const makeAddInfo = document.createElement('div');
				makeAddInfo.classList.add('reply__info--addInfo');
				makeAddInfo.setAttribute('onclick', 'reply()');
				makeAddInfo.innerHTML = "더보기";
				
				if(data.totalCount !== item__length.length) {
					reply.append(makeAddInfo);
				}
			}
			
		
		})
	}
	
	reply();
	
	function replyOrder(order) {
		const r = document.querySelectorAll('.reply__list');
		
		r.forEach((elem)=> {
			elem.remove();
		})
		
		defaults = {...defaults, pageNumber: 1, order: order};
		reply();
	}
	
	function replySubmit() {
		const form = replyForm;
		const formData = new FormData(form);
		
		fetch("${contextPath}/insertReply.shop", {
			method: 'post',
			body: formData
		})
		.then(()=> {
			
			const r = document.querySelectorAll('.reply__list');
			
			r.forEach((elem)=> {
				elem.remove();
			})
			
			defaults = {...defaults, pageNumber: 1};
			
			reply(window); 
		}); 
		
		return false;
	}
	
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
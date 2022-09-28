<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>
<style>
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
        	margin-top: 20px;
            display: none;
        }

        .tab__content.on {
            display: block;
        }
        
        img {
        	width: 100%;
        }
        .reply__form {
        	margin-bottom: 20px;
        }
        .reply__submit {
        	float: right;
        	
        }
        .reply__list {
        	padding: 10px;
        	background: #9bbbd4;
        }
        .reply__list::after{
        	content: '';
        	display: block;
        	clear: both;
        }
        .reply__item, .reply__accom-item {
        	display: grid;
        	width: 70%;
        	min-height: 100px;
        	grid-template-columns: 8fr 2fr;
        	column-gap: 10px;
        	padding: 10px;
        }
        .reply__item {
        	position: relative;
        	background: white;
        	margin-bottom: 10px;
        	border-radius: 10px;
        	clear: both;
        }
        .reply__item::after {
			border-top: 10px solid white;
		    border-left: 10px solid transparent;
		    border-right: 10px solid transparent;
		    border-bottom: 0px solid transparent;
		    content: "";
		    position: absolute;
		    top: 50%;
		    transform: translateY(-50%);
		    left: calc(100% - 5px);
        	transform: rotate(-90deg);
        }
        .reply__accom-item {
        	position: relative;
        	background: #fef01b;
        	margin-bottom: 10px;
        	border-radius: 10px;    
        	float: right;    	
        }
        .reply__accom-item::after {
			border-top: 10px solid #fef01b;
		    border-left: 10px solid transparent;
		    border-right: 10px solid transparent;
		    border-bottom: 0px solid transparent;
		    content: "";
		    position: absolute;
		    top: 50%;
		    transform: translateY(-50%);
		    left: -15px;
        	transform: rotate(90deg);
        }
        
        .reply__accom-item {
        	border: 0px 1px 1px 1px solid black;
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
        
        .reply__image {
        	width: 30%;
        }
        
        /* room */
        
        .room__list {
        	display: grid;
        	grid-template-columns: 1fr 1fr;
        	column-gap: 20px;
        }
        .room__item {
        	height: 200px;
        	padding: 10px;
        	display: flex;
        	color: white;
        	flex-direction: column;
        	justify-content: flex-end;
        	align-items: flex-end;
        }
        .room-res__btn {
        	background: #B22222;
        	color: white;
        	text-align: center;
        	border-radius: 10px;
        	padding: 10px 20px;
        }
        
        .room-res__btn-no {
			background: #DCDCDC;    
        }
        
        /* accom */
        .accom {
        	margin-bottom: 30px;
        }
        .accom__content {
        	display: grid;
        	grid-template-columns: 2fr 1fr;
        	column-gap: 10px;
        }
        .reply__starImage {
        	position: relative;
        	left: -20px;
        	transform:scale(0.7);
        }
        .reply__remove {
        	cursor: pointer;
        }
</style>
<article>
	<div class="accom">
		<h2 class="accom__name">${accom.name }</h2>
		<p>${accom.sido }&nbsp;${accom.sigungu }&nbsp;${accom.etcAddr }</p>
		<hr>
		<div class="accom__content">
			<div class="accom__images">
				<img class="accom__image" src="${contextPath }/resources/images/${accom.image }"/>
			</div>
			<div class="accom__info">
				<p class="accom__detail-info">${accom.info }</p>
			</div>
		</div>
	</div>
</article>
<article>
	<div class="tab">
	    <ul class="tab__list">
	        <li class="tab__item"><a href="javascript: return false;" class="tab__link tab__link--1 <c:if test="${onum eq null }">on</c:if>">객실목록</a></li>
	        <li class="tab__item"><a href="javascript: return false;" class="tab__link tab__link--2 <c:if test="${onum ne null }">on</c:if>">리뷰</a></li>
	    </ul>
	    <div class="tab__content <c:if test="${onum eq null }">on</c:if>">
			<div class="room">
				<div class="room__list">
			        <c:forEach var="room" items="${lists }">
			        	<div class="room__item" style="background: url('${contextPath}/resources/images/room/${room.image }') center no-repeat;">
							<p class="room__name">${room.name }</p>
							<p class="room__price"><fmt:formatNumber value="${room.price }"></fmt:formatNumber>원</p>
							<c:if test="${room.orders > 0 }">
								<a class="room-res__btn room-res__btn--no">예약불가</a>
							</c:if>
							<c:if test="${room.orders == 0 }">
								<a class="room-res__btn room-res__btn-yes" href="${contextPath }/shop/order.shop?rnum=${room.rnum }&startDate=${start }&endDate=${end }">예약하기</a>
							</c:if>
			        	</div>
					</c:forEach>
				</div>
			</div>
	    </div>
	    <div class="tab__content <c:if test="${onum ne null }">on</c:if>">
	    	<div class="reply">
		    	<c:if test="${onum ne null}">
	    			<div class="reply__form">
				    	<form action="reviewWrite.shop" method="post" name="replyForm" enctype="multipart/form-data">
				    		<input type="hidden" name="onum" value="${onum }"/>
					        <input type="radio" name="rating" id="1" value="1" checked>
				    		<label for="1">★☆☆☆☆</label>
					        <input type="radio" name="rating" id="2" value="2">
					        <label for="2">★★☆☆☆</label>
					        <input type="radio" name="rating" id="3" value="3">
					        <label for="3">★★★☆☆</label>
					        <input type="radio" name="rating" id="4" value="4">
					        <label for="4">★★★★☆</label>
					        <input type="radio" name="rating" id="5" value="5">
					        <label for="5">★★★★★</label>
					        <textarea rows="" cols="" style="width: 100%; height: 100px;" name="content"></textarea>
					        <input type="file" name="upload"/>
					        <input class="reply__submit" type="submit" value="등록" onclick="return replySubmit()"/>
				    	</form>
	    			</div>
		    	</c:if>
		    	   		<hr>
   		<a class="reply__order reply__order-asc" onclick="replyOrder(0)">오래된순</a>
   		<a class="reply__order reply__order-desc" onclick="replyOrder(1)">최신순</a>
	    	</div>
	    </div>
	</div>
	<c:if test="${sessionScope.userInfo.email eq 'admin' }">
	
	</c:if>
</article>
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
				
			}
			else {
				data.lists.forEach((obj, i)=> {
					console.log(obj.image);
					reply__item += `<div class="reply__item">`;
					reply__item += `<div class="reply__info--content">`;
					reply__item += '<p>'+ obj.content +'</p>';
					reply__item += '<img class="reply__image" src="/travel/resources/images/reply/' + obj.image + '"/>';
					reply__item += `</div>`;
					reply__item += `<div class="reply__info--writer">`;
					reply__item += `<span>` + obj.reg_date + `</span>`;
					reply__item += `<span>`+ obj.rname +`</span>`;
					reply__item += `<span>` + obj.email + `</span>`;
					reply__item += `<span><img class="reply__starImage" src='/travel/resources/images/star/` + obj.rating + `.png'/></span>`;
					<c:if test="${sessionScope.userInfo.email eq 'admin' }">
						reply__item += '<span class="reply__remove" onclick="deleteReply(\'' + obj.rvnum +'\')">삭제</span>';
					</c:if>
					reply__item += `</div></div>`
					
					if(obj.reply !== null) {
						reply__item += `<div class="reply__accom-item">`;
						reply__item += `<div class="reply__info--content">`;
						reply__item += obj.reply
						reply__item += `</div>`;
						reply__item += `<div class="reply__info--writer">`;
						reply__item += `<span>사장님</span>`;
						reply__item += `</div></div>`						
					}
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
		});
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
		
		if(form.content.value.length == 0) {
			alert("내용을 입력 하세요");
			form.content.focus();
			return false;
		}
		
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
	function deleteReply(rvnum) {

		
		fetch("${contextPath}/deleteReply.shop", {
			method: 'post',
			headers: {
				'Content-Type': 'application/json; charset=utf-8'
			},
			body: JSON.stringify({rvnum: rvnum})
		})
		.then(()=> {
			const r = document.querySelectorAll('.reply__list');
			r.forEach((elem)=> {
				elem.remove();
			});
			defaults = {...defaults, pageNumber: 1};
			reply(window);
		});
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/comp/header.jsp" %>
<style>
	td {
		text-align: center;
	}
	td.content {
		display: inline-block;
	}
	
	td.content span {
		display: inline-block;
		width: 300px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;	
	}
	
	.reveiw_wrap__search {
		display: flex;
		justify-content: flex-end;
		align-items: center;
		margin-bottom: 10px;
	}
</style>
<section class="review_wrap">
	<article class="reveiw_wrap__search">
		<form method="get" action="${contextPath }/comp/review/list.comp">
			<select name="whatColumn">
				<option>전체</option>
				<option value="room" <c:if test="${whatColumn eq 'room'}">selected</c:if>>객실명</option>
			</select>
			<input type="text" name="keyword" value="${keyword }"/>
			<input type="submit" value="검색"/>
		</form>
	</article>
	<article>
			<table>
				<tr>
					<th width="10%">번호</th>
					<th width="10%">객실명</th>
					<th width="40%">내용</th>
					<th width="10%">작성자</th>
					<th width="10%">평점</th>
					<th width="10%">등록일</th>
					<th width="10%">답변여부</th>
				</tr>
				<c:if test="${fn:length(lists) eq 0 }">
					<tr>
						<td td colspan="7">등록된 객실이용 후기가 존재하지 않습니다.</td>
					</tr>
				</c:if>
				<c:if test="${fn:length(lists) ne 0 }">
					<tr>
						<c:forEach var="item" items="${lists }">
						<tr>
							<td>${item.rvnum }</td>
							<td>${item.rname }</td>
							<td class="content">
								<a href="${contextPath }/comp/review/detail.comp?rvnum=${item.rvnum }&pageNumber=${pageInfo.pageNumber }"><span>${item.content }</span></a>
							</td>
							<td>${item.email }</td>
							<td>${item.rating }</td>
							<td>${item.reg_date }</td>
							<c:if test="${item.reply eq null }">
								<td><font color="#FF8C00">답변대기</font></td>
							</c:if>
							<c:if test="${item.reply ne null }">
								<td><font color="#DC143C">답변완료</font></td>
							</c:if>
						</tr>
						</c:forEach>
					</tr>
				</c:if>
				<tr>
					<td colspan="7">${pageInfo.pagingHtml }</td>
				</tr>
			</table>
	</article>
</section>

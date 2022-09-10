<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/common.jsp" %>  
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/calendar.css" type="text/css"/>
<div class="calendar">
    <div class="calendar__title"></div>
    <div class="calendar__view"></div>
</div>
<script src="${pageContext.request.contextPath }/resources/js/calendar.js" type="text/javascript"></script>
<script>
	var cal = new Calendar({start: '20220919', end: '20221016'});
</script>
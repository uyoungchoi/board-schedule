<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<c:forEach var="rData" items="${rData}">
<body>
<div class="board content add">
	<div class="board add boardList">
		<div class="ib">제목</div><div class="addList div input"><input type="text" id="title" placeholder="제목" class="schedule content" value="${rData.title}"></div>
	</div>
	
	<div class="board add boardList">
		<div class="ib">내용</div><div class="addList div input"><textarea id="content" placeholder="내용" class="schedule content data">${rData.content}</textarea></div>
		<!-- <div><input type="button" class="yesSelect" value="일정" onclick="resize(this)"></div> -->
	</div>
	
	<div class="board add boardList">
		<div class="addList div">
			<c:if test="${rData.useCalendar eq '0'}">
				<input type="checkbox" value="useCalendar" id="useCalendar" onclick="useCalendar(this)"><label for="useCalendar">달력연동</label>
			</c:if>
			<c:if test="${rData.useCalendar eq '1'}">
				<input type="checkbox" value="useCalendar" id="useCalendar" onclick="useCalendar(this)" checked><label for="useCalendar">달력연동</label>
			</c:if>
		</div>
	</div>
	
	<div class="board add boardList">
		<div class="addList div">
			<c:if test="${rData.useShare eq '0'}">
				<input type="checkbox" value="useShare" id="useShare"><label for="useShare">공유일정</label>
			</c:if>
			<c:if test="${rData.useShare eq '1'}">
				<input type="checkbox" value="useShare" id="useShare" checked><label for="useShare">공유일정</label>
			</c:if>
		</div>
	</div>
	
	<div class="board add boardList">
		<c:if test="${book.content eq ''}">
			<input type="text" class="board add datepicker" id="startDate" value="${rData.startDate}">
			<input type="text" class="board add datepicker" id="endDate" value="${rData.endDate}">
		</c:if>
	</div>
	
	<div class="board add boardList">
		<div class="addList div"><input type="button" id="addList" onclick="addList()" value="일정수정"></div>
	</div>
</div>
</body>
</c:forEach>
</html>
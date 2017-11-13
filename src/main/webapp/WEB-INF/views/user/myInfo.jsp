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


<body>
<c:forEach var="myInfo" items="${myInfo}">
<div class="board content add">
<div class="board add boardList">
	<div class="ib">아이디</div><div class="login div input"><input type="text" id="id" value="${myInfo.id}" class="schedule content" disabled></div>
</div>
<div class="board add boardList">
	<div class="ib">비밀번호</div><div class="login div input"><input type="text" id="id" value="${myInfo.number}" class="schedule content"></div>
</div>
<div class="board add boardList">
	<div class="ib">비밀번호 확인</div><div class="login div input"><input type="text" id="id" value="${myInfo.number}" class="schedule content"></div>
</div>
<div class="board add boardList">
	<div class="ib">이름</div><div class="login div input"><input type="text" id="id" value="${myInfo.name}" class="schedule content"></div>
</div>
<input type="button" value="수정" onclick="modify()">
</div>
</c:forEach>
</body>
</html>
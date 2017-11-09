<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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

<div class="home login id">아이디</div><input type="text" id="id">
<div class="home login passwd">패스워드</div><input type="text" id="passwd">
<div class="home login passwd">패스워드 확인</div><input type="text" id="chkPasswd">
<div class="home login id">이름</div><input type="text" id="name">
<div class="home login login" id="login" onclick="login()">로그인</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/allCss.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<script>
function login(){
	$.ajax({
        url : 'home/login.do',
        method : 'GET',
        async : false
    });
}
function logout(){
	//쿠키제거
}
function myInfo(){
	//내 정보 보기
	$.ajax({
        url : 'home/myInfo.do',
        method : 'GET',
        async : false
    });
}
function join(){
	//회원가입
	$.ajax({
        url : 'home/join.do',
        method : 'GET',
        async : false
    });
}
</script>
<body>
<div class="header home">

<a href="#" onclick="login()">로그인 |</a>
<a href="#" onclick="join()">회원가입 </a>

<a href="#" onclick="logout()">로그아웃 |</a>
<a href="#" onclick="myInfo()">내정보</a></div> 
</body>
</html>
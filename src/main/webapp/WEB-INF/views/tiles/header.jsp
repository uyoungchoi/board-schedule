<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<% session = request.getSession(); %>
<link rel="stylesheet" type="text/css" href="resources/css/allCss.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<script>
function loginPage(){
	$.ajax({
        url : 'home/loginPage.do',
        method : 'POST',
        async : false,
        success : function(){
        	history.go(-1);
        }
    });
}
function logoutPage(){
	//쿠키제거
}
function myInfoPage(){
	//내 정보 보기
	$.ajax({
        url : 'home/myInfo.do',
        method : 'POST',
        async : false
    });
}
function joinPage(){
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
<% if(session.getValue("id") == null){ %>
<a href="#" onclick="loginPage()">로그인 |</a>
<a href="#" onclick="joinPage()">회원가입 </a>
<%}else{%>
<a href="#" onclick="logoutPage()">로그아웃 |</a>
<a href="#" onclick="myInfoPage()">내정보</a></div> 
<%}%>
</body>
</html>
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
	//��Ű����
}
function myInfo(){
	//�� ���� ����
	$.ajax({
        url : 'home/myInfo.do',
        method : 'GET',
        async : false
    });
}
function join(){
	//ȸ������
	$.ajax({
        url : 'home/join.do',
        method : 'GET',
        async : false
    });
}
</script>
<body>
<div class="header home">

<a href="#" onclick="login()">�α��� |</a>
<a href="#" onclick="join()">ȸ������ </a>

<a href="#" onclick="logout()">�α׾ƿ� |</a>
<a href="#" onclick="myInfo()">������</a></div> 
</body>
</html>
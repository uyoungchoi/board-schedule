<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script>
function login(){
	$.ajax({
        url : 'home/login.do',
        method : 'POST',
        data : {
        	"id" : $("#id"),
        	"passwd" : $("#passwd")
        },
        async : false,
        success(data){
        	alert("로그인 성공!!");
        	//캐시생성
        }
    });
}
</script>

<body>

<div class="home login id">아이디</div><input type="text" id="id">
<div class="home login passwd">패스워드</div><input type="text" id="passwd">
<div class="home login login" id="login" onclick="login()">로그인</div>

</body>
</html>
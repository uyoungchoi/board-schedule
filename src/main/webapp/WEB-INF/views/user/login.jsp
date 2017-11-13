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
<script>
function login(){
	$.ajax({
        url : 'user/login.do',
        method : 'POST',
        data : {
        	"id" : $("#id").val(),
        	"passwd" : $("#passwd").val()
        },
        async : false,
        success : function(data){
        	debugger;
        	if(data.result == 1){
        		alert("로그인 성공!!");
        		window.location.reload();
        	} else {
        		alert("아이디나 비밀번호를 확인해주세요");
        		return false;
        	}
        }, 
        error : function(error, status){
        	alert("서버오류 발생! 관리자에게 문의해주세요");
        	return false;
        }
    });
}
</script>

<body>
<div class="board content add">
<div class="board add boardList">
	<div class="ib">아이디</div><div class="login div input"><input type="text" id="id" placeholder="아이디" class="schedule content"></div>
</div>
<div class="board add boardList">
	<div class="ib">패스워드</div><div class="login div input"><input type="password" id="passwd" placeholder="비밀번호" class="schedule content"></div>
</div>
<input type="button" value="로그인" onclick="login()">
</div>
</body>
</html>
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
function join(){
	if($("#passwd").val()!=$("#chkPasswd").val()){
		alert("비밀번호가 일치하지 않습니다.")
		return false;
	}else{
		$.ajax({
	        url : 'log/join.do',
	        method : 'POST',
	        data : {
	        	"id" : $("#id").val(),
	        	"passwd" : $("#passwd").val(),
	        	"name" : $("#name").val()
	        },
	        async : false,
	        success : function(data){
	        	alert("회원가입 성공!!");
	        	$(".content.home").html(data);
	        }
	    });
	}
}
</script>
<style>
div.ib{
	width:150px;
}
</style>
<body>
<form>
	<div class="board content add">
	<div class="board add boardList"><div class="ib">아이디</div><div class="login div input"><input type="text" id="id" class="schedule content" required></div></div>
	<div class="board add boardList"><div class="ib">패스워드</div><div class="login div input"><input type="password" id="passwd" class="schedule content" required></div></div>
	<div class="board add boardList"><div class="ib">패스워드 확인</div><div class="login div input"><input type="password" id="chkPasswd" class="schedule content" required></div></div>
	<div class="board add boardList"><div class="ib">이름</div><div class="login div input"><input type="text" id="name" class="schedule content" required></div></div>
	<input type="submit" value="회원가입" onclick="join()">
	</div>
</form>
</body>
</html>
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
        url : 'log/login.do',
        method : 'POST',
        data : {
        	"id" : $("#id").val(),
        	"passwd" : $("#passwd").val()
        },
        async : false,
        success : function(data){
        	alert("�α��� ����!!");
        	$(".content.home").load("/schedule/scheduleHome.do");
        	window.location.reload();
        }
    });
}
</script>

<body>
<div class="board content add">
<div class="board add boardList">
	<div class="ib">���̵�</div><div class="login div input"><input type="text" id="id" placeholder="���̵�" class="schedule content"></div>
</div>
<div class="board add boardList">
	<div class="ib">�н�����</div><div class="login div input"><input type="text" id="passwd" placeholder="��й�ȣ" class="schedule content"></div>
</div>
<input type="button" value="�α���" onclick="login()">
</div>
</body>
</html>
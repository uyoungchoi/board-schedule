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
        	alert("�α��� ����!!");
        	//ĳ�û���
        }
    });
}
</script>

<body>

<div class="home login id">���̵�</div><input type="text" id="id">
<div class="home login passwd">�н�����</div><input type="text" id="passwd">
<div class="home login login" id="login" onclick="login()">�α���</div>

</body>
</html>
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
	debugger;
	$.ajax({
        url : 'log/loginPage.do',
        method : 'POST',
        async : false,
        success : function(data){
        	$(".content.home").html(data);
        	alert("success");
        },
        error : function(data){
        	alert(data);
        }
    });
	
}
function logout(){
	//��Ű����
	$.ajax({
        url : 'log/logout.do',
        method : 'POST',
        async : false,
        success : function(data){
        	alert("�α׾ƿ��� �Ϸ�Ǿ����ϴ�.");
        	window.location.reload();
        },
        complete : function(data){
        	alert("�α׾ƿ��� �Ϸ�Ǿ����ϴ�.");
        	window.location.reload();
        }
    });
}
function myInfoPage(){
	//�� ���� ����
	$.ajax({
        url : 'home/myInfo.do',
        method : 'POST',
        async : false
    });
}
function joinPage(){
	//ȸ������
	$.ajax({
        url : '/log/joinPage.do',
        method : 'POST',
        async : false,
        success : function(data){
        	$(".content.home").html(data);
        }
    });
}
</script>
<body>
<div class="header home">
<%="session : "+session.getValue("id") %>
<% if(session.getValue("id") == null){ %>
<a href="#" onclick="loginPage()">�α��� |</a>
<a href="#" onclick="joinPage()">ȸ������ </a>
<%}else{%>
<a href="#" onclick="logout()">�α׾ƿ� |</a>
<a href="#" onclick="myInfoPage()">������</a></div> 
<%}%>
</body>
</html>
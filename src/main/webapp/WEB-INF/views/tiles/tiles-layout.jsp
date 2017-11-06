<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="resources/css/allCss.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
#tiles.header{

}
#tiles.content-header{

}
#tiles.content-body{

}
#tiles.footer{

}
</style>
<script>
$( document ).ready(function() {
	//ó�� ����� �� �۾�
	
	$("#boardContent").css("display", "none"); //ó������ ������ �����ְ� �׼��� ���� ��� �Խ����� ������.
	
	$("#schedule").	attr("onclick", "toggle");
	$("#board").	attr("onclick", "toggle");  //toggle�Լ� ȣ��
	
	$(".content.home").load("/schedule/scheduleHome.do");
});
function onComplete(){
	$(".board.add.addBoard").css("display", "none");
	$("#board.add.content").resizable();
	$(".board.add.datepicker").datepicker();
}

function toggle(data){
	if(data.getAttribute("name")=="board"){   //���̴� ȭ�� ����(�Խ��� Ŭ����)
		$(".content.home").load("/board/list.do");
		/* $("#boardContent").css("display", "block");
		$("#scheduleContent").css("display", "none"); */
		
		$('[name=board]').attr("class", "yesSelect");
		$('[name=schedule]').attr("class", "noSelect");
		
	}else{
		$(".content.home").load("/schedule/scheduleHome.do");
		/* $("#boardContent").css("display", "none");
		$("#scheduleContent").css("display", "block");*/
		
		$('[name=board]').attr("class", "noSelect");
		$('[name=schedule]').attr("class", "yesSelect");
	}
}
function onload(){
}
</script>
</head>
<body>

	<div id="tiles header">
		<tiles:insertAttribute name="header_tiles" />
	</div>
	
	<div id="tiles content-header">
		<tiles:insertAttribute name="contentHeader_tiles"/>
	</div>
	
	<div id="tiles content-body" onload = "onload()">
		<div class="subTitle home">
			<input type="button" class="yesSelect" value="����" onclick="toggle(this)" name="schedule">	
			<input type="button" class="noSelect" value="�Խ���" onclick="toggle(this)" name="board">
		</div>
		<div class="content home"></div>
	</div>
	
	<div id="tiles footer">
		<tiles:insertAttribute name="footer_tiles"/>
	</div>

</body>
</html>
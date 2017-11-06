<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
</head>
<body>

	<div id="tiles header">
		<tiles:insertAttribute name="header"/>
	</div>
	
	<div id="tiles content-header">
		<tiles:insertAttribute name="content-header"/>
	</div>
	
	<div id="tiles content-body">
		<tiles:insertAttribute name="content-body"/>
	</div>
	
	<div id="tiles footer">
		<tiles:insertAttribute name="footer"/>
	</div>

</body>
</html>
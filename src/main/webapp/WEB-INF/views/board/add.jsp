<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
function resize(data){
	//textarea 사이즈 변경 + 화살표를 아래로 향하게
}
</script>
</head>
<body>
<table class="boardList">
	<tbody>
	
		<tr class="boardList">
			<td>제목</td><td><div class="addList div"><input type="text" id="title" placeholder="제목"></div></td>
		</tr>
		
		<tr class="boardList">
			<td>내용</td><td><div class="addList div"><input type="text" id="content" placeholder="내용"></div>
			<div><input type="button" class="yesSelect" value="일정" onclick="resize(this)"></div></td>
		</tr>
		
		<tr class="boardList">
			<td></td><td><div class="addList div"><input type="checkbox" value="useCalendar">달력연동</div></td>
		</tr>
		
		<tr class="boardList">
			<td></td><td><div class="addList div"><input type="text" id="title" placeholder="아이디"></div></td>
		</tr>
		
		<div id="addSchedule">
		
			<tr class="boardList">
				<td></td><td><div class="addList div"><input type="text" id="title" placeholder="아이디"></div></td>
			</tr>
			
			<tr class="boardList">
				<td></td><td><div class="addList div"><input type="text" id="title" placeholder="아이디"></div></td>
			</tr>
			
			<tr class="boardList">
				<td></td><td><div class="addList div"><input type="text" id="title" placeholder="아이디"></div></td>
			</tr>
			
		</div>
	</tbody>
</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
function resize(data){
	//textarea ������ ���� + ȭ��ǥ�� �Ʒ��� ���ϰ�
}
</script>
</head>
<body>
<table class="boardList">
	<tbody>
	
		<tr class="boardList">
			<td>����</td><td><div class="addList div"><input type="text" id="title" placeholder="����"></div></td>
		</tr>
		
		<tr class="boardList">
			<td>����</td><td><div class="addList div"><input type="text" id="content" placeholder="����"></div>
			<div><input type="button" class="yesSelect" value="����" onclick="resize(this)"></div></td>
		</tr>
		
		<tr class="boardList">
			<td></td><td><div class="addList div"><input type="checkbox" value="useCalendar">�޷¿���</div></td>
		</tr>
		
		<tr class="boardList">
			<td></td><td><div class="addList div"><input type="text" id="title" placeholder="���̵�"></div></td>
		</tr>
		
		<div id="addSchedule">
		
			<tr class="boardList">
				<td></td><td><div class="addList div"><input type="text" id="title" placeholder="���̵�"></div></td>
			</tr>
			
			<tr class="boardList">
				<td></td><td><div class="addList div"><input type="text" id="title" placeholder="���̵�"></div></td>
			</tr>
			
			<tr class="boardList">
				<td></td><td><div class="addList div"><input type="text" id="title" placeholder="���̵�"></div></td>
			</tr>
			
		</div>
	</tbody>
</table>
</body>
</html>
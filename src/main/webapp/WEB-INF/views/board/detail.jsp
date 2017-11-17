<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<% session = request.getSession(); %>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
function modifyList(){
	<%if(session.getValue("id") != null){ %>
		//���� ���ǰ� ���ۼ��ڰ� ���� ��츸 ���� ����
		<%if(session.getValue("id").equals("$('#writer').val()")){ %>
		
		<% }else{ %>
			alert("�ۼ��ڸ� ������ �� �ֽ��ϴ�.");
		<% }%>
	<% }else{ %>
 		alert("�α����� �ʿ��մϴ�.");
 <% }%>
}
</script>
</head>
<c:forEach var="rData" items="${rData}">
<body>
<div class="board content add">
	<div class="board add boardList">
		<div class="ib">����</div><div class="addList div input"><input type="text" id="title" class="schedule content" value="${rData.title}"></div>
	</div>
	
	<div class="board add boardList">
		<div class="ib">����</div><div class="addList div input"><textarea id="content" class="schedule content data">${rData.content}</textarea></div>
		<!-- <div><input type="button" class="yesSelect" value="����" onclick="resize(this)"></div> -->
	</div>
	
	<div class="board add boardList" style="display:none">
		<input type="text" id="writer" class="schedule content" value="${rData.writer}"><!-- �ۼ��ڴ� ������ ��� -->
	</div>
	
	<div class="board add boardList">
		<div class="addList div">
			<c:if test="${rData.useCalendar eq '0'}">
				<input type="checkbox" value="useCalendar" id="useCalendar" onclick="useCalendar(this)"><label for="useCalendar">�޷¿���</label>
			</c:if>
			<c:if test="${rData.useCalendar eq '1'}">
				<input type="checkbox" value="useCalendar" id="useCalendar" onclick="useCalendar(this)" checked><label for="useCalendar">�޷¿���</label>
			</c:if>
		</div>
	</div>
	
	<div class="board add boardList">
		<div class="addList div">
			<c:if test="${rData.useShare eq '0'}">
				<input type="checkbox" value="useShare" id="useShare"><label for="useShare">��������</label>
			</c:if>
			<c:if test="${rData.useShare eq '1'}">
				<input type="checkbox" value="useShare" id="useShare" checked><label for="useShare">��������</label>
			</c:if>
		</div>
	</div>
	
	<div class="board add boardList">
		<c:if test="${book.content eq ''}">
			<input type="text" class="board add datepicker" id="startDate" value="${rData.startDate}">
			<input type="text" class="board add datepicker" id="endDate" value="${rData.endDate}">
		</c:if>
	</div>
	
	<div class="board add boardList">
		<div class="addList div"><input type="button" id="addList" onclick="modifyList()" value="��������"></div>
	</div>
</div>
</body>
</c:forEach>
</html>
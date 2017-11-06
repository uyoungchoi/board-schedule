<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>
	�Խ��� �ۼ�
</title>
<script>
	//�� ���
	function addListPage(){
		 $.ajax({
		    url : 'board/addPage.do',
		    method : 'GET',
		    async : false,
		    error : function(error, message) {
		        alert(error);
		        alert(message);
		        debugger;
		    },
		    success : function(data) {
		        $('.content.home').html(data);
		    },
		    complete : function() {
		    }
		}); 
		/* $('.content.home').load("/board/add.jsp"); */
	}
	
	//�� ����
	function deleteList(){
		$.ajax({
		    url : '/board/delete.do',
		    method : 'GET',
		    async : false,
		    error : function(error) {
		        alert("Error!");
		    },
		    success : function(data) {
		        alert("success!");
		    },
		    complete : function() {
		        alert("complete!");    
		    }
		});
	}
	//���ΰ�ħ
	function refreshList(){
		$.ajax({
		    url : '/board/list.do',
		    method : 'GET',
		    async : false,
		    error : function(error) {
		        alert("Error!");
		    },
		    success : function(data) {
		        alert("success!");
		    },
		    complete : function() {
		        alert("complete!");    
		    }
		});
	}
</script>

<style>
.board.list.boardList{
	
}
</style>
</head>
<body>
<div>
	<button id="addList" onclick="addListPage()"><i class="fa fa-pencil" aria-hidden="true"></i>�ۼ�</button> &nbsp;&nbsp;
	<button id="deleteList"><i class="fa fa-times"></i>�輼</button>  &nbsp;&nbsp;
	<button id="refreshList"><i class="fa fa-refresh"></i>���ΰ�ħ</button>  &nbsp;&nbsp;
	<input type="text" id="searchText" size=20>
	<button id="searchList">�˻�</button>
</div>
<table class="boardList">
	<thead class="board list boardList">
		<tr align="center" class="boardList">
			<td width="50px">����</td>
	        <td width="200px">�۹�ȣ</td>
	        <td width="200px">����</td>
	        <td width="100px">�ۼ���</td>
	        <td width="100px">�ۼ���</td>
	        <!-- 
	        <td width="100px">�ۼ���</td>
	        <td width="100px">������</td>
	        <td width="100px">������</td>
	        <td width="100px">����</td>
	        <td width="200px">���� ����</td>
	        <td width="200px">����</td> -->
	    </tr>
	</thead>
		<tbody  class="boardList">
		<c:forEach var="book" items="${books}">
		    <tr align="center" class="boardList">
		        <td><input type="checkbox" value="${book.number}"></td>
		        <td>${book.number}</td>
		        <td>${book.title}</td>
		        <td>${book.writer}</td>
		        <td>${book.writeDate}</td>
		        <%-- 
		        <td>${book.startDate}</td>
		        <td>${book.endDate}</td>
		        <td>${book.shareAcl}</td>
		        <td>${book.loofQuery}</td>
		        <td>${book.content}</td> --%>
		    </tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr class="boardList"><td>//����¡ó��</td></tr>
	</tfoot>
</table>
</body>
</html>
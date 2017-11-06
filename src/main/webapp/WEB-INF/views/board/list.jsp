<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>
	게시판 작성
</title>
<script>
	//글 등록
	function addListPage(){
		 $.ajax({
		    url : 'board/addPage.do',
		    method : 'GET',
		    async : false,
		    error : function(error, message) {
		        alert(error);
		        alert(message);
		    },
		    success : function(data) {
		        $('.content.home').html(data);
		    },
		    complete : function() {
		    }
		}); 
		/* $('.content.home').load("/board/add.jsp"); */
	}
	
	//글 삭제
	function deleteList(){
		var deleteDatas = [];
		$('#boardList input:checked').each(function() {
			deleteDatas.push(this.value);
        });
		debugger;
		$.ajax({
		    url : '/board/delete.do',
		    method : 'GET',
		    data : {
		    	"deleteDatas" : JSON.stringify(deleteDatas),
		    	"length" : deleteDatas.length
		    },
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
	//새로고침
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
	<button id="addList" onclick="addListPage()"><i class="fa fa-pencil" aria-hidden="true"></i>작성</button> &nbsp;&nbsp;
	<button id="deleteList" onclick="deleteList()"><i class="fa fa-times"></i>삭세</button>  &nbsp;&nbsp;
	<button id="refreshList"><i class="fa fa-refresh"></i>새로고침</button>  &nbsp;&nbsp;
	<input type="text" id="searchText" size=20>
	<button id="searchList">검색</button>
</div>
<table class="boardList">
	<thead class="board list boardList">
		<tr align="center" class="boardList">
			<td width="10%">삭제</td>
	        <td width="15%">글번호</td>
	        <td width="35%">제목</td>
	        <td width="10%">작성자</td>
	        <td width="20%">작성일</td>
	        <!-- 
	        <td width="100px">작성일</td>
	        <td width="100px">시작일</td>
	        <td width="100px">종료일</td>
	        <td width="100px">권한</td>
	        <td width="200px">루프 쿼리</td>
	        <td width="200px">내용</td> -->
	    </tr>
	</thead>
		<tbody id="boardList" class="boardList">
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
		<tr class="boardList"><td>//페이징처리</td></tr>
	</tfoot>
</table>
</body>
</html>
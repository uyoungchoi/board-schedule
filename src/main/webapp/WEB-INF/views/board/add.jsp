<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<title>Insert title here</title>

<script>

	$(window).on('load',function() {
	alert("ㅁ");
	});
	function onload(){
		//처음 실행시 할 작업
		debugger;
		$(".board.add.addBoard").css("display", "none");
		$("#board.add.content").resizable();
		$(".board.add.datepicker").datepicker();
	}
	
	function resize(data){
		//textarea 사이즈 변경 + 화살표를 아래로 향하게
	}
	
	function useCalendar(data){
		if($( "input#useCalendar:checked" ).val() == undefined) //체크가 안되있을 경우
			$(".board.add.addBoard").css("display", "none")
		else
			$(".board.add.addBoard").css("display", "block")
	}
	
	function addList(){
		var useCalendar = 0; //사용안함.
		
		if($( "input#useCalendar:checked" ).val() == undefined){
			useCalendar = 0;
		}else{
			userCalendar = 1;
		}
		
		$.ajax({
		    url : '/board/list.do',
		    method : 'GET',
		    async : false,
		    data : {
		    	"title" : $("#title").value(),
		    	"content" : $("#content").value(),
		    	"userCalendar" : useCalendar
		    },
		    error : function(error) {
		        alert("Error!");
		    },
		    success : function(data) {
		        alert("등록되었습니다.");
		        //게시판 홈으로 이동
		    },
		    complete : function() {
		        alert("complete!");    
		    }
		});
	}
	
</script>

<style>
	.board.add.addBoard{
		padding-left:20px;
		
	}
	.board.add.boardList div{
		display:inline-block;
		padding:10px;
	}
</style>

</head>
<body onload="alert('a')">
		<div class="board add boardList">
			<div>제목</div><div class="addList div"><input type="text" id="title" placeholder="제목"></div>
		</div>
		
		<div class="board add boardList">
			<div>내용</div><div class="addList div"><input type="text" id="content" placeholder="내용"></div>
			<!-- <div><input type="button" class="yesSelect" value="일정" onclick="resize(this)"></div> -->
		</div>
		
		<div class="board add boardList">
			<div></div><div class="addList div"><input type="checkbox" value="useCalendar" id="useCalendar" onclick="useCalendar(this)"><label for="useCalendar">달력연동</label></div>
		</div>
		
		<div class="board add boardList">
			<div></div><div class="addList div"><input type="checkbox" value="useShare" id="useShare" selected><label for="useShare">공유일정</label></div>
		</div>
		
		<div class="board add addBoard" style="display:none;">
			<!-- <div class="board add boardList"> //반복쿼리
				<input type="text" class="board add datepicker">
			</div> -->
			<div class="board add boardList">
				<input type="text" class="board add datepicker">
			</div>
		</div>
		
		<div class="board add boardList">
			<div class="addList div"><input type="button" id="addList" onclick="addList()" value="일정등록"></div>
		</div>
</body>
</html>
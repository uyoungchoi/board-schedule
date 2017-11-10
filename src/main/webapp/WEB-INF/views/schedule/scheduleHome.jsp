<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
</head>
<script>
$( document ).ready(function() {
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
	var calendar = new controller(); 
	calendar.init();
	
	function controller(target) {
		var that = this;   
		var m_oMonth = new Date();
		m_oMonth.setDate(1);
	
		this.init = function() {
			that.renderCalendar();
			that.initEvent();
		}
	
	    /* 달력 UI 생성 */
		this.renderCalendar = function() {
			var arrTable = [];
	
			arrTable.push('<table><colgroup>');
			for(var i=0; i<7; i++) {
				arrTable.push('<col width="100">');
			}		
			arrTable.push('</colgroup><thead><tr>');
	
			var arrWeek = "일월화수목금토".split("");
			
			//요일을 그리는 부분
			for(var i=0, len=arrWeek.length; i<len; i++) {
				var sClass = '';
				sClass += i % 7 == 0 ? ' sun' : '';
				sClass += i % 7 == 6 ? ' sat' : '';
				arrTable.push('<td class="date'+sClass+'">' + arrWeek[i] + '</td>');
			}
			arrTable.push('</tr"></thead>');
			arrTable.push('<tbody>');
	
			var oStartDt = new Date(m_oMonth.getTime());
	        // 1일에서 1일의 요일을 빼면 그 주 첫번째 날이 나온다.
			oStartDt.setDate(oStartDt.getDate() - oStartDt.getDay());
	
			for(var i=0; i<100; i++) {
				if(i % 7 == 0) {
					arrTable.push('<tr>');
				}
				
				//현재달이 아닌 날짜 선택
				var sClass = 'date-cell '
	            sClass += m_oMonth.getMonth() != oStartDt.getMonth() ? 'not-this-month ' : '';
				sClass += i % 7 == 0 ? 'sun' : '';
				sClass += i % 7 == 6 ? 'sat' : '';
				
				//이번달인 날짜 선택
				arrTable.push('<td class="'+sClass+'" onclick="addSchedulePopup(this)" value="'+oStartDt.getDate()+'">' + oStartDt.getDate() + '</td>');
				oStartDt.setDate(oStartDt.getDate() + 1);
	
				if(i % 7 == 6) {
					arrTable.push('</tr>');
					if(m_oMonth.getMonth() != oStartDt.getMonth()) {
						break;
					}
				}
			}
			arrTable.push('</tbody></table>');
	
			$('#calendar').html(arrTable.join(""));
	
			that.changeMonth();
		}
	
	    /* Next, Prev 버튼 이벤트 */
		this.initEvent = function() {
			$('#btnPrev').click(that.onPrevCalendar);
			$('#btnNext').click(that.onNextCalendar);
		}
	
	    /* 이전 달력 */
		this.onPrevCalendar = function() {
			m_oMonth.setMonth(m_oMonth.getMonth() - 1);
			that.renderCalendar();
		}
	
	    /* 다음 달력 */
		this.onNextCalendar = function() {
			m_oMonth.setMonth(m_oMonth.getMonth() + 1);
			that.renderCalendar();
		}
	
	    /* 달력 이동되면 상단에 현재 년 월 다시 표시 */
		this.changeMonth = function() {
			$('#currentDate').text(that.getYearMonth(m_oMonth).substr(0,9));
		}
	
	    /* 날짜 객체를 년 월 문자 형식으로 변환 */
		this.getYearMonth = function(oDate) {
			return oDate.getFullYear() + '년 ' + (oDate.getMonth() + 1) + '월';
		}
	}
});
function addSchedulePopup(data){
	//div를 그림..
	debugger;
	var $href = window.event;
	$href.pageX;
	
	//현재 마우스 좌표를 가져와서
	var event = window.event;
	var xData = event.screenX;
	var yData = event.screenY;
	
	//div를 그리고
	$('.schedule.addSchedulePopup').css("display", "inline-block");
	$('#timePopup').text()
	
	//클릭한 날짜를 가져옴.
	data.getAttribute("value")
	
	//위치 세팅
	$('.schedule.addSchedulePopup').css("top", $href.pageY);
	$('.schedule.addSchedulePopup').css("left", $href.pageX);
	
	$('#titlePopup').focus();
	
	$("#month").text($(data).parent().parent().parent().parent().parent().children(".btn").children("#currentDate").text());
	$("#date").text($(data).text());
	
}
function closeSchedulePopup(){
	debugger;
	$('.schedule.addSchedulePopup').css("display", "none");
}
function addPopup(){
	<%if(session.getValue("id") != null){ %>
		var useShare = 0;
		
		if($( "input#useCalendar:checked" ).val() == undefined){
			useCalendar = 0;
		}else{
			useCalendar = 1;
		}
		debugger;
		var startDate = $("#month").text().concat($("#date").text());
		var endDate = $("#month").text().concat($("#date").text());
	
		startDate = ""+startDate.slice(0, 4) +"-"+ startDate.slice(6, 8) +"-"+ startDate.slice(9, 11);
		endDate = ""+endDate.slice(0, 4) +"-"+ endDate.slice(6, 8) +"-"+ endDate.slice(9, 11);
		
		$.ajax({
			data : {
				"title" : $('#titlePopup').val(),
				"content" : $("month").val()+$("date").val(),
				"useShare" : useCalendar,
				"startDate" : startDate,
				"endDate" : startDate,
			},
	        url : 'schedule/addSchedule.do',
	        method : 'GET',
	        async : false,
		    error : function(error) {
		        alert("Error!");
		    },
		    success : function(data) {
		        alert("등록되었습니다.");
		        $(".content.home").load("/board/list.do");
		        //게시판 홈으로 이동
		    }
	    });
	<% }else{ %>
	 	alert("로그인을 해야 이용할 수 있습니다.");
	 <% }%>
}
</script>
<style>

</style>
<body>
<div class='schedule wrap'>
	<div class='schedule btn'>
		<button id='btnPrev'>&lt;</button>
		 <span id='currentDate'></span> 
		<button id='btnNext'>&gt;</button>
	</div>
	
	<div id="calendar"></div>
	
	<div class="schedule addSchedulePopup" style="display:none">
		&nbsp;&nbsp;<div class="ibPopup">일정등록</div><i class="fa fa-times" onclick="closeSchedulePopup()"></i><br><br>
		<div class="ibPopup">제목</div>&nbsp;<input type="text" placeholder="제목없음" id="titlePopup"><br>
		<div class="ibPopup">시간</div>&nbsp;<div id="month" class="ibPopup schedule popup data"></div>&nbsp;<div id="date" class="ibPopup schedule popup data"></div>일<br><br>
		<div class="ibPopup"><input type="checkbox" value="useShare" id="useShare" selected><label for="useShare">공유일정</label></div><br><br>
		
		<input type="button" value="등록" class="yesSelect" onclick="addPopup()">
	</div>
</div>
</body>
</html>
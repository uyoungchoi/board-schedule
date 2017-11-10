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
	
	    /* �޷� UI ���� */
		this.renderCalendar = function() {
			var arrTable = [];
	
			arrTable.push('<table><colgroup>');
			for(var i=0; i<7; i++) {
				arrTable.push('<col width="100">');
			}		
			arrTable.push('</colgroup><thead><tr>');
	
			var arrWeek = "�Ͽ�ȭ�������".split("");
			
			//������ �׸��� �κ�
			for(var i=0, len=arrWeek.length; i<len; i++) {
				var sClass = '';
				sClass += i % 7 == 0 ? ' sun' : '';
				sClass += i % 7 == 6 ? ' sat' : '';
				arrTable.push('<td class="date'+sClass+'">' + arrWeek[i] + '</td>');
			}
			arrTable.push('</tr"></thead>');
			arrTable.push('<tbody>');
	
			var oStartDt = new Date(m_oMonth.getTime());
	        // 1�Ͽ��� 1���� ������ ���� �� �� ù��° ���� ���´�.
			oStartDt.setDate(oStartDt.getDate() - oStartDt.getDay());
	
			for(var i=0; i<100; i++) {
				if(i % 7 == 0) {
					arrTable.push('<tr>');
				}
				
				//������� �ƴ� ��¥ ����
				var sClass = 'date-cell '
	            sClass += m_oMonth.getMonth() != oStartDt.getMonth() ? 'not-this-month ' : '';
				sClass += i % 7 == 0 ? 'sun' : '';
				sClass += i % 7 == 6 ? 'sat' : '';
				
				//�̹����� ��¥ ����
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
	
	    /* Next, Prev ��ư �̺�Ʈ */
		this.initEvent = function() {
			$('#btnPrev').click(that.onPrevCalendar);
			$('#btnNext').click(that.onNextCalendar);
		}
	
	    /* ���� �޷� */
		this.onPrevCalendar = function() {
			m_oMonth.setMonth(m_oMonth.getMonth() - 1);
			that.renderCalendar();
		}
	
	    /* ���� �޷� */
		this.onNextCalendar = function() {
			m_oMonth.setMonth(m_oMonth.getMonth() + 1);
			that.renderCalendar();
		}
	
	    /* �޷� �̵��Ǹ� ��ܿ� ���� �� �� �ٽ� ǥ�� */
		this.changeMonth = function() {
			$('#currentDate').text(that.getYearMonth(m_oMonth).substr(0,9));
		}
	
	    /* ��¥ ��ü�� �� �� ���� �������� ��ȯ */
		this.getYearMonth = function(oDate) {
			return oDate.getFullYear() + '�� ' + (oDate.getMonth() + 1) + '��';
		}
	}
});
function addSchedulePopup(data){
	//div�� �׸�..
	debugger;
	var $href = window.event;
	$href.pageX;
	
	//���� ���콺 ��ǥ�� �����ͼ�
	var event = window.event;
	var xData = event.screenX;
	var yData = event.screenY;
	
	//div�� �׸���
	$('.schedule.addSchedulePopup').css("display", "inline-block");
	$('#timePopup').text()
	
	//Ŭ���� ��¥�� ������.
	data.getAttribute("value")
	
	//��ġ ����
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
		        alert("��ϵǾ����ϴ�.");
		        $(".content.home").load("/board/list.do");
		        //�Խ��� Ȩ���� �̵�
		    }
	    });
	<% }else{ %>
	 	alert("�α����� �ؾ� �̿��� �� �ֽ��ϴ�.");
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
		&nbsp;&nbsp;<div class="ibPopup">�������</div><i class="fa fa-times" onclick="closeSchedulePopup()"></i><br><br>
		<div class="ibPopup">����</div>&nbsp;<input type="text" placeholder="�������" id="titlePopup"><br>
		<div class="ibPopup">�ð�</div>&nbsp;<div id="month" class="ibPopup schedule popup data"></div>&nbsp;<div id="date" class="ibPopup schedule popup data"></div>��<br><br>
		<div class="ibPopup"><input type="checkbox" value="useShare" id="useShare" selected><label for="useShare">��������</label></div><br><br>
		
		<input type="button" value="���" class="yesSelect" onclick="addPopup()">
	</div>
</div>
</body>
</html>